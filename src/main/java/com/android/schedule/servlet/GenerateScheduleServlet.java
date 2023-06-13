package com.android.schedule.servlet;

import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.android.schedule.dao.CourseDAO;
import com.android.schedule.dao.ScheduleDAO;
import com.android.schedule.domain.Course;
import com.android.schedule.domain.Schedule;
import com.android.schedule.domain.ScheduleList;
import com.android.schedule.util.ScheduleOptimizer;

@WebServlet("/schedule/generate")
public class GenerateScheduleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        CourseDAO courseDAO = (CourseDAO) getServletContext().getAttribute("course_dao");
        ScheduleDAO scheduleDAO = (ScheduleDAO) getServletContext().getAttribute("schedule_dao");

        String deptName = request.getParameter("deptName");
        String targetYear = request.getParameter("targetYear");

        List<Course> courseCodeList = courseDAO.getCourseByDeptNameAndTargetYear(deptName, Integer.parseInt(targetYear));
        List<ScheduleList> scheduleLists = scheduleDAO.generateSchedule(courseCodeList.stream().map(Course::getCourseCode).collect(Collectors.toList()));

        Map<String, ScheduleList> scheduleListMap = new LinkedHashMap<>();

        for (ScheduleList scheduleList : scheduleLists) {
            String key = scheduleList.getCourse().getCourseCode() + "-" + scheduleList.getSectionNumber();

            if (scheduleListMap.containsKey(key)) {
                ScheduleList existingScheduleList = scheduleListMap.get(key);
                existingScheduleList.addTimetableList(scheduleList);
            } else {
                scheduleListMap.put(key, scheduleList);
            }
        }

        List<List<ScheduleList>> finalScheduleLists = ScheduleOptimizer.optimizeSchedule(new ArrayList<>(scheduleListMap.values()), courseCodeList.size());

        HashMap<Integer, List<Schedule>> scheduleMap = convertToSingleConstructor(finalScheduleLists);

        Map<String, Object> responseMap = new LinkedHashMap<>();

        if (finalScheduleLists.isEmpty()) {
            responseMap.put("status", "fail");
            responseMap.put("message", "최적화된 시간표를 생성할 수 없습니다. 시간표에 충돌이 있거나 충분한 수의 강의를 찾을 수 없습니다.");
        } else {
            responseMap.put("status", "success");
            responseMap.put("scheduleMap", scheduleMap);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new ObjectMapper().writeValueAsString(responseMap));
    }

    private static HashMap<Integer, List<Schedule>> convertToSingleConstructor(List<List<ScheduleList>> scheduleLists) {
        HashMap<Integer, List<Schedule>> scheduleMap = new LinkedHashMap<>();
        int index = 1;

        for (List<ScheduleList> scheduleList : scheduleLists) {
            List<Schedule> singleConstructorList = new ArrayList<>();
            for (ScheduleList t : scheduleList) {
                for (int i = 0; i < t.getIdList().size(); i++) {
                    singleConstructorList.add(new Schedule(
                        t.getIdList().get(i),
                        t.getCourse(),
                        t.getSectionNumber(),
                        t.getDayOfWeekList().get(i),
                        t.getStartTimeList().get(i),
                        t.getEndTimeList().get(i),
                        t.getBuildingNameList().get(i),
                        t.getRoomNumberList().get(i)
                    ));
                }
            }
            scheduleMap.put(index++, singleConstructorList);
        }

        return scheduleMap;
    }
}
