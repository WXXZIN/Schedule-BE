package com.android.schedule.servlet;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.schedule.domain.Schedule;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.android.schedule.dao.ScheduleDAO;

@WebServlet("/schedule/personal")
public class GetPersonalScheduleServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ScheduleDAO scheduleDAO = (ScheduleDAO) getServletContext().getAttribute("schedule_dao");

        String studentNumber = request.getParameter("studentNumber");

        Map<String, Object> responseMap = new LinkedHashMap<>();
        try {
            List<Schedule> scheduleList = scheduleDAO.getPersonalSchedule(studentNumber);

            responseMap.put("status", "success");
            responseMap.put("scheduleList", scheduleList);
        } catch (Exception e) {
            responseMap.put("status", "fail");
            responseMap.put("message", e.getMessage());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(new ObjectMapper().writeValueAsString(responseMap));
    }
}
