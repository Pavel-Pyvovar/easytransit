from app_pack import app_inst
from app_pack.forms import LoginForm
from app_pack.models import User
from flask import render_template, flash, redirect, url_for
from flask_login import current_user, login_user, logout_user
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
    if current_user.is_authenticated:
        return redirect(url_for('index'))

    login_form = LoginForm()
    print(login_form.email.data)
    # print(login_form.password.data)

    if login_form.validate_on_submit():
        print(f'{login_form.email.data}')
        # flash(f'Email {login_form.email.data}')
        # user = User.query.filter_by(email=login_form.email.data).first()
        # # user = User.query.filter_by(email='csmith@gmail.com').first()
        # print(f'This is {type(user)}')

        # print(login_form.email.data)
        # print(login_form.password.data)
        # if user is None or not user.check_password(login_form.password.data):
        #     flash('Invalid email or password')
        #     return redirect(url_for('login'))
        # login_user(user, remember=login_form.remember_me.data)
        return redirect(url_for('index'))
    print('Failed')
    return render_template('login.html', form=login_form)

@app_inst.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('index'))

@app_inst.route('/contacts')
def contacts():
    return render_template('contacts.html')