package com.app.controller;

import com.app.bean.Classes;
import com.app.bean.CommonResponse;
import com.app.bean.Grade;
import com.app.bean.Student;
import com.app.dao.ClassDao;
import com.app.dao.StudentDao;
import com.app.dao.SubjectDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.Subject;
import java.sql.ResultSet;
import java.util.List;

@Controller
@RequestMapping(value = "/student")
public class StudentController {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private SubjectDao subjectDao;

    @Autowired
    private ClassDao classDao;

    @RequestMapping(value = "/add-new", method = RequestMethod.GET)
    public String viewAddNewStudent(Model model) {
        int nextStudentId = studentDao.getNextStudentId();
        model.addAttribute("nextStudentId", nextStudentId);

        List<Grade> gradeList = subjectDao.getGradeList();
        model.addAttribute("gradeList", gradeList);
        return "add-new-student";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ResponseEntity<CommonResponse> saveStudent(@ModelAttribute("student") Student student) {
        try {
            boolean b = studentDao.saveStudent(student);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(new CommonResponse(HttpStatus.BAD_REQUEST.value(), e.getMessage()), HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(new CommonResponse(200, "Student Saved Successfully"), HttpStatus.OK);
    }


    @RequestMapping(value = "/view-details", method = RequestMethod.GET, headers = "Accept=*/*")
    public String getStudentDetails(Model model, @RequestParam("id") int id) {
        Student student = new Student();
        student = studentDao.getStudentDetails(id);
        int studentId = student.getId();
        String firstName = student.getFirstName();
        String lastName = student.getLastName();
        String gender = student.getGender();
        String grade = student.getGrade();
        String school = student.getSchool();
        String dob = student.getDob();
        String address = student.getAddress();
        String guardianName = student.getGuardianName();
        String guardianPhone = student.getContactNo();

        model.addAttribute("id", studentId);
        model.addAttribute("firstName", firstName);
        model.addAttribute("lastName", lastName);
        model.addAttribute("gender", gender);
        model.addAttribute("grade", grade);
        model.addAttribute("school", school);
        model.addAttribute("dob", dob);
        model.addAttribute("address", address);
        model.addAttribute("guardianName", guardianName);
        model.addAttribute("guardianPhone", guardianPhone);

        Classes classes = new Classes();
        List<Classes> classesList = classDao.getStudentRegisterClasses(id);
        model.addAttribute("classes", classesList);

        return "view-student";

    }

    @RequestMapping(value = "/update-view", method = RequestMethod.GET)
    public String viewUpdateStudent(Model model, @RequestParam("id") int id) {
        Student student = new Student();
        student = studentDao.getStudentDetails(id);
        int studentId = student.getId();
        String firstName = student.getFirstName();
        String lastName = student.getLastName();
        String gender = student.getGender();
        String grade = student.getGrade();
        String school = student.getSchool();
        String dob = student.getDob();
        String address = student.getAddress();
        String guardianName = student.getGuardianName();
        String guardianPhone = student.getContactNo();

        model.addAttribute("id", studentId);
        model.addAttribute("firstName", firstName);
        model.addAttribute("lastName", lastName);
        model.addAttribute("gender", gender);
        model.addAttribute("grade", grade);
        model.addAttribute("school", school);
        model.addAttribute("dob", dob);
        model.addAttribute("address", address);
        model.addAttribute("guardianName", guardianName);
        model.addAttribute("guardianPhone", guardianPhone);

        Classes classes = new Classes();
        List<Classes> classesList = classDao.getStudentRegisterClasses(id);
        model.addAttribute("classes", classesList);

        List<Grade> gradeList = subjectDao.getGradeList();
        model.addAttribute("gradeList", gradeList);
        return "update-student";

    }

    @RequestMapping(value = "/update-student", method = RequestMethod.POST)
    public ResponseEntity<CommonResponse> updateStudent(@ModelAttribute("student") Student student) {
        System.out.println(student.getFirstName());
        try {
            boolean b = studentDao.updateStudent(student);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(new CommonResponse(HttpStatus.BAD_REQUEST.value(), e.getMessage()), HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(new CommonResponse(200, "Student Updated Successfully"), HttpStatus.OK);

    }


}
