package com.app.dao;

import com.app.bean.Classes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.util.List;

@Repository
public class ClassDao {
    JdbcTemplate jdbcTemplate;


    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean saveClass(Classes classes) {
        String query = "SELECT id FROM class WHERE day=? AND time=? AND subjectName=? AND gradeName=? AND teacherId=?";
        double id = jdbcTemplate.queryForObject(query, int.class, classes.getDay(), classes.getTime(), classes.getSubject(), classes.getGrade(), classes.getTeacherId());

        String query2 = "INSERT INTO class_student_enrollment(datetime, studentId, classId) VALUES (now(), ?, ?)";
        int i = jdbcTemplate.update(query2, classes.getStudentId(), id);

        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    public List<Classes> getStudentRegisterClasses(int id) {
        String query = "SELECT c.subjectName ,t.firstName AS tFirstName, t.lastName AS tLastName,t.id as tid, c.day, c.time, e.datetime FROM student s JOIN class_student_enrollment e ON s.Id=e.studentId JOIN class c ON c.id=e.classId JOIN teacher t ON t.id=c.teacherId WHERE s.id=?";
        return jdbcTemplate.query(query, this::mapToRowClass, id);
    }

    private Classes mapToRowClass(ResultSet rs, int i) {
        Classes classes = new Classes();
        try {
            classes.setSubject(rs.getString("subjectName"));
            classes.setTeacherId(rs.getInt("tId"));
            classes.setTeachFirstName(rs.getString("tFirstName"));
            classes.setTeachLastName(rs.getString("tLastName"));
            classes.setDay(rs.getString("day"));
            classes.setTime(rs.getString("time"));
            classes.setRegDate(rs.getString("datetime"));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return classes;
    }

    public boolean deleteClass(Classes classes) {
        String query = "SELECT id FROM class WHERE day=? AND time=? AND subjectName=? AND gradeName=? AND teacherId=?";
        double id = jdbcTemplate.queryForObject(query, int.class, classes.getDay(), classes.getTime(), classes.getSubject(), classes.getGrade(), classes.getTeacherId());

        String query2 = "DELETE FROM class_student_enrollment WHERE classId=? AND studentId=?";
        int i = jdbcTemplate.update(query2, id, classes.getStudentId());

        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean updateStudentClass(Classes classes) {
        String query = "SELECT id FROM class WHERE day=? AND time=? AND subjectName=? AND gradeName=? AND teacherId=?";
        int classId = jdbcTemplate.queryForObject(query, int.class, classes.getDay(), classes.getTime(), classes.getSubject(), classes.getGrade(), classes.getTeacherId());

        String query2 = "SELECT COUNT(id) AS enrollCount FROM class_student_enrollment WHERE studentId =? AND classId = ?";
        int enrollCount = jdbcTemplate.queryForObject(query2, int.class, classes.getStudentId(), classId);

        if (enrollCount == 0) {
            String query3 = "INSERT INTO class_student_enrollment(datetime, studentId, classId) VALUES (now(), ?, ?)";
            try {
                int i = jdbcTemplate.update(query3, classes.getStudentId(), classId);
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
            return true;
        } else {
            return false;
        }
    }

    public List<Classes> getClassDetail(String grade, String subject) {
        String query = "SELECT * FROM class c JOIN teacher t ON c.teacherId=t.id WHERE c.subjectName=? AND c.gradeName=?";
        return jdbcTemplate.query(query, this::mapToClassDetails,subject, grade);
    }

    private Classes mapToClassDetails(ResultSet rs, int i) {
        Classes classes = new Classes();
        try {
            classes.setTeacherId(rs.getInt("teacherId"));
            classes.setTeachFirstName(rs.getString("firstName"));
            classes.setTeachLastName(rs.getString("lastName"));
            classes.setDay(rs.getString("day"));
            classes.setTime(rs.getString("time"));
            System.out.println(classes.getTeachFirstName());
            System.out.println(classes.getDay());
            System.out.println(classes.getTime());
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(classes);
        return classes;
    }
}
