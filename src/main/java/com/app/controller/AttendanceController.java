package com.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/attendance")
public class AttendanceController {

    @RequestMapping(value = "/attendance-load")
    public String attendanceView(){
        return "attendance";
    }
}
