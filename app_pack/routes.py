from app_pack import app_inst
from flask import render_template

# @app_inst.route('/')
# The @app.route decorator creates an association between the URL given as an argument and the function.

@app_inst.route('/index')
def index():
    users = [{'Pavlo': 'Hello'},
        {'Dima': 'Goodbye'}]
    return render_template('index.html', users=users)

@app_inst.route('/blog')
def blog():

    u = [{'name': 'Pavlo', 'message': 'Hello'},
        {'name': 'Dima', 'message': 'Goodbye'}]

    return render_template('blog.html', users=u)