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
<link rel="stylesheet" type="text/css" href="css/fengche.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/listNews.css?version=<%=System.currentTimeMillis()%>" />
</head>

<body>
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
			<div class="news_list">
				<h1>新闻列表</h1>
				<ul>
					<c:forEach items="${newsList}" var="news">
						<li>
							<div class="dd_lm">[${news.type}]</div>
							<div class="dd_bt">
								<a class="a_bt" title="${news.title}" href="dispNews.jsp?id=${news.id}">${news.title}</a>
							</div>

							<div class="dd_time">${news.pubtime}</div>

							<c:if test="${action=='query'}">
								<div class="key" id="key">关键字：${news.keyword}</div>
								<script type="text/javascript">
									var keys = document.getElementsByClassName("key");
									for(var i=0;i<keys.length;i++){
										var key=keys[i];
										var text = key.innerHTML;
										key.innerHTML = key.innerHTML.replace('${keyword}',"<span style='color: red;'>$&</span>");
									}
								</script>
							</c:if>

						</li>
					</c:forEach>
				</ul>

			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
	</div>
	<%@include file="common/bottom.txt"%>
</body>

</html>