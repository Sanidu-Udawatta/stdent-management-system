package com.app.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class DayTimeDao {
    JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<String> getDaysForTeachers(String grade, String subject, String teacher){
        String sql = "SELECT day FROM class c JOIN teacher t WHERE c.gradeName=? AND c.subjectName=? AND t.id=?";
        return jdbcTemplate.queryForList(sql, String.class, grade, subject, teacher);

    }

    public List<String> getTimeForTeacher(String grade, String subject, String teacher, String day){
        String sql = "SELECT time FROM class c JOIN teacher t WHERE c.gradeName=? AND c.subjectName=? AND t.id=? AND c.day=?";
        return jdbcTemplate.queryForList(sql, String.class, grade, subject, teacher, day);

    }



}
