<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRYPTOKING</title>
    <style>
        body{
            font-family: 'Poppins', sans-serif;
            /*background-image:linear-gradient(to left ,#849eaf , #2c3e50);*/
            /*background-image: linear-gradient(to right, #a8caba 0%, #5d4157 100%); */ 
            background-color: rgb(32, 29, 29);
        }
        #full{
            
            /*margin-left: 40%;*/
            /*margin-right: 40%;*/
            /*background-image: linear-gradient(red, yellow);*/

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        h1{

            color: white;
            background-color: inset 0px 10px 20px 2px rgba(0,255,255,0.7);

        }
        input{
            text-align: center;
        }
            ::-webkit-input-placeholder {
                text-align: center;
              }
              :-moz-placeholder {
                text-align: center;
              }

        .un{
          margin-bottom: 20px;
          border-radius: 10px;
          border: none;
          border-width: 2px;
          width: 290px;
          height: 40px;
          font-family: 'Poppins', sans-serif;
          font-size:20px; 
          outline: none;
          /*filter: drop-shadow(0 25px 25px rgb(0 0 0 / 1));*/
          box-shadow: 0px 1px 2px 0px rgba(0,255,255,0.7),
            1px 2px 4px 0px rgba(0,255,255,0.7),
            2px 4px 8px 0px rgba(0,255,255,0.7),
            2px 4px 16px 0px rgba(0,255,255,0.7);  
          
          
        }
        #loginbtn{
          margin-bottom: 20px;
          border-radius: 10px;
          border: none;
          width: 100px;
          height: 40px;
          font-family: 'Poppins', sans-serif;
          font-size: 20px; 

        }
        #loginbtn:hover{
            background-image: linear-gradient(-60deg, #16a085 0%, #62dfca 100%);
            box-shadow: 0px 1px 2px 0px rgba(0,255,255,0.7),
            1px 2px 4px 0px rgba(0,255,255,0.7),
            2px 4px 8px 0px rgba(0,255,255,0.7),
            2px 4px 16px 0px rgba(0,255,255,0.7);  
        }
        #sp{
            color: white;
        }
        #register_url{
            text-decoration-line: none;
            color:#16a085;
        }
    </style>
</head>
<body>
    <div id="full"> 
        <div><h1>LOGIN</h1></div>
        <div>
            <input type="text" class="un" onfocus="this.placeholder=''" onblur="this.placeholder='Enter Username'" id="uname" placeholder="Username" />
        </div>
        <div>
            <input type="password" class="un" onfocus="this.placeholder=''" onblur="this.placeholder='Enter Password'"  id="password" placeholder="Password" />
        </div>
        <div>
            <button id="loginbtn">Login</button>
        </div>
        <div>
            <span id="sp">For new User !</span>
            <a id="register_url" href="/register">Register</a>
        </div>
        
    </div>

    <script type="text/javascript">

        async function postData(url = "", data = {}) {
            const response = await fetch(url, {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: new URLSearchParams(data).toString()
            });

            return response.json();
        }

        document.getElementById('loginbtn').addEventListener('click', function() {
            var uname = document.getElementById('uname').value;
            console.log(uname);

            var password = document.getElementById('password').value;
            console.log(password);

            if(uname !="" && password !=""){
                postData("/login", { uname: uname, password: password }).then((response) => {
                    console.log(response.status)
                    if(response.status != "Failed."){
                        var name=response.data.uname;
                        var psd=response.data.password;
                        var sid=response.data.sid;

                        console.log(name);
                        console.log(psd);
                        console.log(sid);

                        if(name == uname && psd == password){
                            if(response.status == 'success') {
                                console.log(`Login is success ${uId}`);
                                alert("Login successfull");
                                window.location.href ='/home';

                            } else {
                                alert(response.message);
                            }
                        }
                        else{
                            alert("Wrong Username or password.");
                        }
                    }
                    else{
                        alert("Please Register before Login.");
                    }
                });
            }
            else{
                alert("Please Enter the Username and Password.");
            }
        }); 
       
     </script>
    
</body>
</html>