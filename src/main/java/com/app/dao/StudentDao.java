package com.app.dao;

import com.app.bean.Student;
import com.app.bean.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.util.List;

@Repository
public class StudentDao {

    JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate template) {
        this.jdbcTemplate = template;
    }

    public boolean saveStudent(Student student) {
        String query = "INSERT INTO student(" +
                "id, firstName, lastName," +
                "gender, grade, school, " +
                "dob, address, guardianName, " +
                "guardianContactNo) " +
                "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


        try {
            int i = jdbcTemplate.update(query,
                    student.getId(),
                    student.getFirstName(),
                    student.getLastName(),
                    student.getGender(),
                    student.getGrade(),
                    student.getSchool(),
                    student.getDob(),
                    student.getAddress(),
                    student.getGuardianName(),
                    student.getContactNo());
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;

    }

    public int getNextStudentId() {
        int id = -1;
        String sql = "SELECT id FROM student ORDER BY  id DESC LIMIT 1";
        try {
            id = jdbcTemplate.queryForObject(sql, Integer.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id + 1;
    }

    public Student getStudentDetails(int id) {
        String sql = "SELECT * FROM student WHERE id =?";
        return jdbcTemplate.queryForObject(sql, this::mapToStudents, id);
    }

    private Student mapToStudents(ResultSet rs, int i) {
        Student student = new Student();
        try {
            student.setId(rs.getInt("id"));
            student.setFirstName(rs.getString("firstName"));
            student.setLastName(rs.getString("lastName"));
            student.setGender(rs.getString("gender"));
            student.setGrade(rs.getString("grade"));
            student.setSchool(rs.getString("school"));
            student.setDob(rs.getString("dob"));
            student.setAddress(rs.getString("address"));
            student.setGuardianName(rs.getString("guardianName"));
            student.setContactNo(rs.getString("guardianContactNo"));

        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;
    }

    public boolean updateStudent(Student student) {
        String query = "UPDATE student SET firstName=? , lastName=?, gender=? , grade=? ,school= ?, dob=? , address=? , guardianName=?, guardianContactNo=? WHERE id=?";
        int i = jdbcTemplate.update(query, student.getFirstName(), student.getLastName(),
                student.getGender(), student.getGrade(), student.getSchool(), student.getDob(), student.getAddress(),
                student.getGuardianName(), student.getContactNo(), student.getId());

        if (i > 0) {
            return true;
        } else {
            return false;
        }

    }

    public Student getStudentName(int id) {
        String sql = "SELECT * FROM student WHERE id=?";
        return jdbcTemplate.queryForObject(sql, this::mapToStudentName, id);
    }

    private Student mapToStudentName(ResultSet rs, int i) {
        Student student = new Student();
        try {
            student.setFirstName(rs.getString("firstName"));
            student.setLastName(rs.getString("lastName"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return student;
    }

    public List<Subject> getStudentRelatedSubjects(int id) {
        String sql = "SELECT * FROM class_student_enrollment c JOIN class s ON s.id=c.classId WHERE studentId=?";
        return jdbcTemplate.query(sql, this::mapToSubjects, id);
    }

    private Subject mapToSubjects(ResultSet rs, int i) {
        Subject subject = new Subject();
        try {
            subject.setClassId(rs.getInt("classId"));
            subject.setSubjectName(rs.getString("subjectName"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return subject;

    }

}

