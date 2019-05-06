<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<jsp:useBean id="newsDao" class="newsPub.beans.NewsDAO" scope="page"></jsp:useBean>
<jsp:useBean id="news" class="newsPub.beans.News" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>新闻发布系统v3.0 By杀手不太冷</title>
<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/userLogin.css?=1" type="text/css">
<script type="text/javascript">
	function process(msg) {
		if (alert(msg)) {
			window.location.href = 'index.jsp';
		}else {
			window.location.href = 'index.jsp';
		}
	}
</script>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>

	<jsp:setProperty property="*" name="news" />
	<%
		Boolean rs = newsDao.insert(news);
		if (rs) {
			out.println("<script>process('----新闻添加成功！');</script>");
		} else {
			out.println("<script>process('----新闻添加失败！\n请联系管理员');</script>");
		}
	%>

</body>

</html>