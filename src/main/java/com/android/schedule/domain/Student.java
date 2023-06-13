package com.android.schedule.domain;

public class Student {
    private String studentNumber;
    private String deptName;
    private String major;
    private int grade;
    private String name;

    public Student(
            String studentNumber,
            String deptName,
            String major,
            int grade,
            String name
    ) {
        this.studentNumber = studentNumber;
        this.deptName = deptName;
        this.major = major;
        this.grade = grade;
        this.name = name;
    }

    public String getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(String studentNumber) {
        this.studentNumber = studentNumber;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
