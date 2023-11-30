from sqlalchemy.orm import declarative_base
from sqlalchemy import Column,Integer,Float

Base=declarative_base()

class wallet_amount_cal(Base):
    __tablename__='wallet_amount'
    __tableargs__={'schema':'crypto'}
    
    sid=Column('sid',Integer,nullable=False,primary_key=True)
    uid=Column('uid',Integer,nullable=False,foreign_key=True)
    wallet_amount=Column('wallet_amount',Float,nullable=False)                                                      
    