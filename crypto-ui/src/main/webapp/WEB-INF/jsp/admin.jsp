<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRYPTOKING</title>
    <style>
        body{
            font-family: 'Poppins', sans-serif;
            background-color: rgb(32, 29, 29);
        }
        #heading{
            color: white;
            font-size: xx-large;
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        span{
            border: 2px solid; 
            border-color: #16a085;
            border-radius: 4px;
            padding: 10px;
        }
        h2{
            color: white;
            margin: auto;
            margin-left: 10px;
            margin-right: 10px;
            
        }
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
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

        #note{
            color: white;
            font-size: 20px;

        }
              
        table,tr,td{
            color: white;
            border: 2px solid white;
            border-collapse: collapse;
            width: 50%;
            border-color: #16a085;
                     
        }
        th{
            color: white;
            border: 2px solid white;
            border-collapse: collapse;
            width: 50%;
            padding: 10px;
            border-color: #16a085;

        }
        td{
            padding: 10px;
            text-align: center;
        }
        .txt{
           border-color: #16a085;
           border-radius: 2px;
           height: 20px;
           outline: none;
        }
        #btn{
            border-radius: 3px;
            border-color: #16a085;
            height: 25px;
            width: 50px;
            background: white;
            font-size: large;
        }
        #btn:hover{
            background-image: linear-gradient(-60deg, #16a085 0%, #62dfca 100%);
        }
        #tab{
            margin-top: 35px;
            display: flex;
            justify-content:center;
            text-align: center;

        }
        #adddata{
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }
        hr{
            border: none;
            height: 2px;
            background-image: linear-gradient(-60deg, #16a085 0%, #62dfca 100%);
        }
    </style>
</head>
<body>
    <div id="heading">
        <span>Admin</span>
    </div>
    <hr>
    <div id="adddata">
        <h2>Coin_Id</h2>
        <input type="number" class="txt" id="sid" onfocus="this.placeholder=''" onblur="this.placeholder='Enter Coin_ID'" placeholder="Coin ID">
        <h2>Coin_Name</h2>
        <input type="text" class="txt" id="cname" onfocus="this.placeholder=''" onblur="this.placeholder='Enter Coin_Name'" placeholder="Coin Name">
        <h2>Coin_Price</h2>
        <input type="number" class="txt" id="cprice" onfocus="this.placeholder=''" onblur="this.placeholder='Enter Coin_Price'" placeholder="Coin Price">
        <button id="btn">Add</button>
    </div>
    <hr>
    <div id="note">
        <marquee behavior="left" direction="alternative">Coin price should be > 0.00 and < 1000.00</marquee>
    </div>
    <div id="tab">
        <table id="coin">
            <tr>
                <th>Coin_Id</th>
                <th>Coins</th>
                <th>Current_Price</th>
            </tr>
        </table>
    </div>



    <script type="text/javascript">
        async function getData(url = "") {
            const response = await fetch(url, {
                method: "GET"
            });

            return response.json();
        }
        
        getData("/showdata").then((response) =>{
            console.log(response);
            if(response.status == 'success'){

                for(i=0;i<response.data.length;i++){
                    id=response.data[i].sid;
                    name=response.data[i].cname;
                    price=response.data[i].cprice;

                    var ccoin = document.getElementById("coin");
                    var ctr = document.createElement("tr");
                    ccoin.appendChild(ctr);

                    var cdata = document.createElement('td');
                    cdata.textContent=id;
                    ctr.appendChild(cdata);

                    var cdata = document.createElement('td');
                    cdata.textContent=name;
                    ctr.appendChild(cdata);

                    var cdata = document.createElement('td');
                    cdata.textContent=price;
                    ctr.appendChild(cdata); 
                }
            }
            else{
                alert("Something Went Wrong Please check all process running Correctly.");
            }
        })

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
        
        document.getElementById('btn').addEventListener('click',function(){
            var sid = document.getElementById('sid').value;
            var cname = document.getElementById('cname').value;
            var cprice = document.getElementById('cprice').value;
            console.log(sid);
            console.log(cname);
            console.log(cprice);

            if(cprice >=0.00 && cprice <=999.99){
                postData("/admin",{sid:sid,cname:cname,cprice:cprice}).then((response) =>{
                    
                    if(response.status=='success'){
                        alert("Data Added Successufully."); 
                        window.location.href='/admin';   
                    }
                    else{
                        alert(response.message); 
                    }
                    })
                }
            else{
                alert("Coin Price is not Valid. ");
            }
        })
    </script>
</body>
</html>

