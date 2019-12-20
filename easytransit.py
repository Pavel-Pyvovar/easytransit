from app_pack import app_inst, db
from app_pack.models import User, Post, Author, Transport, Station

@app_inst.shell_context_processor
def make_shell_context():
    return {'db': db,
            'User': User,
            'Author': Author,
            'Post': Post,
            'Transport': Transport,
            'Station': Station}