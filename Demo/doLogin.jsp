<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	String uName = request.getParameter("username");
	String uPwd = request.getParameter("password");
	String uGender = request.getParameter("gender");
	String uResume = request.getParameter("resume");

	//与数据库交互
	String dataDirverName = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/dbnews?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	//	String username = "root";
	//	String password = "";
	Connection con = null;

	try {
		Class.forName(dataDirverName);
	} catch (ClassNotFoundException e) {
		//		out.println(e);
		System.err.println(e.getMessage());
	}

	try {

		con = DriverManager.getConnection(url, "root", "");

		//sql处理
		String sql = "select username,userType from user where username= ? and password = ?";

		//	    该方法会引发SQL注入
		//	    String sql="select * from user where username='"+uName+"'and password='"+uPwd+"'";//1'or+'1=1
		//	    Statement stm=con.createStatement();
		System.out.println(sql);

		PreparedStatement pst = con.prepareStatement(sql);// 准备执行语句
		pst.setString(1, uName);
		pst.setString(2, uPwd);
		ResultSet rs = pst.executeQuery();// 执行语句，得到结果集
		ResultSetMetaData rsmd = rs.getMetaData();

		if (rs != null && rs.next()) {
			session.setAttribute("username", rs.getString("username"));
			session.setAttribute("usertype", rs.getString("userType"));
			response.sendRedirect("index.jsp");
		} else {
			session.setAttribute("result", "false");
			response.sendRedirect("userLogin.jsp");
		}
		rs.close();
	} catch (SQLException e1) {
		//		out.println(e1.getMessage());
		System.err.println(e1.getMessage());
	} finally {
		con.close();
	}
%>