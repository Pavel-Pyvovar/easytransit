from app_pack import app_inst
from flask import render_template, flash, redirect
from app_pack.forms import LoginForm

@app_inst.route('/')
# The @app.route decorator creates an association between the URL given as an argument and the function.

@app_inst.route('/index')
def index():
    return render_template('index.html')

@app_inst.route('/blog')
def blog():

    u = [{'name': 'Pavlo', 'message': 'Hello'},
        {'name': 'Dima', 'message': 'Goodbye'}]

    return render_template('blog.html', users=u)

@app_inst.route('/login', methods=['GET', 'POST'])
def login():
    login_form = LoginForm()
    if login_form.validate_on_submit():
        flash(f'Login requested for user {login_form.username.data}, remember_me={login_form.remember_me.data}')
        return redirect('/index')
    return render_template('login.html', form=login_form)

@app_inst.route('/contacts')
def contacts():
    return render_template('contacts.html')