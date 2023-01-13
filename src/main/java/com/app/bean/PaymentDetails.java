package com.app.bean;

import java.io.Serializable;
import java.util.List;

public class PaymentDetails implements Serializable {
    private String studentFirstName;
    private String studentLastName;
    private List<Teacher> teachersList;

    public String getStudentFirstName() {
        return studentFirstName;
    }

    public void setStudentFirstName(String studentFirstName) {
        this.studentFirstName = studentFirstName;
    }

    public String getStudentLastName() {
        return studentLastName;
    }

    public void setStudentLastName(String studentLastName) {
        this.studentLastName = studentLastName;
    }

    public List<Teacher> getTeachersList() {
        return teachersList;
    }

    public void setTeachersList(List<Teacher> teachersList) {
        this.teachersList = teachersList;
    }

    public PaymentDetails() {
    }
}
