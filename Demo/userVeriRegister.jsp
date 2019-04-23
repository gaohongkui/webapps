<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>新闻发布系统v3.0 By杀手不太冷</title>
	<link rel="shortcut icon" href="images/bitbug_favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="css/userLogin.css?=2" type="text/css">
	<script>
		function checkForm() {
			var obj = document.getElementById("username");
			if(obj.value == "") {
				alert("用户名不能为空！");
				obj.focus();
				return false;
			}
			return checkValid();
		}

		function checkValid() {
			var obj = document.getElementById("password");
			var str = obj.value;
			var strlen = obj.length;
			if(strlen > 15 || strlen < 6) {
				alert("密码长度不合法！");
				obj.focus();
				return false;
			}
			return true;
		}
	</script>
</head>

<body>
	<div id="main">
		<h1>新闻发布系统v3.0 By杀手不太冷</h1>
		<input type="submit" name="index" id="index" value="首页" onclick="onclick="window.location.href='index.jsp' " />
	</div>
	<section class="container">
		<div class="login">
			<h1>VeriRegister</h1>
			<%
				request.setCharacterEncoding("utf-8");
				String uName=request.getParameter("username");
				String uPwd=request.getParameter("password");
				String uGender=request.getParameter("gender");
				String xingbie;
				if(uGender.equals("male")){
					xingbie="男";
				}else if (uGender.equals("female")) {
				    xingbie="女";
				}else{
					xingbie="保密";
				}
				String uResume=request.getParameter("resume");
			%>
			<table>
				<tr>
					<td>用户名：</td>
					<td>
						<%=uName%>
					</td>
				</tr>
				<tr>
					<td>密码：</td>
					<td>
						<%=uPwd%>
					</td>
				</tr>
				<tr>
					<td>性别：</td>
					<td>
						<%=xingbie%>
					</td>
				</tr>
				<tr>
					<td>个人简介：</td>
					<td>
						<%=uResume%>
					</td>
				</tr>
			</table>
			<form method="post" action="doRegister.jsp">
				<div style="display: none;">
					<p><input type="text" id="username" name="username" value="<%=uName%>" placeholder="用户名"></p>
					<p><input type="password" id="password" name="password" value="<%=uPwd%>" placeholder="密码"></p>
					<p><input type="text" id="gender" name="gender" value="<%=uGender%>" /></p>
					<p><textarea id="resume" name="resume" placeholder="个人简介"><%=uResume%></textarea></p>
					<input type="text" name="flag" id="flag" value="1" />
				</div>
				<p class="submit"><input type="submit" name="commit" value="确认"></p>
			</form>
		</div>

		<div class="login-help">
			<p>有错误？
				<a href="javascript:history.go(-1)">返回修改</a>.</p>
		</div>
	</section>

</body>

</html>