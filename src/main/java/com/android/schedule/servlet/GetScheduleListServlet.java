package com.android.schedule.servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.android.schedule.dao.ScheduleDAO;
import com.android.schedule.domain.Schedule;

@WebServlet("/schedule")
public class GetScheduleListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws  IOException {
        ScheduleDAO scheduleDAO = (ScheduleDAO) getServletContext().getAttribute("schedule_dao");

        Map<String, Object> responseMap = new LinkedHashMap<>();
        try {
            List<Schedule> scheduleList = scheduleDAO.getScheduleList();

            responseMap.put("status", "success");
            responseMap.put("scheduleList", scheduleList);
        } catch (Exception e) {
            responseMap.put("status", "fail");
            responseMap.put("message", e.getMessage());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new ObjectMapper().writeValueAsString(responseMap));
    }
}
