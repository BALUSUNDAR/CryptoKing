
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRYPTOKING</title>
    <link rel="stylesheet" href="static/css/style.css">
</head>
<body>
    <div class="para">
        <div id="nav">
            <div id="logo-container">
                <img id="logo" src="static/images/images.png" alt="image">
                <h1 id="cname">CRYPTOKING</h1>
            </div>
            <div id="link-container">
                <ul class="unordered"> 
                    <li><a href="#About" id="link-about" >About</a></li>
                    <li><a href="#Home" id="link-home">Home</a></li>
                    <li ><a href="#Login" id="link-login">Login</a></li>
                    <li><a class = "link-profile" id="link-profile">Profile</a></li>
                    <li><a class="logout" id="logout-button">Logout</a></li>
                </ul>
            </div>    
        </div>
         
        <div id="main">

            <hr>

            <div id="slideshow" style="max-width:100%">
                <img src="static/images/crypto1.jpg" alt="image1" class="slide-images" style ="width:100%">
                <img src="static/images/crypto2.jpg" alt="image1" class="slide-images" style ="width:100%">
                <img src="static/images/crypto3.jpg" alt="image1" class="slide-images" style ="width:100%">
            </div>
            <div>
                <input id="wallet-amount" type="number"><button id="btn">deposit</button>
            </div>
            
        </div>   
    </div>


    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
        var i;
        var x = document.getElementsByClassName("slide-images");
        console.log(x.length);
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";  
        }
        myIndex++;
        if (myIndex > x.length) {myIndex = 1}    
        x[myIndex-1].style.display = "block";  
        setTimeout(carousel, 2000); // Change image every 2 seconds
        }

        //login logic
        console.log(`This is direct home ${uId}`);
        console.log("typeof"+typeof(`${uId}`));
        let v = `${uId}`;
        console.log("length",v.length, v);
        if(`${uId}`.length !== 0){
            document.getElementById("link-login").classList.add("login-class-name");
            document.getElementById("link-profile").classList.remove("link-profile-class");
            document.getElementById("logout-button").classList.remove("logout");
            document.getElementById("link-profile").style.cursor ="pointer";
            document.getElementById("logout-button").style.cursor="pointer";
            console.log("not null");
            console.log(typeof(v));

            //post method for the wallet-amount actions
            async function postData(url="",data={}){
                const response= await fetch (url,{
                    method : "POST",
                    headers :{
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: new URLSearchParams(data).toString()
                });
    
                return response.json();
            }
            
            document.getElementById('btn').style.display="block";
            document.getElementById('wallet-amount').style.display="block";

            document.getElementById('btn').addEventListener('click',function(){


                var wallet=document.getElementById('wallet-amount').value;

                postData("/wallet_amount",{wallet_amount:wallet_amount}).then((response)=>{

                    if(response.status == "success"){   
                        console.log(response.data.uid);
                        console.log(response.data.wallet_amount);
                        alert("wallet amount added done.");
                    }
                    else{
                        alert("wallet amount added failed.");
                    }

                })
            })

            //logout button action
            async function logoutFunction(url=""){
                const response = await fetch (url, {
                    method : "GET"});
                
                return response.json();
            }
            
            document.getElementById("logout-button").addEventListener('click',function(){
                 
                           logoutFunction("/logout").then((response) =>{
                               console.log(response);
                               if(response.data == "success"){
                                console.log("logut success", "this is the userid", `${uId}`);
                                alert("Redirecting to Login")
                                window.location.href = "/login";
                               }
                               else{
                                console.log("logut failure");
                               }
                           })
            })
            
        }
        // logout logic
        else{
            document.getElementById("link-login").classList.remove("login-class-name");
            document.getElementById("link-profile").classList.add("link-profile-class");
            document.getElementById("logout-button").classList.add("logout");
        
            console.log("null");
        }   

  
        // Redirecting when onclick 
        document.getElementById("logo").addEventListener('click',function(){
            window.location.href = "/home"
        })

        document.getElementById("cname").addEventListener('click',function(){
            window.location.href = "/home"
        })

        document.getElementById("link-login").addEventListener('click',function(){
            window.location.href = "/login"
        })

        document.getElementById("link-home").addEventListener('click',function(){
            window.location.href = "/home"
        })
        document.getElementById("link-profile").addEventListener('click',function(){
            window.location.href = "/profile";
        })



    </script>
</body>
</html>