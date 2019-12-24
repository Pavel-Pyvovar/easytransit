from pathlib import Path

basedir = Path(__file__).absolute().parent

class Config(object):
    SECRET_KEY = 'your secret key'#or os.environ.get('SECRET_KEY')
    SQLALCHEMY_DATABASE_URI = "mysql://root:de9wuTNM@localhost:3306/easytransit"
    SQLALCHEMY_TRACK_MODIFICATIONS = False