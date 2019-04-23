<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<jsp:useBean id="userDAO" class="news.beans.UserDAO" scope="page"></jsp:useBean>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String uName = request.getParameter("username");
	String uPwd = request.getParameter("password");

	if (userDAO.queryByNamePwd(uName, uPwd)) {
		session.setAttribute("username", userDAO.user.getUsername());
		session.setAttribute("usertype", userDAO.user.getUserType());
		response.sendRedirect("index.jsp");
	} else {
		session.setAttribute("result", "false");
		response.sendRedirect("userLogin.jsp");
	}
%>