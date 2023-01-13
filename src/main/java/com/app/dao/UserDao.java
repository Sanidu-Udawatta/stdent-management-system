package com.app.dao;

import com.app.bean.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class UserDao {

    JdbcTemplate template;

    @Autowired
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public boolean save(User user) {
        String sql = "INSERT INTO user(firstname, lastname, username, password) VALUES('" + user.getFirstName() + "', '" + user.getLastName() + "', '" + user.getUsername() + "', '" + user.getPassword() + "')";
        return template.update(sql) > 0;
    }
}
