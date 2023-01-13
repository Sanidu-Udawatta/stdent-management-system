package com.app.dao;

import com.app.bean.Payment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDao {
    JdbcTemplate jdbcTemplate;

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public int getLastPaymentMonth(int stdId, int classId) {
        int classEnrollment = getClassEnrollment(stdId, classId);
        try {
            String sql2 = "SELECT month FROM payment WHERE enrollment_id=? ORDER BY month DESC LIMIT 1";
            String lastMonth = jdbcTemplate.queryForObject(sql2, String.class, classEnrollment);

            if (lastMonth != null)
                return Integer.parseInt(lastMonth);
            else return 0;
        } catch (Exception e) {
            return 0;
        }
    }


    public String pay(Payment payment) {
        int classEnrollment = getClassEnrollment(payment.getStudentId(), payment.getClassId());

        String query = "INSERT INTO payment(month, fee, date_time, enrollment_id) VALUES (?, ?, CURRENT_TIMESTAMP, ?)";

        int i = jdbcTemplate.update(query, payment.getMonth(), payment.getFee(), classEnrollment);

        return i > 0 ? "Payment saved successfully" : "Payment failed";

    }

    private int getClassEnrollment(int studentId, int classId) {
        String sql = "SELECT id FROM class_student_enrollment WHERE studentId=? AND classId=?";
        return jdbcTemplate.queryForObject(sql, Integer.class, studentId, classId);
    }
}
