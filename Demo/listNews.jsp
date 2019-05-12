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
		<link rel="stylesheet" type="text/css" href="css/fengche.css?version=<%=System.currentTimeMillis()%>"/>
		<link rel="stylesheet" type="text/css" href="css/listNews.css?version=<%=System.currentTimeMillis()%>"/>
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
				<div class="news_list">
			<h1>新闻列表（待改为新闻管理）</h1>
			<ul>
				<li>
					<div class="dd_lm">[国内]</div>
					<div class="dd_bt">
						<a href="#">时尚礼仪专家做客我校</a>
					</div>
					<div class="dd_time">2015-07-04 23:51:33</div>
				</li>
				<li>
					<div class="dd_lm">[国内]</div>
					<div class="dd_bt">
						<a href="#">华为发布荣耀独立品牌</a>
					</div>
					<div class="dd_time">2015-07-04 22:41:39</div>
				</li>
				<li>
					<div class="dd_lm">[国内]</div>
					<div class="dd_bt">
						<a href="#">苹果设备在企业移动市场中占据主导地位</a>
					</div>
					<div class="dd_time">2015-07-04 23:51:37</div>
				</li>
				<li>
					<div class="dd_lm">[国内]</div>
					<div class="dd_bt">
						<a href="#">前外交部部长来我校做主题报告</a>
					</div>
					<div class="dd_time">2015-07-04 22:44:35</div>
				</li>
				<li>
					<div class="dd_lm">[国内]</div>
					<div class="dd_bt">
						<a href="#">智慧城市计划投资规模超百亿</a>
					</div>
					<div class="dd_time">2015-07-04 22:11:42</div>
				</li>
				<li>
					<div class="dd_lm">[国内]</div>
					<div class="dd_bt">
						<a href="#">国内计算机已能够支撑大部分应用</a>
					</div>
					<div class="dd_time">2015-07-04 23:42:51</div>
				</li>
				<li>
					<div class="dd_lm">[国内]</div>
					<div class="dd_bt">
						<a href="#">我国拟制定网络安全性</a>
					</div>
					<div class="dd_time">2015-07-05 22:32:34</div>
				</li>
				<li>
					<div class="dd_lm">[国内]</div>
					<div class="dd_bt">
						<a href="#">首款全彩柔性超薄显示屏问世</a>
					</div>
					<div class="dd_time">2015-07-04 23:07:24</div>
				</li>
				<li>
					<div class="dd_lm">[国内]</div>
					<div class="dd_bt">
						<a href="#">图书馆积极展开"微平台"建设</a>
					</div>
					<div class="dd_time">2015-07-07 10:32:10</div>
				</li>
			</ul>
		</div>
			</div>
			<div class="blank20"> </div>
			<div class="blank10"> </div>
		</div>
		<%@include file="common/bottom.txt"%>
	</body>

</html>