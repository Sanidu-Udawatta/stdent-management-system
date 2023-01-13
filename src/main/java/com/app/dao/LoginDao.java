package com.app.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public boolean checkLogin(String username, String password) {
        try {
            String sql = "select count(*) from admin where username ='" + username + "' and password ='" + password + "' limit 1";
            int i = jdbcTemplate.queryForObject(sql, Integer.class);
            return i > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
