from app_pack import db
from app_pack.models import User
from werkzeug.security import generate_password_hash

users = User.query.all()

for u in users:
    if u.password_hash:
        u.set_password(u.password_hash)
        db.session.add(u)

db.session.commit()

# print(users)


# user = User('Yomato',
#             'Fokushima',
#             'some@email.com',
#             'asdfasdf')

# db.session.add(user)

# table.insert(user)