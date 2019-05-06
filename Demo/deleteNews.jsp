<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<jsp:useBean id="newsDao" class="newsPub.beans.NewsDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script type="text/javascript">
	function process(msg) {
		if (alert(msg)) {
			window.history.back(-1);
		}else {
			window.history.back(-1);
		}
	}
</script>
</head>
<body>
	<!--权限控制-->
	<jsp:include page="checkValid.jsp"></jsp:include>
	<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	boolean res=newsDao.deleteNews(id);
	if (res) {
		out.println("<script>process('----新闻删除成功！');</script>");
	} else {
		out.println("<script>process('----新闻删除失败！\n请联系管理员');</script>");
	}
	%>
</body>
</html>