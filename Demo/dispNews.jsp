<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>新闻发布系统v3.0 By杀手不太冷</title>
		<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/public.css?version=<%=System.currentTimeMillis()%>" />
		<link rel="stylesheet" type="text/css" href="css/main.css?version=<%=System.currentTimeMillis()%>" />
		<link rel="stylesheet" type="text/css" href="css/fengche.css"/>
		<link rel="stylesheet" type="text/css" href="css/dispNews.css?version=<%=System.currentTimeMillis()%>" />
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
				<h1>智慧城市计划投资规模超万亿</h1>
			<div class="news_time">
				<span class="left-t">2019-03-04 20:05:23</span>
				<span class="right-t">(点击：16)
					<img src="images/12.png" alt="">
					<a href="#">查看评论</a>
				</span>
			</div>
			<hr style="border:1px dotted #036" />
			<div id="news_content">
				<p>这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容?这里是内容这里是内容
					这里是内容这里是内容,这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容这里是内容
				</p>
				<p>这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容?这里是内容这里是内容
					这里是内容这里是内容,这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容这里是内容
				</p>
				<p>这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容?这里是内容这里是内容
					这里是内容这里是内容,这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容这里是内容这里是内容
					这里是内容这里是内容这里是内容这里是内容
				</p>
			</div>
			</div>
			<div class="blank20"> </div>
			<div class="blank10"> </div>
		</div>
		<%@include file="common/bottom.txt"%>
	</body>

</html>