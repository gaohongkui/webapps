<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			window.location.href = 'manageNews.jsp';
		} else {
			window.location.href = 'manageNews.jsp';
		}
	}
</script>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
	%>
	<jsp:setProperty property="*" name="news" />
	<%
		Boolean rs = newsDao.modiNews(news);
		request.setAttribute("flag", rs);
	%>
	<c:choose>
		<c:if test="${flag }">
			<script>
				process('----新闻修改成功！');
			</script>
		</c:if>
		<c:otherwise>
			<script>
				process('----新闻修改失败！\n请联系管理员');
			</script>
		</c:otherwise>
	</c:choose>

</body>

</html>