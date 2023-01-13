package com.app.controller;

import com.app.bean.Classes;
import com.app.bean.CommonResponse;
import com.app.bean.Grade;
import com.app.bean.Student;
import com.app.dao.ClassDao;
import com.app.dao.SubjectDao;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/class")
public class ClassController {

    @Autowired
    private ClassDao classDao;

    @Autowired
    private SubjectDao subjectDao;

    @RequestMapping(value = "/saveClass", method = RequestMethod.POST)
    public ResponseEntity<CommonResponse> saveClasses(@ModelAttribute("classes") Classes classes) {
        try {
            boolean b = classDao.saveClass(classes);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(new CommonResponse(HttpStatus.BAD_REQUEST.value(), e.getMessage()), HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(new CommonResponse(200, "classes Saved Successfully"), HttpStatus.OK);
    }

    @RequestMapping(value = "/deleteClass", method = RequestMethod.POST)
    public ResponseEntity<CommonResponse> deleteClass(@ModelAttribute("classes") Classes classes) {
        try {
            boolean b = classDao.deleteClass(classes);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(new CommonResponse(HttpStatus.BAD_REQUEST.value(), e.getMessage()), HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity<>(new CommonResponse(200, "classes Deleted Successfully"), HttpStatus.OK);
    }

    @RequestMapping(value = "/update-student-class", method = RequestMethod.POST)
    public ResponseEntity<CommonResponse> updateStudentClass(@ModelAttribute("classes") Classes classes) {
        try {
            boolean b = classDao.updateStudentClass(classes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<>(new CommonResponse(200, "classes Updated Successfully"), HttpStatus.OK);
    }

    @RequestMapping(value = "/class-page")
    public String viewClasspage(Model model) {
        List<Grade> gradeList = subjectDao.getGradeList();
        model.addAttribute("gradeList", gradeList);
        return "classes";
    }

    @RequestMapping(value = "/class-detail", method = RequestMethod.GET)
    @ResponseBody
    public List<Classes> getClassDetail(@RequestParam String grade, @RequestParam String subject) {
        return classDao.getClassDetail(grade, subject);
    }
}


