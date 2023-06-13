package com.android.schedule.servlet;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.android.schedule.dao.StudentDAO;
import com.android.schedule.domain.Student;

@WebServlet("/student/info")
public class GetStudentInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        StudentDAO dao = (StudentDAO) getServletContext().getAttribute("student_dao");

        String studentNumber = request.getParameter("studentNumber");

        Map<String, Object> responseMap = new LinkedHashMap<>();
        try {
            Student student = dao.getStudentInfo(studentNumber);

            if (student != null) {
                responseMap.put("status", "success");
                responseMap.put("student", student);
            } else {
                responseMap.put("status", "fail");
                responseMap.put("message", "학생 정보를 가져오는데 실패했습니다.");
            }
        } catch (Exception e) {
            responseMap.put("status", "fail");
            responseMap.put("message", e.getMessage());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(new ObjectMapper().writeValueAsString(responseMap));
    }
}
