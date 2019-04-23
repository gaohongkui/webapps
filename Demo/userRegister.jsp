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
	<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
	<!--页面加载完成后执行此方法-->
	<script type="text/javascript">
		window.onload=function () {
			var uName = document.getElementById("username");
			uName.focus();
		}
	</script>
	<!--使用ajax判断用户是否已经注册-->
	<script>
		$(document).ready(function() {
			$('#username').blur(function() {
					var username = $(this).val();
					if(username != "") {
						$.ajax({
								url: "judgeRegisterRepeat.jsp?time=" + Math.random(),
								data: {
									"username": username
								},
								dataType: "text",
								type: "GET",
								   //请求方式
								beforeSend: function() {        //请求前的处理
									$("#showResult").text("正在查询...");   
								},
								success: function(data) {
									data=data.replace(/(^\s*)|(\s*$)/g, "");//去除左右字符串
									if(data=="true") {
									$("#showResult").css("color", "green");
									$("#showResult").text("该用户名未被注册");
									$("#commit").attr("disabled", false);
									$("#commit").attr("title", "");
								} else {
									$("#showResult").css("color", "red"); 
									$("#showResult").text("该用户名已被注册"); 
									$("#commit").attr("disabled", true);
									$("#commit").attr("title", "用户名已被注册，不可提交");
								} 
							},
							error: function() {
								$("#showResult").css("color", "red"); 
								$("#showResult").text("查询失败，刷新重试"); 
								$("#commit").attr("disabled", true);
							}
						});
				}
			});
		});
	</script>
</head>

<body>
	<div id="main">
		<h1>新闻发布系统v3.0 By杀手不太冷</h1>
		<input type="submit" name="index" id="index" value="首页" onclick="window.location.href='index.jsp' " />
	</div>
	<section class="container">
		<div class="login">
			<h1>Register</h1>
			<form method="post" action="userVeriRegister.jsp" onsubmit="return checkForm()">
				<p><input type="text" id="username" name="username" value="" placeholder="用户名">
					<div id="showResult" style="float: left;position: absolute;right: 30px;">
					</div>
				</p>
				<p><input type="password" id="password" name="password" value="" placeholder="密码"></p>

				<p><span style="color: #c9c9c9 !important;margin-left: 15px;">
					性别
				</span>
					<select id="gender" name="gender">
						<option value="保密">保密</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</p>
				<p><textarea id="resume" name="resume" rows="6" cols="34" placeholder="个人简介"></textarea></p>
				<p class="submit"><input type="submit" id="commit" name="commit" value="注册"></p>
			</form>
		</div>

		<div class="login-help">
			<p>已有账号?
				<a href="userLogin.jsp">去登陆</a>.</p>
		</div>
	</section>

</body>

</html>