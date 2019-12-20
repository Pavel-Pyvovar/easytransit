from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField
from wtforms.validators import DataRequired, InputRequired, Email

class LoginForm(FlaskForm):
    # username = StringField('Username', validators=[DataRequired()])
    # first_name = StringField('First name', validators=[DataRequired()])
    # second_name = StringField('Second name', validators=[DataRequired()])

    email = StringField('Email', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired()])
    remember_me = BooleanField('Remember me')
    submit = SubmitField('Submit')