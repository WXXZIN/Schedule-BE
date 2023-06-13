package com.android.schedule.domain;

import java.util.ArrayList;
import java.util.List;

public class ScheduleList {
    private List<Long> idList;
    private Course course;
    private String sectionNumber;
    private List<String> dayOfWeekList;
    private List<Integer> startTimeList;
    private List<Integer> endTimeList;
    private List<String> buildingNameList;
    private List<String> roomNumberList;

    public ScheduleList(
            Long id,
            Course course,
            String sectionNumber,
            String dayOfWeekList,
            int startTimeList,
            int endTimeList,
            String buildingNameList,
            String roomNumberList
    ) {
        this.idList = new ArrayList<>();
        this.course = course;
        this.sectionNumber = sectionNumber;
        this.dayOfWeekList = new ArrayList<>();
        this.startTimeList = new ArrayList<>();
        this.endTimeList = new ArrayList<>();
        this.buildingNameList = new ArrayList<>();
        this.roomNumberList = new ArrayList<>();

        this.idList.add(id);
        this.dayOfWeekList.add(dayOfWeekList);
        this.startTimeList.add(startTimeList);
        this.endTimeList.add(endTimeList);
        this.buildingNameList.add(buildingNameList);
        this.roomNumberList.add(roomNumberList);
    }

    public void addTimetableList(ScheduleList scheduleList) {
        this.idList.add(scheduleList.getIdList().get(0));
        this.dayOfWeekList.add(scheduleList.getDayOfWeekList().get(0));
        this.startTimeList.add(scheduleList.getStartTimeList().get(0));
        this.endTimeList.add(scheduleList.getEndTimeList().get(0));
        this.buildingNameList.add(scheduleList.getBuildingNameList().get(0));
        this.roomNumberList.add(scheduleList.getRoomNumberList().get(0));
    }

    public List<Long> getIdList() {
        return idList;
    }

    public void setIdList(List<Long> idList) {
        this.idList = idList;
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

    public List<String> getDayOfWeekList() {
        return dayOfWeekList;
    }

    public void setDayOfWeekList(List<String> dayOfWeekList) {
        this.dayOfWeekList = dayOfWeekList;
    }

    public List<Integer> getStartTimeList() {
        return startTimeList;
    }

    public void setStartTimeList(List<Integer> startTimeList) {
        this.startTimeList = startTimeList;
    }

    public List<Integer> getEndTimeList() {
        return endTimeList;
    }

    public void setEndTimeList(List<Integer> endTimeList) {
        this.endTimeList = endTimeList;
    }

    public List<String> getBuildingNameList() {
        return buildingNameList;
    }

    public void setBuildingNameList(List<String> buildingNameList) {
        this.buildingNameList = buildingNameList;
    }

    public List<String> getRoomNumberList() {
        return roomNumberList;
    }

    public void setRoomNumberList(List<String> roomNumberList) {
        this.roomNumberList = roomNumberList;
    }

    @Override
    public String toString() {
        return "ScheduleList{" +
                "idList=" + idList +
                ", course=" + course +
                ", sectionNumber='" + sectionNumber + '\'' +
                ", dayOfWeekList=" + dayOfWeekList +
                ", startTimeList=" + startTimeList +
                ", endTimeList=" + endTimeList +
                ", buildingNameList=" + buildingNameList +
                ", roomNumberList=" + roomNumberList +
                '}';
    }
}
