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
		<link rel="stylesheet" type="text/css" href="css/fengche.css"/>
		<link rel="stylesheet" type="text/css" href="css/managerUser.css?version=<%=System.currentTimeMillis()%>" />
	</head>

	<body>
		<!--权限控制-->
		<jsp:include page="checkValid.jsp"></jsp:include>
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
				<h1>用户管理</h1>
		<table class="tableA" border="1">
			<tr>
				<th>序号</th>
				<th>用户名</th>
				<th>删除</th>
			</tr>
			<%
	request.setCharacterEncoding("utf-8");
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
	
	try{
		
	    con=DriverManager.getConnection(url,"root","");
	    
	  
	    String sql="select * from user ";
	    Statement stm=con.createStatement();
	    System.out.println(sql);
		ResultSet rs = stm.executeQuery(sql);// 执行语句，得到结果集
		
		if(rs!=null){
			int count=0;
			while (rs.next()) {
			    count++;
			    int id=rs.getInt("id");
			    String uName=rs.getString("username");
			    %>
			    <tr>
				<td><%=count%></td>
				<td><%=uName%></td>
				<td>
					<a href="deleteUser.jsp?id=<%=id%>" onclick="return confirm('确定删除吗?')"><img src="images/deleteuser.png" alt="删除" />
					</a>
				</td>
			</tr>
			    <%
			}
		}
	}catch (SQLException e1) {
//		out.println(e1.getMessage());
	    System.err.println(e1.getMessage());
	}finally{
		con.close();
	}
	
	
	%>
			
			
		</table>
			</div>
			<div class="blank20"> </div>
			<div class="blank10"> </div>
		</div>
		<%@include file="common/bottom.txt"%>
	</body>

</html>