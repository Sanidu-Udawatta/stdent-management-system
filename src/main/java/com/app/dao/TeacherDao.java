package com.app.dao;
import com.app.bean.Teacher;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.util.List;


@Repository
public class TeacherDao {
    JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Teacher> getTeacherFroSubject(String subjectName) {
        String query = "SELECT DISTINCT teacherId,firstName,lastName FROM class c JOIN teacher t ON c.teacherId=t.id WHERE c.subjectName= ? ";
        return jdbcTemplate.query(query, this::mapRowToTeacher, subjectName);
    }

    private Teacher mapRowToTeacher(ResultSet rs, int i) {
        Teacher teacher = new Teacher();
        try {
            teacher.setId(rs.getDouble("teacherId"));
            teacher.setFirstName(rs.getString("firstName"));
            teacher.setLastName(rs.getString("lastName"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return teacher;
    }


    public List<Teacher> getTeacher(int classId) {
        String sql = "SELECT * FROM class c JOIN teacher t ON t.id = c.teacherId WHERE c.id=?";
        return jdbcTemplate.query(sql, this::mapRowToTeachers, classId);
    }
    private Teacher mapRowToTeachers(ResultSet rs, int i) {
        Teacher teacher = new Teacher();
        try {
            teacher.setId(rs.getDouble("teacherId"));
            teacher.setFirstName(rs.getString("firstName"));
            teacher.setLastName(rs.getString("lastName"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return teacher;
    }
}
