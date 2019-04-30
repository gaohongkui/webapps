<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<<jsp:useBean id="newsDao" class="newsPub.beans.NewsDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    	<!--权限控制-->
    	<jsp:include page="checkValid.jsp"></jsp:include>
	<%
	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	boolean res=newsDao.deleteNews(id);
	if (res) {
	    out.println("----新闻删除成功！");
	}else {
	    out.println("----新闻删除失败！请联系管理员");
	}
	out.println("单击<a href='manageNews.jsp' >返回上一页</a>");
	%>
 	</body>
</html>