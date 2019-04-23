<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%
		session.invalidate();
		response.sendRedirect("index.jsp");
	%>
