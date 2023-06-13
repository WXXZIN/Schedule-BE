package com.android.schedule.servlet;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.schedule.dao.StudentDAO;
import com.android.schedule.domain.Student;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		StudentDAO studentDAO = (StudentDAO) getServletContext().getAttribute("student_dao");

		String studentNumber = request.getParameter("studentNumber");
		String password = request.getParameter("password");
		String deptName = request.getParameter("deptName");
		int grade = Integer.parseInt(request.getParameter("grade"));
		String name = request.getParameter("name");

		Student student = new Student(studentNumber, deptName, null, grade, name);

		Map<String, Object> responseMap = new LinkedHashMap<>();
		try {
			int result = studentDAO.joinStudent(password, student);

			if (result > 0) {
				responseMap.put("status", "success");
			} else {
				responseMap.put("status", "fail");
				responseMap.put("message", "회원가입에 실패했습니다. 다시 시도해주세요.");
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
