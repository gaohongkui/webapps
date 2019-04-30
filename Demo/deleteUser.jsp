<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    	<!--权限控制-->
    	<jsp:include page="checkValid.jsp"></jsp:include>
<%
	request.setCharacterEncoding("utf-8");
	
	String flag=(String)session.getAttribute("flag");
	if (flag!=null&&flag.equals("false")) {
		session.removeAttribute("flag");
	    return;
	}
	
	String id=request.getParameter("id");
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
	    
	    //sql处理
	    String sql="delete from user where id =?";
	    
	    System.out.println(sql);
	    
		PreparedStatement pst = con.prepareStatement(sql);// 准备执行语句
		pst.setString(1,id);
		int rs = pst.executeUpdate();// 执行语句，得到结果集
		if (rs==1) {
		    out.println("用户删除成功！");
		}else {
		    out.println("用户删除失败！请联系管理员");
		}
		out.println("单击<a href='manageNews.jsp'>返回上一页</a>");
	}catch (SQLException e1) {
//		out.println(e1.getMessage());
	    System.err.println(e1.getMessage());
	}finally{
		con.close();
	}
	
	
	%>
 	</body>
</html>