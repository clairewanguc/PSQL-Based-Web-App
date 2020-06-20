from bottle import Bottle, post, get, error, request, debug, template, route, run
import bottle
import os
import sys
import psycopg2 as pg
import logging
import argparse


# The logging level to control what messages are shown (skipping debug)
logging.basicConfig(level=logging.INFO)

# our bottle app, using the default. We can store variables in app
app = bottle.default_app()


# main page
@get("/home")
def home():
    # Use a template to get the HTML to return. This template needs variables page_name (also for header.tpl) and  body 
    return template('home')

# function 0 search page


@get('/search')
def search():
    return template('search')

# function 1 results with short description
@post('/search')
def do_search():
    profname = request.forms.get('profname')
    focus = request.forms.get('focus')
    profname = '%' + profname + '%'

    query1 = "select profname,email,focus from professors where profname like %s or focus = %s"
    cur.execute(query1, (profname, focus))
    records = cur.fetchall()
    return template('results', rows=records)


# function 2 view and/or update the record
@route('/view/<email>', method='GET')
def edit_item(email):

    if request.GET.get('save','').strip():
        Email = request.GET.get('email','').strip()
        Name = request.GET.get('profname','').strip()
        Sex = request.GET.get('sex','').strip()
        Publications = request.GET.get('npaper','').strip()
        Birthdate = request.GET.get('birthdate','').strip()
        Focus = request.GET.get('focus','').strip()
        Department = request.GET.get('profdept','').strip()
        Lab = request.GET.get('pilab','').strip()
        query1 = "UPDATE professors SET email = %s, profname = %s, sex = %s, npaper = %s, birthdate = %s, focus = %s, profdept = %s, pilab = %s WHERE email = %s"
        cur.execute(query1, (Email, Name, Sex, Publications, Birthdate, Focus, Department, Lab))
        return '<p>The information about professor %s was successfully updated</p>' % Name
    else:
        cur.execute("SELECT * FROM professors WHERE email = %s", (str(email),))
        cur_data = cur.fetchone()
        return template('edit', old=cur_data, email=email)


# function 3 delete
@route('/deleteprof/<email>', method='GET')
def delete_prof(email):
    query1 = "select email from professors where email in (select aemail from profcolb);"
    try:
        cur.execute("DELETE FROM professors where email = %s", (email,))
        return template('deleteprof', email=email, body='Your delete was successful')
    except:
       return template('deleteprof', email=email, body='Your delete was not successful')


# function 4 show lab
@route('/labs/<email>', method='GET')
def show_lab(email):
    query1 = "select pilab from professors where email = %s;"
    query2 = "select * from labs where labname = %s"
    cur.execute(query1, (email,))
    pilab = cur.fetchone()
    cur.execute(query2, (pilab,))
    labs = cur.fetchone()
    labs = tuple(map(str, labs))

    return template('labs', rows=labs, email=email)
        # labs = []
        # for element in pilab:
        #     cur.execute(query2,(element,))
        #     lab = cur.fetchone()
        #     labs.append(lab)


# function 5 add a new lab for a professor
@route('/addlab/<email>', method='GET')
def do_add_lab(email):
    if request.GET.get('save','').strip():
        labname = request.GET.get('labname','').strip()
        size_student = request.GET.get('size_student','').strip()
        size_staff = request.GET.get('size_staff','').strip()
        labdept = request.GET.get('labdept').strip()

        query1 = "INSERT INTO labs VALUES (%s, %s, %s, %s)"
        cur.execute(query1, (labname, size_student, size_staff, labdept))
        # query2 = "select pilab from professors where email = %s"
        # cur.execute(query2, (email,))
        # pilab = cur.fetchall
        # labs = pilab + (labname,)
        # query3 = "update professors set pilab =%s where email = %s "
        # cur.execute(query3, (labs, email))
        return '<p>The lab information about professor whose email is %s was successfully updated</p>' % email
    else:
        # query4 = "select pilab from professors where email = %s"
        # cur.execute(query4, (email,))
        # pilab = cur.fetchone
        #
        query5 = "SELECT labname,size_student,size_staff,labdept FROM labs inner join professors on pilab = labname WHERE email = %s"
        cur.execute(query5, (email,))
        cur_data = cur.fetchone()
        return template('add', old=cur_data, email=email)


# function 6 add record to search results
@route('/addprofa/<name>', method='GET')
def add_profb(name):
    if request.GET.get('save','').strip():
        Email = request.GET.get('email','').strip()
        Name = request.GET.get('profname','').strip()
        Sex = request.GET.get('sex','').strip()
        Publications = request.GET.get('npaper','').strip()
        Birthdate = request.GET.get('birthdate','').strip()
        Focus = request.GET.get('focus','').strip()
        Department = request.GET.get('profdept','').strip()
        Lab = request.GET.get('pilab','').strip()
        query1 = "Insert into professors VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        cur.execute(query1, (Email, Name, Sex, Publications, Birthdate, Focus, Department, Lab))
        return '<p>The information about professor %s was successfully updated</p>' % Name
    else:
        name = '%' + name + '%'
        cur.execute("SELECT * FROM professors WHERE profname like %s", (name,))
        cur_data = cur.fetchone()
        return template('addprofa', old=cur_data, name=name)

@route('/addprofb/<focus>', method='GET')
def add_prof(focus):
    if request.GET.get('save','').strip():
        Email = request.GET.get('email','').strip()
        Name = request.GET.get('profname','').strip()
        Sex = request.GET.get('sex','').strip()
        Publications = request.GET.get('npaper','').strip()
        Birthdate = request.GET.get('birthdate','').strip()
        Focus = request.GET.get('focus','').strip()
        Department = request.GET.get('profdept','').strip()
        Lab = request.GET.get('pilab','').strip()
        query1 = "Insert into professors VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        cur.execute(query1, (Email, Name, Sex, Publications, Birthdate, Focus, Department, Lab))
        return '<p>The information about professor %s was successfully updated</p>' % Name
    else:
        cur.execute("SELECT * FROM professors WHERE focus = %s", (focus,))
        cur_data = cur.fetchone()
        return template('addprofb', old=cur_data, focus=focus)






@error(403)
def mistake403(code):
    return 'There is a mistake in your url!'


@error(404)
def mistake404(code):
    return 'Sorry, this page does not exist!'


debug(True)


#The main function to start the server
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-c","--config",
        help="The path to the .conf configuration file.",
        default="server.conf"
    )
    parser.add_argument(
        "--host",
        help="Server hostname (default localhost)",
        default="localhost"
    )
    parser.add_argument(
        "-p","--port",
        help="Server port (default 53001)",
        default=53001,
        type=int
    )
    parser.add_argument(
        "--nodb",
        help="Disable DB connection on startup",
        action="store_true"
    )

    #Get the arguments
    args = parser.parse_args()
    if not os.path.isfile(args.config):
        logging.error("The file \"{}\" does not exist!".format(args.config))
        sys.exit(1)

    app.config.load_config(args.config)

    # Below is how to connect to a database. We put a connection in the default bottle application, app
    if not args.nodb:
        try:
            app.db_connection = pg.connect(
                dbname = app.config['db.dbname'],
                user = app.config['db.user'],
                password = app.config.get('db.password'),
                host = app.config['db.host'],
                port = app.config['db.port']
            )
            cur = app.db_connection.cursor()
        except KeyError as e:
            logging.error("Is your configuration file ({})".format(args.config) +
                        " missing options?")
            raise

    try:
        logging.info("Starting Bottle Web Server")
        app.run(host=args.host, port=args.port, debug=True)
    finally:
        #Ensure that the connection opened is closed 
        if not args.nodb:
            app.db_connection.close()


