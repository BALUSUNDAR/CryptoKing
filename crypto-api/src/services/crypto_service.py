import yaml,pathlib,sys,os,json


root_path=pathlib.Path(__file__).parent.resolve().parent.resolve()
sys.path.append(str(root_path))
print(root_path)

from flask import Flask,request
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from PIL import Image
from dao import user,coins,coins_show,wallet_amount,edited_table_details




app=Flask("__annotaion__")

def get_db_connection():
    Session=sessionmaker(bind=db_engine)
    print("Session")
    return Session()

@app.route('/adduser', methods=['POST'])
def user_login():
    res={
        'status':'success',
        'message':None,
        'data':None
    }
    try:
        input=request.get_json(force=True)
        if 'uname' not in input :
            res['status'] = 'failure'
            res['message'] = 'Username not given'
        # elif not re.match('^\d{1,9}$', input['uname']):
        #     res['status'] = 'failure'
        #     res['message'] = 'Invalid student id given'
        elif 'password' not in input:
            res['status'] = 'failure'
            res['message'] = 'password not given'
        # elif not re.match('^\d{1,4}$', str(input['password'])):
        #     res['status'] = 'failure'
        #     res['message'] = 'Invalid subject id given'
        else:
            connection=get_db_connection()
            res['data']=user.user_details(
                uname=input['uname'],
                password=input['password'],
                connection=connection)        
        
    except Exception as e:
        print(str(e))
        
        res['status']="Failed."
        res['message']="Use different username or password."
        
    return json.dumps(res)

################################################################################################


@app.route('/getdetails', methods=['POST'])
def get_details_by():
    input=request.get_json(force=True)
    uname=input.get("uname")
    password=input.get("password")
    res={
        'status':'success',
        'message':None,
        'data':None
    }
    try:
            connection=get_db_connection()
            res['data']=user.get_details(uname,password,connection)
            if(res['data']== None):
                res['status']="failure"
                res['message']="user doesn't exist"
                
                
    except Exception as e:
        print(str(e))
        
        res['status']="Failed."
        res['message']="Register before Login."
        
        
    return json.dumps(res)

############################################################################################

@app.route('/addcoin', methods=['POST'])
def coin_add():
    
    
    res={
        'status':'success',
        'message':None,
        'data':None
    }
    try:
        input =request.get_json(force=True)
        connection=get_db_connection()
        res['data']=coins.coin_add(
            cid=int(input['sid']),
            cname=input['cname'].upper(),
            cprice=float(input['cprice']), 
            connection=connection)
        
        res['data']=coins_show.coin_show(connection)
              
    except Exception as e:
        print(str(e))
        
        res['status']="Failed"
        res['message']="Data adding Failed. \n or \n Check adding data is valid"
        
    return json.dumps(res)
   
###############################################################################################3
   
@app.route('/showdata', methods=['GET'])
def showing_data():
    
    res={
        'status':'success',
        'message':None,
        'data':None
    }
    try:
        connection=get_db_connection()
        res['data']=coins_show.coin_show(connection)
              
    except Exception as e:
        print(str(e))
        
        res['status']="Failed"
        res['message']="Getting Exception"
        
        
    return json.dumps(res)   

#############################################################################################

@app.route('/wallet_amount', methods=['POST'])
def wallet_amount_calculation():
    
    res={
        'status':'success',
        'message':None,
        'data':None
    }
    try:
        input = request.get_json(force=True)
        connection=get_db_connection()
        res['data']=wallet_amount.adding_amount(
            uid=input['uid'],
            wallet_amount=float(input['wallet_amount']),
            connection=connection)
              
    except Exception as e:
        print(str(e))
        
        res['status']="Failed"
        res['message']="Getting Exception on wa"
        
    return json.dumps(res)

##############################################################################################################


@app.route('/add_image', methods=['POST'])
def adding_image_in_db():
    
    
    img = Image.open(request.files['file'])
    
    res={
        'status':'success',
        'message':None,
        'data':None
    }
    try:
        input = request.get_json(force=True)
        connection=get_db_connection()
        res['data']=edited_table_details.edited_table_details(
            uid=input['uid'],
            proof=input['proof'],
            pro_image=input['pro_image'],
            connection=connection)
              
    except Exception as e:
        print(str(e))
        
        res['status']="Failed"
        res['message']="Getting Exception on wa"
        
    return json.dumps(res)

   
file_config = yaml.load(open(os.path.join(root_path, "..", "conf", "config.yml"))) # type: ignore
db_engine =create_engine(file_config['db_connection_string'],pool_size=50,isolation_level="READ COMMITTED",echo=True) 
 
 
app.run('localhost',5000)

