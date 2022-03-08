/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fptuni.prj301.demo.dbmanager;

import com.fptuni.prj301.demo.model.UserSession;
import java.util.Date;

/**
 *
 * @author ASUS
 */
public class AccessManager {
     public UserSession login (String username, String password){
        if (username.equals("duc")&& password.equals("1")){
            UserSession us =  new UserSession();
            us.setUsername(username);
            us.setLoginDate(new Date());
            
            us.setAccessRight("Admin");
            return us;
        }
        return null;
    }
}
