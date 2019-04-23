<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>新闻发布系统v3.0 By杀手不太冷</title>
	<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="css/userLogin.css?=1.1" type="text/css">
	<script src="js/checkForm.js" type="text/javascript" charset="utf-8"></script>
	<!--页面加载完成后执行此方法-->
	<script type="text/javascript">
		window.onload=function () {
			var uName = document.getElementById("username");
			uName.focus();
		}
	</script>
</head>

<body>
	<%
		String s=(String)session.getAttribute("result");
		if (s!=null && s.equals("false")) {
		    %>
	<script type="text/javascript">
		alert("用户名或密码错误，请重新输入！");
	</script>
	<%
		    session.removeAttribute("result");
		}
	%>
	<div id="main">
		<h1>新闻发布系统v3.0 By杀手不太冷</h1>
		<input type="submit" name="index" id="index" value="首页" onclick="window.location.href='index.jsp'" />
	</div>
	<section class="container">
		<div class="login">
			<h1>Login</h1>
			<form method="post" action="doLogin.jsp" onsubmit="return checkForm()">
				<p><input type="text" id="username" name="username" value="" placeholder="用户名"></p>
				<p><input type="password" id="password" name="password" value="" placeholder="密码"></p>
				<p class="submit"><input type="submit" name="commit" value="登录"></p>
			</form>
		</div>
		<div class="login-help">
			<p>尚未注册?
				<a href="userRegister.jsp">去注册</a>.</p>
		</div>
	</section>

</body>

</html>