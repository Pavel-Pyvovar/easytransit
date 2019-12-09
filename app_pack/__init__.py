from flask import Flask
from config import Config

# Flask uses the location of the module passed here as a starting point when it needs to load associated resources such as template files
app_inst = Flask(__name__)
# App from above is an object of class Flask
app_inst.config.from_object(Config)

from app_pack import routes
# App here is a package which is defined by __init__.py
# The routes are the different URLs that the application implements.