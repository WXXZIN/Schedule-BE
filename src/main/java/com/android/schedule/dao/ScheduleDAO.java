package com.android.schedule.dao;

import java.util.List;

import com.android.schedule.domain.Schedule;
import com.android.schedule.domain.ScheduleList;

public interface ScheduleDAO {
    void saveSchedule(String studentNumber, List<String> courseCodes, List<String> sectionNumbers);
    List<Schedule> getScheduleList();
    List<Schedule> getPersonalSchedule(String studentNumber);
    List<ScheduleList> generateSchedule(List<String> courseCodes);
    List<ScheduleList> generateSchedule(List<String> courseCodes, List<String> sectionNumbers);
}
