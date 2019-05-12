<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻发布系统v3.0 By杀手不太冷</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("index.jsp");
	%>
	<script type="text/javascript">
	//消除后退的所有动作。包括 键盘、鼠标手势等产生的后退动作
		window.onload = function() {
			 history.pushState(null, null, document.URL);
	            window.addEventListener('popstate', function () {
	                history.pushState(null, null, document.URL);
	            });
		}
	</script>
</body>
</html>


