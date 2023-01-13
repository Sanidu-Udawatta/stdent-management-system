package com.app.controller;

import com.app.bean.Teacher;
import com.app.dao.DayTimeDao;
import com.app.dao.SubjectDao;
import com.app.dao.TeacherDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/subject")
public class SubjectController {

    @Autowired
    private SubjectDao subjectDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private DayTimeDao dayTimeDao;

    @RequestMapping(value = "/grade", method = RequestMethod.GET, headers = "Accept=*/*")
    @ResponseBody
    public ResponseEntity<List<String>> getSubjectsForGrade(@RequestParam String grade) {
        return ResponseEntity.ok(subjectDao.getSubjectsForGrade(grade));
    }

    @RequestMapping(value = "/subject", method = RequestMethod.GET, headers = "Accept=*/*")
    @ResponseBody
    public ResponseEntity<List<Teacher>> getTeacherFroSubject(@RequestParam String subject) {
        return ResponseEntity.ok(teacherDao.getTeacherFroSubject(subject));
    }

    @RequestMapping(value = "/days", method = RequestMethod.GET, headers = "Accept=*/*")
    @ResponseBody
    public ResponseEntity<List<String>> getTeacherForDays(@RequestParam String grade, @RequestParam String subject, @RequestParam String teacher) {
        return ResponseEntity.ok(dayTimeDao.getDaysForTeachers(grade, subject, teacher));
    }

    @RequestMapping(value = "/time", method = RequestMethod.GET, headers = "Accept=*/*")
    @ResponseBody
    public ResponseEntity<List<String>> getTeacherForTime(@RequestParam String grade, @RequestParam String subject, @RequestParam String teacher, @RequestParam String day){
        return ResponseEntity.ok(dayTimeDao.getTimeForTeacher(grade, subject, teacher, day));
    }
}
