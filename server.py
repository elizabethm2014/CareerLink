import re, MySQLdb
from bottle import route, run, template, response, static_file, request, get, post

tags = {}
companies = {}
fave_comp = []
doc = {}
db = MySQLdb.connect(host="localhost", user="hci", passwd="hci",db="career")
cursor = db.cursor()

usernames = ['james','leah','tiffany','paul']

resultsPerPage = 4
previousRegex = ""
@route('/home')
def index():
    username = request.get_cookie("account") #, secret='blueberries')
    if username:
	    return template('home.tpl')
    else:
	return "<p>You are not logged in. Access denied.</p>"

@get('/login')
def login():
    return '''
        <form action="/login" method="post">
            Username: <input name="username" type="text" />
            <input value="Login" type="submit" />
        </form>
    '''

@route('/')
@post('/login')
def do_login():
	username = request.forms.get('username')
	for user in usernames:
		if user == username :
			response.set_cookie("account", username);
			#response.set_cookie("account", username, secret='blueberries')
			return template('home.tpl')
	else :
		return "<p>Login failed.</p>"

@route('/profile')
def profile():
    tagged_jobs = []
    #fave_comp = ['Microsoft', 'Google']
    cursor.execute("select * from jobs where id=3")
    doc['resume'] = "https://docs.google.com/document/d/1xg9qO9_mfHjFcZdIRrZLBEH6xvNraLI5Rkfu3EDafcA/edit#heading=h.3nqr2w2ztd8"
    #for row in cursor.fetchall() :
	#myjob = parseJobObject(row)
	#print myjob[2]
	#print myjob
	#companies[myjob[2]] = myjob 
    for keys in companies:
	cursor.execute("select id, title, company, location, due from jobs where id= %s", keys);
	#thejob = parseJobObject(cursor.fetchone())
	thejob = cursor.fetchone()
	print "about to print thejob"
	print thejob;
	print thejob[0];
	tagged_jobs.append(thejob)
    #print tagged_jobs[0]
    #print tagged_jobs[0][0]
    return template('profile.tpl', jobs=tagged_jobs, fave_comps=fave_comp, docs=doc)
    
@route('/search')
def search():
    return template('search.tpl',jobs=[])
    
@route('/search/<page>/<regex>')
def search(page, regex):
	args = regex.split('+')
	result = []
	
	#if regex == previousRegex:
	#	start = resultsPerPage * page
	#	end = start + resultsPerPage
	#	return template('search.tpl', search=result[start:end], jobs=jobs,companies=companies) 
	regex = previousRegex
	for arg in args:
	
		if arg in tags:
			result += tags[arg]
			
		if len(arg)>3:
			#Placeholder SQL statements
			if "/" in arg:
				#date select method
				continue
			cursor.execute("SELECT * FROM jobs WHERE company=%s",arg)
			for row in cursor.fetchall():
				result.append(parseJobObject(row))
			cursor.execute("SELECT * FROM jobs WHERE title LIKE %s","%"+arg+"%")
			for row in cursor.fetchall():
				result.append(parseJobObject(row))
			
			print len(result)	
			cursor.execute("SELECT * FROM jobs WHERE location LIKE %s","%"+arg+"%")
			for row in cursor.fetchall():
				result.append(parseJobObject(row))
			
			#Position select
			cursor.execute("SELECT * FROM jobs WHERE position LIKE %s","%"+arg+"%")
			for row in cursor.fetchall():
				result.append(parseJobObject(row))
			
			#Maybe a description select?!?
			cursor.execute("SELECT * FROM jobs WHERE description LIKE %s","%"+arg+"%")
			for row in cursor.fetchall():
				result.append(parseJobObject(row))
			
	result = OrderedSet(result)
	start = resultsPerPage * int(page)
	end = start + resultsPerPage
	if result is None:
		return template('search.tpl',jobs=None,max=0)
	paginateArray = generatePage(start,len(result))
	return template('search.tpl', jobs=result[start:end],current=start,max=len(result),query=regex,paginateArray=paginateArray) 
		
@route('/events')
def events():
	return template('events.tpl')

@route('/careerFair')
def careerfair():
	cursor.execute("SELECT id, company, website, location FROM jobs group by company")
	result = []
	for row in cursor.fetchall():
	#	print row
		result.append(row)
	#result = OrderedSet(result)
	#start = resultsPerPage * int(page)
	#end = start + resultsPerPage
	if result is None:
		return template('careerFair.tpl', jobs=None)
	#return template('careerFair.tpl', jobs=result[start:end])
	#print result[0]
	return template('careerFair.tpl', jobs=result, faves=fave_comp)

#@route('/company')
#def companyPage():
#	return template('/company


@route('/company/<comp>')
def companyPage(comp):
	result = []
	print "company is " + comp;
	cursor.execute("select id, title, position, location, due, website from jobs where company like %s", comp)
	for row in cursor.fetchall():
		result.append(row)
		#result.append(parseJobObject(row))
	#print result[0]
	isfave = "false";
	for str in fave_comp:
		if str == comp:
			isfave = "true";
	return template('company.tpl', company=comp, jobs=result, fave=isfave)

@route('/job/<thejob>')
def jobView(thejob):
	cursor.execute("select * from jobs where id= %s", thejob)
	#for row in cursor.fetchall():
	#	myjob = parseJobObject(row)
	myjob = parseJobObject(cursor.fetchone())
	return template('job.tpl', job=myjob)

@route('/apply/<thejob>')
def apply(thejob):
	cursor.execute("select id,title,company from jobs where id= %s", thejob)
        #for row in cursor.fetchall():
        #       myjob = parseJobObject(row)
        myjob = (cursor.fetchone())
	return template('apply.tpl', job=myjob, docs=doc)

@route('/bootstrap/<filepath:path>')
def boot(filepath):
    return static_file(filepath, root='bootstrap/')

@route('/static/<filepath:path>')
def static(filepath):
    return static_file(filepath, root='static/')

@route('/bootstrap-tagsinput/<filepath:path>')
def input(filepath):
    return static_file(filepath, root='bootstrap-tagsinput/')

def OrderedSet(list):
    mmap = {}
    oset = []
    for item in list:
        if item not in mmap:
                mmap[item] = 1
                oset.append(item)
    return oset;
	

def parseJobObject(list):
	ans = '{'
	titles = ['id', 'name', 'company', 'locations','description', 'website','positions','due']
	count = 0
	
	for element in list:
		ans += '"'+titles[count]+'":"'+str(element)+'",'	
		count += 1
	ans += '"tags":['
	element_id = str(list[0])
	if element_id in companies:
		for element in companies[element_id]:
			ans += '"'+element+'",'
		if ans[-1] == ',':
			ans = ans[:-1]
	ans += '],}'
	return ans

@route('/tag/<job>/<newTag>')
def tag(job,newTag):
	if newTag == 'null':
		companies[job] = []
	else:
		companies[job] = newTag.split(",")

@route('/comp/<compname>')
def addRemoveComp(compname):
	print "to remove = " + str(compname)
	iremoved = 0
	for co in fave_comp:
		if co == compname:
			fave_comp.remove(co)
			print "removed " + co
			iremoved = 1
			break
	if (iremoved == 0) :
		fave_comp.append(compname)
		print "added " + compname

@route('/doc/<type>/<key>/<link>')
def docMethods(type, key, link):
	print "in add/delete documents - " + key
	if type == "delete":
		del doc[key]
		print "delete doc"
	else :
		doc[key] = link
		print "add doc"

@post('/doc/add/') 
def docAdd():
	filename = request.forms.get('filename')
	link = request.forms.get('link')
	doc[filename] = link
	print "just added doc"

@route('/rmv/job/<id>')
def removeJob(id):
	del companies[id]
	print "deleted " + str(id) + " from companies"
	
def generatePage(m,current):
    page = current //4
    n = m //4
    if n <= 10:
        pages = set(range(0, n))
    else:
        pages = (set(range(0, 3))
                 | set(range(max(0, page - 3), min(page + 2, n)))
                 | set(range(n - 3, n)))
    return pages
run(host='ec2-54-234-44-211.compute-1.amazonaws.com', port=8080)
