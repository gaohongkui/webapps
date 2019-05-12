<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<%
	//本页面用来处理注册是否重复，提示用户
	request.setCharacterEncoding("utf-8");
	String uName=request.getParameter("username");
	//与数据库交互
	String dataDirverName = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/dbnews?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	Connection con = null;
	
	try{
	    Class.forName(dataDirverName);
	}catch (ClassNotFoundException e) {
	    System.err.println(e.getMessage());
	}
	
	List<Map<String, String>> list = new ArrayList<Map<String, String>>();
	try{
		
	    con=DriverManager.getConnection(url,"root","");
	    
	    //sql处理
	    String sql="select username from user where username= ? ";
	    System.out.println(sql);
		PreparedStatement pst = con.prepareStatement(sql);// 准备执行语句
		pst.setString(1,uName);
		ResultSet rs = pst.executeQuery();// 执行语句，得到结果集
		
		if(rs!=null&&rs.next()){
			response.getWriter().print(false);
//			response.getWriter().print("{\"name\": \"Michael\"}");//返回json
		}else {
			response.getWriter().print(true);
		}
		response.getWriter().close();//关闭输出流，否则会返回多余的信息
		rs.close();
		
	}catch (SQLException e1) {
	    System.err.println(e1);
	}finally{
		con.close();
	}
%>