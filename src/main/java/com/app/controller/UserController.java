package com.app.controller;

import com.app.bean.Student;
import com.app.bean.User;
import com.app.dao.StudentDao;
import com.app.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping(value = "/student")
public class UserController {

    @Autowired
//    private StudentDao studentDao;
    private UserDao userDao;

//    @RequestMapping (value = "/save", method = RequestMethod.POST)
//    public ResponseEntity<>saveStudent(@ModelAttribute("student")Student student){
//        boolean b = studentDao.saveStudent(student);
//        String msg = b? "Student save successfull":"fail save";
//        System.out.println(msg);
//        return new ResponseEntity<>(new (200,msg), HttpStatus.OK);
//
//    }
//
//    @RequestMapping(value = "/register", method = RequestMethod.POST)
//    public String register(@ModelAttribute("user") User user, Model model) {
//        if (userDao.save(user)) {
//            model.addAttribute("msg", "Registration Successful!");
//        } else {
//            model.addAttribute("msg", "Error occurred. Please try again");
//        }
//        return "display";
//    }
//
//    @RequestMapping(value = "/student", method = RequestMethod.GET)
//    public String viewStudents(@ModelAttribute("user") User user, Model model) {
//        return "student";
//    }
//
//    @RequestMapping(value = "/add-new-student", method = RequestMethod.GET)
//    public String viewStudents1(@ModelAttribute("user") User user, Model model) {
//        return "add-new-student";
//    }
//
//    @RequestMapping(value = "/view-student", method = RequestMethod.GET)
//    public String viewStudents2(@ModelAttribute("user") User user, Model model) {
//        return "view-student";
//    }
//
//    @RequestMapping(value = "/add-new-teacher", method = RequestMethod.GET)
//    public String viewStudents3(@ModelAttribute("user") User user, Model model) {
//        return "add-new-teacher";
//    }
//
//    @RequestMapping(value = "/view-teacher", method = RequestMethod.GET)
//    public String viewStudents4(@ModelAttribute("user") User user, Model model) {
//        return "view-teacher";
//    }
//
//    @RequestMapping(value = "/update-student", method = RequestMethod.GET)
//    public String viewStudents5(@ModelAttribute("user") User user, Model model) {
//        return "update-student";
//    }
//
//    @RequestMapping(value = "/classes", method = RequestMethod.GET)
//    public String viewStudents6(@ModelAttribute("user") User user, Model model) {
//        return "classes";
//    }
}
