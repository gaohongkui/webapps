<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String username=(String)session.getAttribute("username");
	if (username==null) {//如果未登陆，无权访问
		response.setCharacterEncoding("utf-8");
		session.setAttribute("flag","false");
		out.print("<script>alert('您无权访问本页面，请登录后重试'); window.history.back(-1); </script>");
	}
%>