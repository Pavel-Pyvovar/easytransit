# from app_pack import db
# from config import Config
from pathlib import Path
from pprint import pprint
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import mapper, sessionmaker, relationship
from sqlalchemy.schema import Table, Column
from sqlalchemy.types import Integer, String, JSON, DateTime
import sys

# sys.path.insert(1, str(Path(__file__).absolute().parent/'..'))
# from config import Config
# breakpoint()
Base = declarative_base()
# c = Config()

class User(Base):
    __tablename__ = 'USERS'
    id = Column(Integer(), primary_key=True)
    first_name = Column(String(10), index=True)
    second_name = Column(String(10), index=True)
    email = Column(String(20), index=True)
    passwd = Column(String(20), unique=True)
    favourite_stations = Column(JSON())
    favourite_lines = Column(JSON())
    favourite_transport = Column(JSON())
    liked_posts = Column(JSON())
    created_time = Column(DateTime())
    updated_time = Column(DateTime())

    def __init__(self, id, first_name, second_name, email,
                passwd, favourite_stations, favourite_lines,
                favourite_transport, liked_posts, created_time,
                updated_time):

        self.id = id
        self.first_name = first_name
        self.second_name = second_name
        self.email = email
        self.passwd = passwd
        self.favourite_stations = favourite_stations
        self.favourite_lines = favourite_lines
        self.favourite_transport = favourite_transport
        self.liked_posts = liked_posts
        self.created_time = created_time
        self.updated_time = updated_time
        


# users = Table("USERS", 
#         Base.metadata,
#         Column(Integer(), primary_key=True),
#         Column(String(10)),
#         Column(String(10)),
#         Column(String(20)),
#         Column(String(20)),
#         Column(JSON()),
#         Column(JSON()),
#         Column(JSON()),
#         Column(JSON()),
#         Column(DateTime()),
#         Column(DateTime()),
#         extend_existing=True,
#         )

# mapper(User, users)

# engine = create_engine(c.SQLALCHEMY_DATABASE_URI, convert_unicode=True)
# DBSession = sessionmaker(bind=engine)