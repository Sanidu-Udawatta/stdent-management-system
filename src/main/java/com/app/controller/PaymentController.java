package com.app.controller;

import com.app.bean.*;
import com.app.dao.PaymentDao;
import com.app.dao.StudentDao;
import com.app.dao.TeacherDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/payment")
public class PaymentController {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private PaymentDao paymentDao;


    @RequestMapping(value = "/payment-load")
    public String payment() {
        return "payment";
    }

    @RequestMapping(value = "/student-details", method = RequestMethod.GET)
    @ResponseBody
    public Student studentDetails(@RequestParam("id") int id) {
        return studentDao.getStudentName(id);
    }

    @RequestMapping(value = "/student-subject", method = RequestMethod.GET)
    @ResponseBody
    public List<Subject> getStudentRegSubjects(@RequestParam("id") int id) {
        List<Subject> subjectList = studentDao.getStudentRelatedSubjects(id);
        return subjectList;
    }

    @RequestMapping(value = "/subject-teacher", method = RequestMethod.GET)
    @ResponseBody
    public List<Teacher> getTeacherForSubject(@RequestParam("classId") int classId) {
        List<Teacher> teacherList = teacherDao.getTeacher(classId);
        return teacherList;
    }

    @RequestMapping(value = "/last-month", method = RequestMethod.GET)
    @ResponseBody
    public Integer getPaymentMonth(@RequestParam("classId") int classId, @RequestParam("stdId") int stdId) {
        return paymentDao.getLastPaymentMonth(stdId, classId);
    }

    @RequestMapping(value = "/proceed", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<CommonResponse> pay(@ModelAttribute Payment payment) {
        String message = paymentDao.pay(payment);
        return new ResponseEntity<>(new CommonResponse(200, message), HttpStatus.OK);
    }

    @RequestMapping(value = "/view-payment-page", method = RequestMethod.GET)
    public String viewPaymentDetails(Model model, @RequestParam("id") int id){
        model.addAttribute("id", id);
        System.out.println(id);
        return "previous-payment";
    }
//
//    @RequestMapping(value = "/view-details", method = RequestMethod.GET)
//    @ResponseBody
//    public PaymentDetails getDetails(@RequestParam("id") int id) {
//
//    }

}


