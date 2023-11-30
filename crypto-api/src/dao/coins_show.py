from model import coins

def coin_show(connection):
    obj=connection.query(coins.coin.sid,coins.coin.cname,coins.coin.cprice).all()
    
    data=[]
    
    for each in obj:
        data.append({
            "sid":each.sid,
            "cname":each.cname,
            "cprice":each.cprice            
        })
        
    return data