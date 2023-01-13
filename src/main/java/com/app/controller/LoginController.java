package com.app.controller;

import com.app.bean.Login;
import com.app.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    @Autowired
    private LoginDao loginDao;

    @RequestMapping(value = "/login/check", method = RequestMethod.POST)
    public String checkLogin(@ModelAttribute Login login) {
        if (loginDao.checkLogin(login.getUsername(), login.getPassword())) {
            return "student";
        } else {
            return "";
        }
    }

    @RequestMapping(value = "/home")
    public String home() {
        return "student";
    }

}
