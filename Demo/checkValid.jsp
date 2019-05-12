<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String username=(String)session.getAttribute("username");
	String usertype=(String)session.getAttribute("usertype");
	if (username==null) {//如果未登陆，无权访问
		session.setAttribute("flag","false");
		response.setCharacterEncoding("utf-8");
		out.print("<script>alert('您无权访问本页面，请登录后重试'); window.location.href='index.jsp'; </script>");// window.location.href=document.referrer;返回上一页并刷新
	}else if (!usertype.equals("1")) {//如果登陆了，但不是管理员用户
		session.setAttribute("flag","false");
	    out.print("<script>alert('您无权访问本页面，请使用管理员账户登录'); window.location.href='index.jsp'; </script>");
	}
%>