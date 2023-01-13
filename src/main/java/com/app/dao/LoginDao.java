package com.app.dao;

import com.app.security.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {

    private JdbcTemplate jdbcTemplate;
    private MD5 md5;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Autowired
    public void setMd5(MD5 md5) {
        this.md5 = md5;
    }

    public int checkLogin(String username, String password) {
        String encryptedPassword = md5.encrypt(password);
        String query = "SELECT id FROM admin WHERE username = ? AND password = ?";
        try {
            int id = jdbcTemplate.queryForObject(query, Integer.class, username, encryptedPassword);
            return id;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
