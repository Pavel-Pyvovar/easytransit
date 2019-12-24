from app_pack import app_inst, db
from app_pack.forms import SignInForm, SignUpForm
from app_pack.models import User
from flask import render_template, flash, redirect, url_for
from flask_login import current_user, login_user, logout_user
from uuid import uuid4

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

@app_inst.route('/sign_in', methods=['GET', 'POST'])
def sign_in():
    if current_user.is_authenticated:
        return redirect(url_for('index'))

    form = SignInForm()

    if form.validate_on_submit():
        # Get email of a user
        user = User.query.filter_by(email=form.email.data.strip()).first()
        # Check whether password matches
        if (user is None or not user.check_password(form.password.data.strip())):
            return redirect(url_for('sign_in'))
        
        login_user(user, remember=form.remember_me.data)
        return redirect(url_for('index'))
    return render_template('sign_in.html', form=form)


@app_inst.route('/sign_up', methods=['GET', 'POST'])
def sign_up():
    if current_user.is_authenticated:
        return redirect(url_for('index'))

    form = SignUpForm()

    # If user is not registered yet
    if form.validate_on_submit(): 

        u = User(form.first_name.data,
                form.second_name.data,
                form.email.data,
                form.password.data)

        db.session.add(u)
        db.session.commit()    

        login_user(u, remember=form.remember_me.data)
        print("User registered")

        return redirect(url_for('index'))

    flash('You have already created account')
    return render_template('sign_up.html', form=form)


@app_inst.route('/sign_out')
def sign_out():
    logout_user()
    return redirect(url_for('index'))

@app_inst.route('/contacts')
def contacts():
    return render_template('contacts.html')