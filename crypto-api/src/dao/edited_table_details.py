from model import edited_table

def edited_table_details(uid,proof,pro_image,connection):
    obj=edited_table.edited_table_data(uid=uid,proof=proof,pro_image=pro_image)
    
    connection.add(obj)
    connection.commit()
    
    return{
        'sid':obj.sid,
        'uid':obj.uid,
        'proof':obj.proof,
        'pro_image':obj.pro_image
    }