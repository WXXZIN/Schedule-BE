package com.android.schedule.domain;

public class Schedule {
    private Long id;
    private Course course;
    private String sectionNumber;
    private String dayOfWeek;
    private int startTime;
    private int endTime;
    private String buildingName;
    private String roomNumber;

    public Schedule(
            Long id,
            Course course,
            String sectionNumber,
            String dayOfWeek,
            int startTime,
            int endTime,
            String buildingName,
            String roomNumber
    ) {
        this.id = id;
        this.course = course;
        this.sectionNumber = sectionNumber;
        this.dayOfWeek = dayOfWeek;
        this.startTime = startTime;
        this.endTime = endTime;
        this.buildingName = buildingName;
        this.roomNumber = roomNumber;;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getSectionNumber() {
        return sectionNumber;
    }

    public void setSectionNumber(String sectionNumber) {
        this.sectionNumber = sectionNumber;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public int getStartTime() {
        return startTime;
    }

    public void setStartTime(int startTime) {
        this.startTime = startTime;
    }

    public int getEndTime() {
        return endTime;
    }

    public void setEndTime(int endTime) {
        this.endTime = endTime;
    }

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String toString() {
        return course.getCourseCode() + "-" + sectionNumber + " (" + dayOfWeek + " " + startTime + " - " + endTime + ")";
    }
}
