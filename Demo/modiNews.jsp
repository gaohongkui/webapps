<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="newsPub.beans.News"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="newsDao" class="newsPub.beans.NewsDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻发布系统v3.0 By杀手不太冷</title>
<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/public.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/main.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/fengche.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/addNews.css?version=<%=System.currentTimeMillis()%>" />
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
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
			<h1>新闻修改</h1>
			<%
				request.setCharacterEncoding("utf-8");
				String id = request.getParameter("id");
				News news = newsDao.getByID(id);
				List<Map<String, String>> list = newsDao.getAllNewstype();
				request.setAttribute("news", news);
				request.setAttribute("newstypeList", list);
			%>
			<form id="modiNewsForm" name="modiNewsForm" action="doModiNews.jsp" method="post">
				<input type="hidden" name="id" value="<%=id%>">
				标题：
				<input type="text" name="title" id="title" value="<%=news.getTitle()%>"></input>
				<br />
				<br />
				类型：
				<select name="newstype">
					<c:forEach items="${newstypeList}" var="opt">
						<c:choose>
							<c:when test="${news.newstype==opt.id}">
								<option value="${opt.id }" selected="selected">${opt.newstype}</option>
							</c:when>
							<c:otherwise>
								<option value="${opt.id}">${opt.newstype}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				&nbsp;&nbsp;&nbsp;关键字：
				<input type="text" name="keyword" id="keyword" value="<%=news.getKeyword()%>" />
				<br>
				<br>
				内容：
				<br />
				<br />
				<textarea class="ckeditor" name="content" cols="50" rows="10"><%=news.getContent()%></textarea>
				<br />
				<br />
			</form>
			<div class="btn">
				<img class="returnBtn" src="images/返回.png" onclick="javascript:history.go(-1)" />
				<img class="submitBtn" src="images/提交.png" onclick="javascript:document.modiNewsForm.submit()" />
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
	</div>
	<%@include file="common/bottom.txt"%>
</body>

</html>