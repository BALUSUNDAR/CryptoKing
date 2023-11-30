from operator import and_
from model import user

def user_details(uname,password,connection):

    obj=user.User(uname=uname,password=password)
    
    connection.add(obj)
    connection.commit()
    print(obj)
    
    return{
        'sid':obj.sid,
        'uname':obj.uname,
        'password':obj.password
    }
    
def get_details(uname,password,connection):
    obj=connection.query(user.User).filter(
        and_(user.User.uname == uname,
             user.User.password == password)).first()
 
    return{
            'sid':obj.sid,
            'uname':obj.uname,
            'password':obj.password
        }