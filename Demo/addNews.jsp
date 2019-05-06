<%@page import="java.util.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻发布系统v3.0 By杀手不太冷</title>
<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/public.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/main.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/fengche.css" />
<link rel="stylesheet" type="text/css" href="css/addNews.css?version=<%=System.currentTimeMillis()%>" />
<jsp:useBean id="newsDao" class="newsPub.beans.NewsDAO"></jsp:useBean>
</head>

<body>
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
			<%
				List<Map<String, String>> list = newsDao.getAllNewstype();
				request.setAttribute("newstypeList", list);
			%>
			<h1>新闻发布</h1>
			<form id="addNewsForm" name="addNewsForm" action="doAddNews.jsp" method="post">
				<input type="hidden" name="author" value="${sessionScope.username}">
				标题：
				<input type="text" name="title" id="title"></input>
				<br />
				<br />
				类型：
				<select name="newstype">
					<c:forEach items="${newstypeList}" var="opt">
						<option value="${opt.id}">${opt.newstype}</option>
					</c:forEach>
				</select>
				&nbsp;&nbsp;&nbsp;关键字：
				<input type="text" name="keyword" id="keyword" />
				<br>
				<br>
				内容：
				<textarea name="content" cols="50" rows="5"></textarea>
				<br />
				<br />
				<img class="returnBtn" src="images/返回.png" onclick="javascript:history.go(-1)" />
				<img class="submitBtn" src="images/提交.png" onclick="javascript:document.addNewsForm.submit()" />
			</form>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
	</div>
	<%@include file="common/bottom.txt"%>
</body>

</html>