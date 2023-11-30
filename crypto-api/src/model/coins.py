from sqlalchemy.orm import declarative_base
from sqlalchemy import Column,Integer,String,Float

Base = declarative_base()

class coin(Base):
    __tablename__='coins'
    __tableargs__={'schema':'crypto'}
    
    sid=Column('sid',Integer,nullable=False,primary_key=True)
    cname=Column('cname',String, nullable=False,unique=True)
    cprice=Column('cprice',Float,nullable=False)