package com.app.bean;

import java.io.Serializable;

public class Classes implements Serializable {

    private int studentId;
    private String grade;
    private String subject;
    private int teacherId;
    private String day;
    private String time;
    private String regDate;
    private String teachFirstName;
    private String teachLastName;

    public Classes() {
    }

    public String getTeachFirstName() {
        return teachFirstName;
    }

    public void setTeachFirstName(String teachFirstName) {
        this.teachFirstName = teachFirstName;
    }

    public String getTeachLastName() {
        return teachLastName;
    }

    public void setTeachLastName(String teachLastName) {
        this.teachLastName = teachLastName;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Classes{" +
                "studentId=" + studentId +
                ", grade='" + grade + '\'' +
                ", subject='" + subject + '\'' +
                ", teacherId=" + teacherId +
                ", day='" + day + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}
