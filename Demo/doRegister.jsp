<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<jsp:useBean id="userDAO" class="news.beans.UserDAO" scope="page"></jsp:useBean>
<<jsp:useBean id="user" class="news.beans.User" scope="page"></jsp:useBean>
<!DOCTYPE html>
<!--功能说明：执行提交注册
	根据注册的结果(后期用数据库判断)，实现智能跳转，注册成功自动登录注册失败则返回首页。
-->

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>新闻发布系统v3.0 By杀手不太冷</title>
	<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="css/userLogin.css?=1" type="text/css">
	
	<script>
		var time = 3;

		function fun(flag) {
			if(flag == "1") {
				if(time == 0) {
					window.location.href = "index.jsp";
				}
				var mese = document.getElementById("mesg");
				mese.innerText = "注册成功！" + time + "秒后自动跳转到首页！";
				time--;
				setTimeout("fun(1)", 1000);
			} else {
				if(time == 0) {
					window.location.href = "userLogin.jsp";
				}
				var mese = document.getElementById("mesg");
				mese.innerText = "注册失败！" + time + "秒后自动跳转到登录页！";
				time--;
				setTimeout("fun(0)", 1000);
			}

		}
	</script>
</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:setProperty property="*" name="user"/>
	<% 
	String flag=String.valueOf(userDAO.addUser(user));
	
	String link;
	if (flag.equals("1")) {
	    link="index.jsp";
	    session.setAttribute("username",user.getUsername());
		session.setAttribute("usertype","0");
	}else {
	    link="userLogin.jsp";
	}
	
	%>
	<div id="main">
		<h1 id="mesg"><script type="text/javascript">
			fun("<%=flag%>");
		</script></h1>
		<a href="<%=link%>" style="font-size: 20px;float: right;">立即跳转</a>
	</div>

</body>

</html>