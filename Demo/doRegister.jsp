<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
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
	String flag=request.getParameter("flag");
	String uName=request.getParameter("username");
	String uPwd=request.getParameter("password");
	String uGender=request.getParameter("gender");
	String uResume=request.getParameter("resume");
	if(uGender.equals("male")){
					uGender="男";
				}else if (uGender.equals("female")) {
				    uGender="女";
				}else{
					uGender="保密";
				}
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
	
	int rs=0;
	try{
		
	    con=DriverManager.getConnection(url,"root","");
	    
	    //sql处理
	    String sql="insert into user(username,password,gender,resume) values('"+uName+"','"+uPwd+"','"+uGender+"','"+uResume+"')";
	    System.out.println(sql);
		Statement st = con.createStatement();// 准备执行语句
		rs = st.executeUpdate(sql);// 执行语句，得到结果
		
	}catch (SQLException e1) {
		out.println(e1.getMessage());
	    System.err.println(e1.getMessage());
	}finally{
		con.close();
	}
	
	if (rs==1) {
		    flag="1";
	}else {
		    flag="0";
	}
	
	String link;
	if (flag.equals("1")) {
	    link="index.jsp";
	}else {
	    link="userLogin.jsp";
	}
	session.setAttribute("username",uName);
	session.setAttribute("usertype","0");
	%>
	<div id="main">
		<h1 id="mesg"><script type="text/javascript">
			fun("<%=flag%>");
		</script></h1>
		<a href="<%=link%>" style="font-size: 20px;float: right;">立即跳转</a>
	</div>

</body>

</html>