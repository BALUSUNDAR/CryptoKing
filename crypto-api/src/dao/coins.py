from model import coins

def coin_add(cid,cname,cprice,connection):
    obj=coins.coin(sid=cid,cname=cname,cprice=cprice)
    
    connection.add(obj)
    connection.commit()
    
    return{
        'sid':obj.sid,
        'cname':obj.cname,
        'cprice':obj.cprice
    }
    
