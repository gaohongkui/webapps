<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="newsPub.beans.News" %>
<jsp:useBean id="newDao" class="newsPub.beans.NewsDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>新闻发布系统v3.0 By杀手不太冷</title>
		<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/public.css?version=<%=System.currentTimeMillis()%>" />
		<link rel="stylesheet" type="text/css" href="css/main.css?version=<%=System.currentTimeMillis()%>" />
		<link rel="stylesheet" type="text/css" href="css/fengche.css"/>
		<link rel="stylesheet" type="text/css" href="css/addNews.css?version=<%=System.currentTimeMillis()%>"/>
		<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
	</head>

	<body>
		<jsp:include page="common/top.jsp"></jsp:include>
		<!--风车动画-->
		<div class="lanren" style="float: left;">
			<ul>
				<li><img src="images/main5-pic1.png"> </li>
				<li><img src="images/main5-pic2.png"> </li>
				<li><img src="images/main5-pic3.png"> </li>
			</ul>
		</div>
		<div class="lanren2" style="float: right;">
			<ul>
				<li><img src="images/main5-pic1.png"> </li>
				<li><img src="images/main5-pic2.png"> </li>
				<li><img src="images/main5-pic3.png"> </li>
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
				String id=request.getParameter("id");
				News news=newDao.getByID(id);
				%>
		<form id="modiNewsForm" name="modiNewsForm" action="doModiNews.jsp" method="post">
			<input type="hidden" name="id" value="<%=id%>">
			标题：<input type="text" name="title" id="title" value="<%=news.getTitle()%>"></input><br /><br />
			类型：<select id="newstype" name="newstype">
			<option value="1">社会</option>
			<option value="2">校内</option>
			</select>
			<script type="text/javascript">
			$(document).ready(function(){  
			     var key="<%=news.getNewstype()%>";
			     //根据值让option选中 
			     $("#newstype option[value='"+key+"']").attr("selected","selected"); 
			}); 
				</script>
			&nbsp;&nbsp;&nbsp;关键字：<input type="text" name="keyword" id="keyword" value="<%=news.getKeyword()%>" /><br><br>
			内容：<textarea name="content" cols="50" rows="10"><%=news.getContent()%></textarea><br />
			<br />
			<img class="returnBtn" src="images/返回.png" onclick="javascript:history.go(-1)"/>
			<img class="submitBtn" src="images/提交.png" onclick="javascript:document.modiNewsForm.submit()"/>
			
		</form>
			</div>
			<div class="blank20"> </div>
			<div class="blank10"> </div>
		</div>
		<%@include file="common/bottom.txt"%>
	</body>

</html>