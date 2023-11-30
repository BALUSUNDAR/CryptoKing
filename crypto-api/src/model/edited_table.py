from sqlalchemy.orm import declarative_base
from sqlalchemy import Column,Integer,String,BLOB

Base=declarative_base()

class edited_table_data(Base):
    __tablename__='edited_table'
    __tableargs__={'schema':'crypto'}
    
    sid=Column('sid',Integer,nullable=False,primary_key=True)
    uid=Column('uid',Integer,nullable=False)
    proof=Column('proof',String,nullable=False)
    pro_image=Column('pro_image',BLOB,nullable=False)