from pathlib import Path
import pymysql.cursors

basedir = Path(__file__).absolute().parent

class Config(object):
    SECRET_KEY = 'your secret key'#or os.environ.get('SECRET_KEY')
    SQLALCHEMY_DATABASE_URI = "mysql://root:mysqladmin@localhost:3306/oo_im?charset=utf8"

    # conn = pymysql.connect(host='localhost',
    #                         user='root',
    #                         password='de9wuTNM',
    #                         # port=33321,
    #                         db='easytransit')

    # try:
    #     with conn.cursor() as cursor:
    #         query = 'select * from USERS'
    #         response = cursor.execute(query)
    #         all_rows = cursor.fetchall()
    #         print(response)
    # finally:
    #     conn.close()