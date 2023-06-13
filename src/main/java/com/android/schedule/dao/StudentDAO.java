package com.android.schedule.dao;

import com.android.schedule.domain.Student;

public interface StudentDAO {
    int joinStudent(String password, Student student) throws Exception;
    Student getStudentInfo(String studentNumber);
}
