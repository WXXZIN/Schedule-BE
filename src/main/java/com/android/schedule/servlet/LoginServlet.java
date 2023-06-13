package com.android.schedule.servlet;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.android.schedule.dao.UserDAO;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserDAO dao = (UserDAO) getServletContext().getAttribute("user_dao");
;
		String studentNumber = request.getParameter("studentNumber");
		String password = request.getParameter("password");

		Map<String, Object> responseMap = new LinkedHashMap<>();
		try {
			int result = dao.login(studentNumber, password);

			if (result > 0) {
				responseMap.put("status", "success");
			} else {
				responseMap.put("status", "fail");
				responseMap.put("message", "로그인에 실패했습니다. 다시 시도해주세요.");
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
