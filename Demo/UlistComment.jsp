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
		<link rel="stylesheet" type="text/css" href="css/listComment.css?version=<%=System.currentTimeMillis()%>" />
	</head>

	<body>
		<jsp:include page="UcheckValid.jsp"></jsp:include>
		<!--<%@include file="checkValid.jsp"%>-->
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
				<h2><a href="#">我国拟制定网络安全法</a></h2>
		<div id="warning"><span>
				网友评论仅供网友表达个人看法,并不表明本网站同意其观点或证实其描述
			</span></div>
		<hr style="border:1px dotted #036" />
		<div id="comment">
			<span class="fd"><img src="images/comment.gif" alt=""></span>
			<span class="fd">发表评论</span>
			<span class="fdr"><IMG style="cursor:pointer;" id="btnSubmitBottom" src="images/pn_reply.png"></span>
			<br /><br />
			<form id="form_pl" method="post">
				<textarea name="comment" id="commentMessage" cols="80" rows="6"></textarea>
			</form>
		</div>
		<div class="yc">
			<span>你的态度&nbsp;&nbsp;
					<img src="images/click/gaoxiao.gif"/>
					<img src="images/click/jidan.gif"/>
					<img src="images/click/kubi.gif"/>
					<img src="images/click/leiren.gif"/>
					<img src="images/click/luguo.gif"/>
					<img src="images/click/mihuo.gif"/>
					<img src="images/click/piaoliang.gif"/>
					<img src="images/click/woshou.gif"/>
					<img src="images/click/xianhua.gif"/>
				</span>
		</div>
		<div class="mian">
			<div>
				<img class="fd" src="images/tavatar.gif" alt="" width="30px">
				<span class="fd">评论人:[admin]</span> 2015-07-04 23:44:09
				<p>
					网络空间安全已经成为国家安全的重要组成
				</p>
			</div>
			<div>
				<img class="fd" src="images/tavatar.gif" alt="" width="30px" />
				<span class="fd">评论人:[admin]</span> 2015-07-04 21:19:13
				<p>
					网络安全很重要，有必要立法
				</p>
			</div>
			</div>
			<div class="blank20"> </div>
			<div class="blank10"> </div>
		</div>
		<%@include file="common/bottom.txt"%>
	</body>

</html>