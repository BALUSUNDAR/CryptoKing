from sqlalchemy.orm import declarative_base
from sqlalchemy import Column,Integer

Base=declarative_base()

class coin_buy(Base):
    __tablename__='coin_buy'
    __tableargs__={'schema':'crypto'}
    
    sid=Column('sid',Integer,nullable=False,primary_key=True)
    uid=Column('uid',Integer,nullable=True)
    cid=Column('cid',Integer,nullable=True)
    amt_deposit=Column('amt_deposit',Integer,nullable=True)