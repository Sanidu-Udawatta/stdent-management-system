package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {

    @RequestMapping(value = "/teacher-tab")
    public String teacherTab() {
        return "teacher";
    }
}
