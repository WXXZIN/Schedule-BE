package com.android.schedule.dao;

import java.util.List;

import com.android.schedule.domain.Course;

public interface CourseDAO {
    List<Course> getCourseByDeptNameAndTargetYear(String deptName, int targetYear);
    List<Course> getCourseByCourseCode(String courseCode);
    List<Course> getCourseByCourseName(String courseName);
}
