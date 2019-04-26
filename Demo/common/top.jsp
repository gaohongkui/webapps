<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<script type="text/javascript">
			function showTime() {
				var Timer = new Date();
				var h = Timer.getHours();
				var m = Timer.getMinutes();
				var s = Timer.getSeconds();
				var d = Timer.getDate();
				var mm = Timer.getMonth() + 1;
				var y = Timer.getFullYear();
				var week = Timer.getDay();
				if(week == 1) {
					week = "星期一";
				} else if(week == 2) {
					week = "星期二";
				} else if(week == 3) {
					week = "星期三";
				} else if(week == 4) {
					week = "星期四";
				} else if(week == 5) {
					week = "星期五";
				} else if(week == 6) {
					week = "星期六";
				} else if(week == 2) {
					week = "星期天";
				}
				var strShow = "" + y + "-" + mm + "-" + d + " " + h + ":" + m + ":" + s + " " + week;
				if(h < 6) {
					strShow += "	熬夜对身体不好哦，早点休息吧！";
				} else if(h < 9) {
					strShow += "	早上好！";
				} else if(h < 12) {
					strShow += "	上午好！";
				} else if(h < 19) {
					strShow += "	下午好！";
				} else if(h < 24) {
					strShow += "	晚上好！";
				}
				var myspan = document.getElementById("myspan");
				myspan.innerText = strShow;
				setTimeout("showTime()", 1000);
			}
		</script>
<div class="topBar">
	<div class="topBar_d">
		<div class="left"><span class="kj" id="myspan"><script>showTime();</script>
				</span><iframe style="float: right;" src="http://m.weather.com.cn/m/pn3/weather.htm" width="200" height="20" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no" allowtransparency="true"></iframe>
		</div>
	</div>
</div>
<div id="logo">
	<div id="logo_main">
	</div>
</div>
<div id="menu">
	<div id="user">
		<%
			request.setCharacterEncoding("utf-8");
			String username=(String)session.getAttribute("username");
			String usertype=(String)session.getAttribute("usertype");
			if (username==null) {%>
		<a href="./userLogin.jsp">用户登录</a>
		<%}else{%> 当前用户：
		<%=username%>|
		<a href="doLogout.jsp">退出登录</a>
		<%}%>

	</div>
	<div id="menu-list">
		<ul>
			<%if(username==null){//未登陆%>
				<li>
				<a href="index.jsp">首 页</a>
			</li>
			<%}else if(usertype.equals("1")){//管理员%>
			<li>
				<a href="manageNews.jsp">新闻管理</a>
			</li>
			<li>
				<a href="listComment.jsp">评论管理</a>
			</li>
			<li>
				<a href="manageUser.jsp">用户管理</a>
			</li>
			<li>
				<a href="index.jsp">首 页</a>
			</li>
			<%}else{//普通用户%>
			
			<li>
				<a href="UlistComment.jsp">评论管理</a>
			</li>
			<li>
				<a href="UmanageUser.jsp">用户修改</a>
			</li>
			<li>
				<a href="index.jsp">首 页</a>
			</li>
			<%}%>
		</ul>
	</div>
</div>