<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<jsp:useBean id="newsDao" class="newsPub.beans.NewsDAO" scope="page"></jsp:useBean>
<<jsp:useBean id="news" class="newsPub.beans.News" scope="page"></jsp:useBean>
<!DOCTYPE html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>新闻发布系统v3.0 By杀手不太冷</title>
	<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="css/userLogin.css?=1" type="text/css">
</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	%>
	<jsp:setProperty property="*" name="news"/>
	<% 
	Boolean rs=newsDao.modiNews(news);
	if (rs) {
	    out.println("----新闻更新成功！");
	}else {
	    out.println("----新闻更新失败！请联系管理员");
	}
	out.println("单击<a href='manageNews.jsp' >返回新闻管理</a>");
	%>

</body>

</html>