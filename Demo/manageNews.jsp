<%@page import="newsPub.beans.News"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>新闻发布系统v3.0 By杀手不太冷</title>
<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/public.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/main.css?version=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" type="text/css" href="css/fengche.css" />
<link rel="stylesheet" type="text/css" href="css/managerUser.css?version=<%=System.currentTimeMillis()%>" />
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
				ArrayList<News> newList = newsDAO.getAllNews();
			%>
			<div>
				<h1>新闻管理</h1>
				<span style="margin-left: 450px">
					<a href="addNews.jsp">发布新闻</a>
				</span>
			</div>
			<div class="table">
			<ec:table items="USERINFO" var="row"
    action="authuser?ActionType=authuser_SelectInit"
    view="html" 
    autoIncludeParameters="false"
     >
    
    <ec:exportXls fileName="userList.xls" />
    <ec:row>
        <ec:column style="text-align:center;" width="7%" property="rowcount" cell="rowCount" title="序号" sortable="false"/>
        <ec:column property="logName" style="text-align:center;" title="账号" />
        <ec:column property="employName" style="text-align:center;" title="人员姓名" />
        <ec:column property="createDate" style="text-align:center;" title="创建时间" />
        <ec:column property="creator" style="text-align:center;" title="创建人" />
    </ec:row>
</ec:table>

				<table class="tableA" border="1">
					<thead>
						<tr>
							<th>序号</th>
							<th>新闻标题</th>
							<th>发布时间</th>
							<th>修改</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
					<%
						News news = null;
						for (int i = 0; i < newList.size(); ++i) {
							news = newList.get(i);
					%>
						<tr>
							<td><%=i + 1%></td>
							<td>
								<a href="dispNews.jsp?id=<%=news.getId()%>"> <%=news.getTitle()%></a></td>
							<td><%=news.getPubtime()%></td>
							<td>
								<a href="modiNews.jsp?id=<%=news.getId()%>"><img src="images/edit.png" alt="修改" /></a>
								
							</td>
							<td>
								<a href="deleteNews.jsp?id=<%=news.getId()%>"><img src="images/deleteuser.png" alt="删除" /></a>
								
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>

			</div>


		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
	</div>
	<%@include file="common/bottom.txt"%>
</body>

</html>