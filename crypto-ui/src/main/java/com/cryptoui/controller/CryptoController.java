package com.cryptoui.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.cryptoui.util.RestUtil;
import com.fasterxml.jackson.core.JsonProcessingException;

@Configuration
@RestController
public class CryptoController {

    public Integer id=null;
    public String uid=null;


    @Autowired
    private RestUtil restUtil;

    private static final Logger LOGGER = LogManager.getLogger(CryptoController.class);



@GetMapping(value = "/register")
public ModelAndView register(){
    return new ModelAndView("register");
}

@PostMapping(value = "/doregister")
   public String adduser(HttpSession session ,String uname,String password) throws JsonProcessingException {
         try {
            // Object sid = session.getAttribute("sid");
            // if(sid != null) {
                Map<String, Object> params = new HashMap<String, Object>();
                params.put("uname",uname);
                params.put("password",password);    
                String details = restUtil.post("http://localhost:5000/adduser", params);
                return details;
            // }

            // JSONObject response = new JSONObject();
            // response.put("status", "Failed.");
            // response.put("message", "You need to be Register first.");
            // response.put("data", JSONObject.NULL);

            // return response.toString();
        } catch(Exception ex) {
            LOGGER.error("details", ex);
            JSONObject response = new JSONObject();
            response.put("status", "Failed.");
            response.put("message", "Please Fill the valid Details.");
            response.put("data", JSONObject.NULL);

            return response.toString();
        }
    }


////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@GetMapping(value = "/login")
public ModelAndView login(){
    return new ModelAndView("login");
}

@PostMapping(value = "/login")
   public String getuser(HttpSession session ,String uname,String password) throws JsonProcessingException {
         try {
            // Object sid = session.getAttribute("sid");
            // System.out.println(sid);
            // if(sid != null) {
                Map<String, Object> params = new HashMap<String, Object>();
                params.put("uname",uname);
                params.put("password",password);    
                String details = restUtil.post("http://localhost:5000/getdetails", params);
                System.out.println(details);
                
                JSONObject json=new JSONObject(details);
                JSONObject id_data=json.getJSONObject("data");
                id=id_data.getInt("sid");
                System.out.println(id);



                Integer userSessionId =  id;
                // Integer userSessionId = null;
                session.setAttribute("uId", userSessionId);

                return details;
            // }

            // JSONObject response = new JSONObject();
            // response.put("status", "Failed.");
            // response.put("message", "You need to be Register first.");
            // response.put("data", JSONObject.NULL);

            // return response.toString();

        } catch(Exception ex) {
            LOGGER.error("details", ex);
            JSONObject response = new JSONObject();
            response.put("status", "Failed.");
            response.put("message", "Please Fill the valid Details.");
            response.put("data", JSONObject.NULL);

            return response.toString();
        }
    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


@GetMapping(value= "/logout")
public String logout(HttpSession session ){
    session.setAttribute("uId", null);
    JSONObject response = new JSONObject();
    if (session.getAttribute("uid") == null) {
        session.invalidate();
        // return response.toString();
        response.put("data", "success");
        // return;
    }
    
    return response.toString();
    
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


@GetMapping(value = "/admin")
public ModelAndView admin(){
    return new ModelAndView("admin");
}

@PostMapping(value = "/admin")
   public String addcoin(HttpSession session, String sid,String cname,String cprice) throws JsonProcessingException {
         try {
                Map<String, Object> params = new HashMap<String, Object>();
                params.put("sid", sid);
                params.put("cname",cname);
                params.put("cprice",cprice);    
                String details = restUtil.post("http://localhost:5000/addcoin", params);
                return details;

        } catch(Exception ex) {
            LOGGER.error("details", ex);
            JSONObject response = new JSONObject();
            response.put("status", "Failed.");
            response.put("message", "Given values may Worng try Different values.");
            response.put("data", JSONObject.NULL);

            return response.toString();
        }
    }


@GetMapping(value = "/showdata")
public String show_data (HttpSession session){
    try{
       
        Map<String,Object>params=new HashMap<String,Object>();
        String datashow = restUtil.get("http://localhost:5000/showdata",params);

        return datashow;

        
    }
    catch(Exception ex){
        JSONObject response=new JSONObject();
        response.put("status", "failure");
        response.put("message", "unable to get the details!");
        response.put("data", JSONObject.NULL);
        return response.toString();
    }
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


@GetMapping(value = "/home")
public ModelAndView home(){
    return new ModelAndView("home");
}


@PostMapping(value = "/wallet_amount")
   public String add_wallet_amount(HttpSession session, Float wallet_amount) throws JsonProcessingException {
         try {
            // Object uid =session.getAttribute("uid");
            // System.out.println(sid);
            // if(uid != null) {
                Map<String, Object> params = new HashMap<String, Object>();
                params.put("uid",id);
                params.put("wallet_amount", wallet_amount);  
                System.out.println(params);  
                String details = restUtil.post("http://localhost:5000/wallet_amount", params);
                System.out.println(details);
                return details;
            // }

            // JSONObject response = new JSONObject();
            // response.put("status", "failure");
            // response.put("message", "You need to be logged in to view details!");
            // response.put("data", JSONObject.NULL);

            // return response.toString();

        } catch(Exception ex) {
            LOGGER.error("details", ex);
            JSONObject response = new JSONObject();
            response.put("status", "Failed.");
            response.put("message", "eeeeeeeeeeeeeeeeeee try again");
            response.put("data", JSONObject.NULL);

            return response.toString();
        }
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////////



@GetMapping(value = "/profile")
public ModelAndView profile(){
    return new ModelAndView("profile");
}




}


