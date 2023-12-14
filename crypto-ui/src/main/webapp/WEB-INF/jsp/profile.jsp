<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRYPTOKING</title>
    <link rel="stylesheet"  href="static/css/pro-style.css">
</head>
<body>
    <div id="full-page">

        <div id="nav">
            <div id="logo-container">
                <img id="logo" src="static/images/images.png" alt="image">
                <h1 id="cname" style="cursor: default;">CRYPTOKING</h1>
            </div>
            <div id="link-container">
                <ul class="unordered"> 
                    <li><a href="#About" id="link-about" >About</a></li>
                    <li><a href="#Home" id="link-home">Home</a></li>
                    <li><a class = "link-profile" id="link-profile" style="cursor: pointer;">Profile</a></li>
                    <li><a class="logout" id="logout-button" style="cursor: pointer;">Logout</a></li>
                </ul>
            </div>    
        </div>


        <div class="pro-file">
            <img class="profile-pic" src="static/images/profile-pic.jpg">


            <label class="upload-button">
                <!-- <i class="fa fa-upload fa-2x" aria-hidden="true"></i> -->
                <img src="static/images/cam.png" alt="camera" id="upload-img" class="upload-image">
                <input type="file" style="display: none;">
            </label>

            <!-- <div class="p-image">
                <input class="file-upload" type="file" accept="image/*">
            </div> -->
        </div>
      

        <div class="edit_field">
            <table id="tab-d">
                <tr>
                    <td><span class="at-name">Nickname </span></td>
                    <td><input id="nick-put" class="in-put" onfocus="this.placeholder=''" onblur="this.placeholder='Nick-Name'" placeholder="Nick-Name"></td>
                </tr>
                <tr>
                    <td><hr class="line-hr"></td>
                    <td><hr class="line-hr"></td>
                </tr>
                <tr>
                    <td><span class="at-name">Username </span></td>
                    <td><div id="h3-span-put">
                        <span class="h3-put" id="u-name" onfocus="this.placeholder=''" onblur="this.placeholder='User-Name'" placeholder="User-Name"></span>
                    </div></td>
                </tr>
                <tr>
                    <td><hr class="line-hr"></td>
                    <td><hr class="line-hr"></td>
                </tr>
                <tr>
                    <td><span class="at-name">Proof-ID </span></td>
                    <td><input id="proof-put" class="in-put" onfocus="this.placeholder=''" onblur="this.placeholder='Proof-ID'" placeholder="Proof-ID"></td>
                </tr>
            </table>
        </div>

        <div class="btn-class">            
            <div class="div-marquee">
                <marquee behavior="left" direction="alternative" style="color: white;">Proof-ID : Adhar-Id or Voter-Id or PAN </marquee>
            </div>
            <div class="btn-div-class">
                <button  id="btn-id" class="btn">Submit</button>
            </div>
        </div>
    </div>
<script>

        document.getElementById("upload-img").addEventListener ('mouseover',function(){

            document.getElementById("upload-img").setAttribute('src',"static/images/camgrey.png");

        })
        document.getElementById("upload-img").addEventListener ('mouseout',function(){

            document.getElementById("upload-img").setAttribute('src',"static/images/cam.png");

        })
        document.getElementById("upload-img").addEventListener ('click',function(){

            document.getElementById("upload-img")

        })


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
                                alert("Redirecting to Home")
                                window.location.href = "/home";
                               }
                               else{
                                console.log("logut failure");
                               }
                           })
            })
    
            document.getElementById("link-home").addEventListener('click',function(){
                window.location.href = "/home"
            })  
            document.getElementById("link-profile").addEventListener('click',function(){
                window.location.href = "/profile"
            })  

        let u = `${uname}`;//user name
        let uid =`${uId}`;
        console.log(u);
        console.log(uid)
        document.getElementById("u-name").textContent=u.toUpperCase() ;
        
        
        async function edited_table(url = "", data = {}) {
            const response = await fetch(url, {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: new URLSearchParams(data).toString()
            });
       
            return response.json();
        }

        
        document.getElementById("btn-id").addEventListener('click',function(){
            
            var nick = document.getElementById("nick-put").value
            var proof = document.getElementById("proof-put").value

            edited_table("/profile",{uid:uid,nick:nick,proof:proof}).then(response =>{

            })
        })        
        



</script>

</body>
</html>