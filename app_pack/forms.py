from app_pack.models import User
from flask import flash
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField
from wtforms.validators import DataRequired, InputRequired, EqualTo, Email, ValidationError

class SignInForm(FlaskForm):
    first_name = StringField('First name', validators=[DataRequired()])
    second_name = StringField('Second name', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Remember me')
    submit = SubmitField('Sign in')


class SignUpForm(FlaskForm):
    first_name = StringField('First name', validators=[DataRequired()])
    second_name = StringField('Second name', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    repeate_password = PasswordField('Repeate Password', validators=[DataRequired(), EqualTo('password')])
    remember_me = BooleanField('Remember me')
    submit = SubmitField('Sign up')

    # WTForms takes custom validators and invokes them in addition to the stock validators
    def credentials_are_valid(self):
        if not User.query.filter_by(first_name=self.first_name.data,
                                    second_name=self.second_name.data).first():
            raise(ValidationError)

    def email_is_valid(self):
        if User.query.filter_by(email=self.email.data).first():
            raise(ValidationError)
            