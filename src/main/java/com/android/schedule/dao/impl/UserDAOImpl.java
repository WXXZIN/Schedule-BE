package com.android.schedule.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.android.schedule.dao.UserDAO;

public class UserDAOImpl implements UserDAO {
    private final Connection connection;

    public UserDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public int login(String studentNumber, String password) throws Exception {
        int result = 0;

        String sql = "SELECT " +
                "COUNT(*) AS cnt " +
                "FROM users " +
                "WHERE student_number = ? AND password = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, studentNumber);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt("cnt");

                if (result ==0) {
                    throw new Exception("아이디 또는 비밀번호가 일치하지 않습니다.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
