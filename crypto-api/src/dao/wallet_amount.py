from model import wallet_amount_cal
# from model import user

def adding_amount(uid,wallet_amount,connection):
    obj=wallet_amount_cal.wallet_amount_cal(uid=uid,wallet_amount=wallet_amount)
    
    connection.add(obj)
    connection.commit()
    print(obj)
    
    return{
        'sid':obj.sid,
        'uid':obj.uid,
        'wallet_amount':obj.wallet_amount
    }