from sqlalchemy.orm import declarative_base
from sqlalchemy import Column,Integer,String

Base = declarative_base()

class User(Base):
    __tablename__='user'
    __tableargs__={'schema':'crypto'}
    
    sid=Column('sid',Integer,nullable=False,primary_key=True)
    uname=Column('uname',String,nullable=False)
    password=Column('password',String,nullable=False,unique=True)
    
