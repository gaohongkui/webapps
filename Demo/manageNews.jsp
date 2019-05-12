<%@page import="newsPub.beans.News"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@ taglib uri="/tld/extremecomponents" prefix="ec" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>新闻发布系统v3.0 By杀手不太冷</title>
<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/public.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/main.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/fengche.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/managerUser.css?version=<%=System.currentTimeMillis()%>" />
<link href="<%=request.getContextPath() %>/css/extremecomponents.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<!--权限控制-->
	<jsp:include page="checkValid.jsp"></jsp:include>
	<jsp:include page="common/top.jsp"></jsp:include>
	<!--风车动画-->
	<div class="lanren" style="float: left;">
		<ul>
			<li>
				<img src="images/main5-pic1.png">
			</li>
			<li>
				<img src="images/main5-pic2.png">
			</li>
			<li>
				<img src="images/main5-pic3.png">
			</li>
		</ul>
	</div>
	<div class="lanren2" style="float: right;">
		<ul>
			<li>
				<img src="images/main5-pic1.png">
			</li>
			<li>
				<img src="images/main5-pic2.png">
			</li>
			<li>
				<img src="images/main5-pic3.png">
			</li>
		</ul>
	</div>
	<!--中部主体-->
	<div id="content">
		<div id="sidebar">
			<!--主体部分左栏-->
			<jsp:include page="common/left.jsp"></jsp:include>
		</div>
		<div id="main">
			<!--主体部分右栏-->
			<jsp:useBean id="newsDAO" class="newsPub.beans.NewsDAO" scope="page"></jsp:useBean>
			<%
				ArrayList<News> newsList = newsDAO.getAllNews();
				request.setAttribute("newsList", newsList);
			%>
			<div>
				<h1>新闻管理</h1>
				<span style="position:relative;left:15px;">
					<a href="addNews.jsp"><img width="15%" alt="发布新闻" src="images/发布新闻.png"></a>
				</span>
				
			</div>
			<ec:table var="news" items="newsList" action="index.jsp" style="font-size:20px;">
			<ec:row>
			<ec:column style="text-align:center;" cell="rowCount" property="id" title="序号"/>
			<ec:column style="text-align:center;" property="title" title="标题" ><a href="dispNews.jsp?id=${news.id }">${news.title}</a></ec:column>
			<ec:column style="text-align:center;" property="pubtime" title="发布时间"/>
			<ec:column style="text-align:center;" title="修改" property="null"> <a href="modiNews.jsp?id=${news.id }"><img src="images/edit.png" alt="修改" /></a></ec:column>
			<ec:column style="text-align:center;" title="删除" property="null"> <a href="deleteNews.jsp?id=${news.id}" onclick="return confirm('确定删除吗?')" ><img src="images/deleteuser.png" alt="删除" /></a></ec:column>
			</ec:row>
			</ec:table>
				

			</div>


		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
	</div>
	<%@include file="common/bottom.txt"%>
</body>

</html>