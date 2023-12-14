<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRYPTOKING</title>
</head>
<body>

    <div>
        <input id="wallet-amount" type="number"><button id="btn">deposit</button>
    </div>

    <script>
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
        
      //  document.getElementById('btn').style.display="block";
      //  document.getElementById('wallet-amount').style.display="block";
      //  document.getElementById('wallet-amount').style.marginTop="10px";

        document.getElementById('btn').addEventListener('click',function(){


            var wallet=document.getElementById('wallet-amount').value;

            postData("/wallet_amount",{wallet_amt:wallet}).then((response)=>{ 

                if(response.status == "success"){   
                    console.log(response.data.uid);
                    console.log(response.data.wallet_amount);
                    alert("wallet amount added done.");
                }
                else{
                    alert("wallet amount adding failed.");
                }

            })
        })

    </script>
</body>
</html>