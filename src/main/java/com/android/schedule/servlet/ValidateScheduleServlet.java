package com.android.schedule.servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.android.schedule.dao.ScheduleDAO;
import com.android.schedule.domain.ScheduleList;
import com.android.schedule.util.ScheduleOptimizer;

@WebServlet("/schedule/validate")
public class ValidateScheduleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ScheduleDAO scheduleDAO = (ScheduleDAO) getServletContext().getAttribute("schedule_dao");

        List<String> courseCodeList = Arrays.asList(request.getParameterValues("courseCode"));
        List<String> sectionNumberList = Arrays.asList(request.getParameterValues("sectionNumber"));

        List<ScheduleList> scheduleList = scheduleDAO.generateSchedule(courseCodeList, sectionNumberList);

        boolean isValid = ScheduleOptimizer.isValidCombination(scheduleList);

        Map<String, Object> responseMap = new LinkedHashMap<>();

        if (isValid) {
            responseMap.put("status", "success");
            responseMap.put("message", "시간표 생성이 가능합니다.");
        } else {
            responseMap.put("status", "fail");
            responseMap.put("message", "시간표 생성이 불가능합니다.");
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new ObjectMapper().writeValueAsString(responseMap));
    }
}
