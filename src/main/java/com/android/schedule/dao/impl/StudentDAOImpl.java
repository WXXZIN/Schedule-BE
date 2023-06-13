package com.android.schedule.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

import com.android.schedule.dao.StudentDAO;
import com.android.schedule.domain.Student;

public class StudentDAOImpl implements StudentDAO {

    private final Connection connection;

    public StudentDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override

    public int joinStudent(String password, Student student) throws Exception {
        int result = 0;

        String findDeptIdSql = "SELECT dept_id FROM departments WHERE dept_name = ?";
        String insertUserSql = "INSERT INTO users (student_number, password) VALUES (?, ?)";
        String insertStudentSql = "INSERT INTO students (student_number, dept_id, grade, name) VALUES (?, ?, ?, ?)";

        try {
            connection.setAutoCommit(false);

            PreparedStatement findDeptIdStmt = connection.prepareStatement(findDeptIdSql);
            findDeptIdStmt.setString(1, (student.getDeptName()));
            ResultSet rs = findDeptIdStmt.executeQuery();

            if (rs.next()) {
                int deptId = rs.getInt("dept_id");

                PreparedStatement insertUserStmt = connection.prepareStatement(insertUserSql);
                insertUserStmt.setString(1, student.getStudentNumber());
                insertUserStmt.setString(2, password);
                insertUserStmt.executeUpdate();

                PreparedStatement insertStudentStmt = connection.prepareStatement(insertStudentSql);
                insertStudentStmt.setString(1, student.getStudentNumber());
                insertStudentStmt.setInt(2, deptId);
                insertStudentStmt.setInt(3, student.getGrade());
                insertStudentStmt.setString(4, student.getName());

                result = insertStudentStmt.executeUpdate();

                connection.commit();
            } else {
                throw new Exception("학과 또는 세부 전공 정보를 찾을 수 없습니다.");
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            if (e.getMessage().contains("Duplicate entry")) {
                throw new Exception("학번이 중복되었습니다.");
            } else {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (Exception autoCommitEx) {
                autoCommitEx.printStackTrace();
            }
        }

        return result;
    }

    @Override
    public Student getStudentInfo(String studentNumber) {
        Student student = null;

        String sql = "WITH RECURSIVE dept_hierarchy AS ("
                + "SELECT dept_id, dept_name, parent_dept_id "
                + "FROM departments "
                + "WHERE parent_dept_id IS NULL "
                + "UNION ALL "
                + "SELECT d.dept_id, d.dept_name, d.parent_dept_id "
                + "FROM departments d "
                + "JOIN dept_hierarchy dh ON dh.dept_id = d.parent_dept_id "
                + ") "
                + "SELECT "
                + "s.student_number, "
                + "d.dept_name, "
                + "CASE "
                + "WHEN dh.parent_dept_id IS NULL THEN dh.dept_name "
                + "WHEN dp.parent_dept_id IS NULL THEN dh.dept_name "
                + "ELSE dp.dept_name "
                + "END AS dept_or_parent_dept_name, "
                + "s.grade, "
                + "s.name "
                + "FROM students s "
                + "JOIN departments d ON s.dept_id = d.dept_id "
                + "JOIN dept_hierarchy dh ON d.dept_id = dh.dept_id "
                + "LEFT JOIN departments dp ON dh.parent_dept_id = dp.dept_id "
                + "LEFT JOIN departments pp ON dp.parent_dept_id = pp.dept_id "
                + "WHERE s.student_number = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, studentNumber);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                student = new Student(
                        rs.getString("student_number"),
                        rs.getString("dept_or_parent_dept_name"),
                        rs.getString("dept_name"),
                        rs.getInt("grade"),
                        rs.getString("name")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return student;
    }
}
