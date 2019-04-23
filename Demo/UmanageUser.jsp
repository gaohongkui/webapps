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
		<jsp:include page="UcheckValid.jsp"></jsp:include>
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
				<h1>资料修改</h1>
				<%
	request.setCharacterEncoding("utf-8");
	int id=0;
	String uName=null;
	String uPwd=null;
	String uGender=null;
	String uResume=null;
	uName=(String)session.getAttribute("username");
	
	//与数据库交互
	String dataDirverName = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/dbnews?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
//	String username = "root";
//	String password = "";
	Connection con = null;
	
	try{
	    Class.forName(dataDirverName);
	}catch (ClassNotFoundException e) {
//		out.println(e);
	    System.err.println(e.getMessage());
	}
	
	ResultSet rs=null;
	try{
		
	    con=DriverManager.getConnection(url,"root","");
	    
	    //sql处理
	    String sql="select * from user where username = ?";
	    PreparedStatement pst=con.prepareStatement(sql);
	    System.out.println(sql);
		pst.setString(1,uName);
		rs = pst.executeQuery();// 执行语句，得到结果
		
		if (rs!=null&&rs.next()) {
	    id=rs.getInt(1);
	    uPwd=rs.getString("password");
	    uGender=rs.getString("gender");
	    uResume=rs.getString("resume");
	}
		
	}catch (SQLException e1) {
		out.println(e1.getMessage());
	    System.err.println(e1.getMessage());
	}finally{
		con.close();
	}
	
	%>
				<form action="doModiUser.jsp" method="post" style="margin-left: 90px;">
					<input type="hidden" id="id" name="id" value="<%=id%>"  /> 
					用户名：<input type="text" readonly="readonly" id="username" name="username" value="<%=uName%>" /><br /><br /> 
					密&nbsp;&nbsp;&nbsp;码：<input type="text" id="password" name="password" value="<%=uPwd%>" /><br /><br /> 
					性&nbsp;&nbsp;&nbsp;别：
					<%if ("男".equals(uGender)) {%> 
						男<input type="radio" id="gender" name="gender" value="男" checked /> 
						女<input type="radio" id="gender" name="gender" value="女" /> 
						保密<input type="radio" id="gender" name="gender" value="保密" /><br /><br /><br />
					<%}else if ("女".equals(uGender)) {%> 
						男<input type="radio" id="gender" name="gender" value="男" /> 
						女<input type="radio" id="gender" name="gender" value="女" checked />
						保密<input type="radio" id="gender" name="gender" value="保密" /><br /><br /><br />
					<%} else{%> 
						男<input type="radio" id="gender" name="gender" value="男" /> 
						女<input type="radio" id="gender" name="gender" value="女" /> 
						保密<input type="radio" id="gender" name="gender" value="保密" checked /><br /><br /><br />
					<%}%> 个人简介 <textarea name="resume" rows="6" cols="50"><%=uResume%></textarea>
					<br />
					<br />
					<input type="submit" value="修改" style="position: relative;left: 200px;" />
				</form>
			</div>
			<div class="blank20"> </div>
			<div class="blank10"> </div>
		</div>
		<%@include file="common/bottom.txt"%>
	</body>

</html>