package com.android.schedule.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.android.schedule.dao.CourseDAO;
import com.android.schedule.domain.Course;

public class CourseDAOImpl implements CourseDAO {
    private final Connection connection;

    public CourseDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Course> getCourseByDeptNameAndTargetYear(String deptName, int targetYear) {
        List<Course> courseList = new ArrayList<>();

        String sql = "WITH RECURSIVE dept_hierarchy AS ("
                + "SELECT dept_id, dept_name, parent_dept_id "
                + "FROM departments "
                + "WHERE dept_name = ? "
                + "UNION ALL "
                + "SELECT d.dept_id, d.dept_name, d.parent_dept_id "
                + "FROM departments d "
                + "INNER JOIN dept_hierarchy dh ON d.dept_id = dh.parent_dept_id "
                + ") "
                + "SELECT "
                + "c.course_code, "
                + "c.course_name, "
                + "c.credits "
                + "FROM courses c "
                + "JOIN departments d ON c.dept_id = d.dept_id "
                + "WHERE d.dept_id IN (SELECT dept_id FROM dept_hierarchy) "
                + "AND c.target_year = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, deptName);
            pstmt.setInt(2, targetYear);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Course course = new Course(
                        rs.getString("course_code"),
                        rs.getString("course_name"),
                        rs.getInt("credits")
                );

                courseList.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courseList;
    }

    @Override
    public List<Course> getCourseByCourseCode(String courseCode) {
        List<Course> courseList = new ArrayList<>();

        String sql = "SELECT "
                + "course_code, "
                + "course_name, "
                + "credits "
                + "FROM courses "
                + "WHERE course_code = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, courseCode);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Course course = new Course();
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseName(rs.getString("course_name"));
                course.setCredits(rs.getInt("credits"));

                courseList.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courseList;
    }

    @Override
    public List<Course> getCourseByCourseName(String courseName) {
        List<Course> courseList = new ArrayList<>();

        String sql = "SELECT "
                + "course_code, "
                + "course_name, "
                + "credits "
                + "FROM courses "
                + "WHERE course_name = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, courseName);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Course course = new Course();
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseName(rs.getString("course_name"));
                course.setCredits(rs.getInt("credits"));

                courseList.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courseList;
    }
}
