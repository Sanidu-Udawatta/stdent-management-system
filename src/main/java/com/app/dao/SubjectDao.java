package com.app.dao;

import com.app.bean.Grade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.util.List;

@Repository
public class SubjectDao {

    JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Grade> getGradeList() {
        String sql = "SELECT * FROM grade";
        return jdbcTemplate.query(sql, this::mapRowToGrade);
    }

    public List<String> getSubjectsForGrade(String grade) {
        String sql = "SELECT subjectName FROM class WHERE gradeName =?";
        return jdbcTemplate.queryForList(sql, String.class, grade);
    }

    private Grade mapRowToGrade(ResultSet rs, int i) {
        Grade grade = new Grade();
        try {
            grade.setName(rs.getString("name"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return grade;
    }
}
