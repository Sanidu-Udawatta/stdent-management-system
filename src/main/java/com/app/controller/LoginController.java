package com.app.controller;

import com.app.bean.Login;
import com.app.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    private LoginDao loginDao;

    @RequestMapping(value = "/login/check", method = RequestMethod.POST)
    public void checkLogin(@ModelAttribute Login login, HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = loginDao.checkLogin(login.getUsername(), login.getPassword());
        if (id > 0) {
            request.getSession().setAttribute("user", id);
            response.sendRedirect(request.getContextPath() + "/home");
        } else {
            response.sendRedirect(request.getContextPath());
        }
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("user");
        response.sendRedirect(request.getContextPath());
    }

    @RequestMapping(value = "/home")
    public String home() {
        return "student";
    }

}
