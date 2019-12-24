from app_pack import db, login
from datetime import datetime
from flask_login import UserMixin
from pprint import pprint
from werkzeug.security import generate_password_hash, check_password_hash

@login.user_loader
def load_user(user_id):
	# load_user -- callback passed to user_loader
	# Note that id is of type string.
	# Thus the type cast is required 
	# in query to the database.
	return User.query.get(int(user_id))

class User(UserMixin, db.Model):
	__tablename__ = 'USERS'
	user_id = db.Column(db.Integer(), primary_key=True, autoincrement=True)
	first_name = db.Column(db.String(10), index=True)
	second_name = db.Column(db.String(10), index=True)
	email = db.Column(db.String(20), index=True, default=None)
	password_hash = db.Column(db.String(20), unique=True)
	favourite_stations = db.Column(db.JSON(), default=None)
	favourite_lines = db.Column(db.JSON(), default=None)
	favourite_transport = db.Column(db.JSON(), default=None)
	liked_posts = db.Column(db.JSON(), default=None)
	created_time = db.Column(db.DateTime(), default=datetime.now())
	updated_time = db.Column(db.DateTime(), default=datetime.now(), onupdate=datetime.now())

	def __init__(self, fname, sname, email, passwd):
		self.first_name = fname
		self.second_name = sname
		self.email = email
		self.password_hash = generate_password_hash(passwd)

	def set_password(self, password):
		self.password_hash = generate_password_hash(password)
	
	def check_password(self, password):
		return check_password_hash(self.password_hash, password)

	def hash_password(self):
		self.password_hash = generate_password_hash(self.password_hash)

	def check_credentials(self, fname, sname, pwd):
		return self.first_name == fname and\
				self.second_name == sname and\
				check_password_hash(self.password_hash, pwd)

	def get_id(self):
		return self.user_id

	def __repr__(self):
		return f'Id: {self.user_id}\n' +\
				f'First name: {self.first_name}\n' +\
				f'Second name: {self.second_name}\n' +\
				f'Email: {self.email}\n' +\
				f'Password: {self.password_hash}\n' +\
				f'Favourite stations: {self.favourite_stations}\n' +\
        		f'Favourite lines: {self.favourite_lines}\n' +\
				f'Favourite transport: {self.favourite_transport}\n' +\
				f'Liked posts: {self.liked_posts}\n' +\
				f'Created time: {self.created_time}\n' +\
				f'Updated time: {self.updated_time}\n'


class Author(db.Model):
	__tablename__ = 'AUTHORS'
	id = db.Column(db.Integer(), primary_key=True, nullable=False)
	user_id = db.Column(db.Integer(), db.ForeignKey('USERS.id'), nullable=False)
	posts = db.Column(db.JSON())
	created_time = db.Column(db.DateTime(), default=datetime.now())
	updated_time = db.Column(db.DateTime(), default=datetime.now())
	
	def __repr__(self):
		return f'Id: {self.id}\n' +\
				'User id: {self.user_id}\n' +\
				'Posts: {self.posts}\n' +\
				'Created time: {self.created_time}\n' +\
				'Updated: time{self.updated_time}\n'


class Post(db.Model):
	__tablename__ = 'POSTS'
	id = db.Column(db.Integer(), primary_key=True, nullable=False)
	author_id = db.Column(db.Integer(), db.ForeignKey('AUTHORS.id'), nullable=False)
	content = db.Column(db.TEXT())
	created_time = db.Column(db.DateTime(), default=datetime.now())
	updated_time = db.Column(db.DateTime(), default=datetime.now())

	def __repr__(self):
		return f'Id: {self.id}\n' +\
				'Author id: {self.author_id}\n' +\
				'Content: {self.content}\n' +\
				'Created time: {self.created_time}\n' +\
				'Updated: time{self.updated_time}\n'


class Station(db.Model):
	__tablename__ = 'STATIONS'
	id = db.Column(db.Integer(), primary_key=True, nullable=False)
	station_name = db.Column(db.String(255))
	transport = db.Column(db.JSON())
	created_time = db.Column(db.DateTime(), default=datetime.now())
	updated_time = db.Column(db.DateTime(), default=datetime.now())

	def __repr__(self):
		return f'Id: {self.id}\n' +\
				'Station name: {self.station_name}\n' +\
				'Transport: {self.transport}\n' +\
				'Created time: {self.created_time}\n' +\
				'Updated: time{self.updated_time}\n'


class Transport(db.Model):
	__tablename__ = 'TRANSPORT'
	id = db.Column(db.Integer(), primary_key=True, nullable=False)
	transport_type = db.Column(db.String(10))
	line_number = db.Column(db.Integer())
	created_time = db.Column(db.DateTime(), default=datetime.now())
	updated_time = db.Column(db.DateTime(), default=datetime.now())

	def __repr__(self):
		return f'Id: {self.id}\n' +\
				'Transport type: {self.transport_type}\n' +\
				'Line number: {self.line_number}\n' +\
				'Created time: {self.created_time}\n' +\
				'Updated: time{self.updated_time}\n'



