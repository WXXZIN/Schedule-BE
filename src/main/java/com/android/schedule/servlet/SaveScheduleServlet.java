package com.android.schedule.servlet;

import com.android.schedule.dao.ScheduleDAO;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet("/schedule/save")
public class SaveScheduleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ScheduleDAO scheduleDAO = (ScheduleDAO) getServletContext().getAttribute("schedule_dao");

        String studentNumber = request.getParameter("studentNumber");
        String[] courseCodes = request.getParameterValues("courseCode");
        String[] sectionNumbers = request.getParameterValues("sectionNumber");

        List<String> courseCodeList = courseCodes != null ? Arrays.asList(courseCodes) : Collections.emptyList();
        List<String> sectionNumberList = sectionNumbers != null ? Arrays.asList(sectionNumbers) : Collections.emptyList();

        Map<String, Object> responseMap = new LinkedHashMap<>();
        try {
            scheduleDAO.saveSchedule(studentNumber, courseCodeList, sectionNumberList);

            responseMap.put("status", "success");
        } catch (Exception e) {
            responseMap.put("status", "fail");
            responseMap.put("message", e.getMessage());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(new ObjectMapper().writeValueAsString(responseMap));
    }
}
