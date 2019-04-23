<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.*"%>
<%
	String dataDirverName = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/dbnews?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
//	String username = "root";
//	String password = "";
	Connection con = null;
	
	try{
	    Class.forName(dataDirverName);
	}catch (ClassNotFoundException e) {
		out.println(e);
	    System.err.println(e.getMessage());
	}
	
	List<Map<String, String>> list = new ArrayList<Map<String, String>>();
	try{
		
	    con=DriverManager.getConnection(url,"root","");
	    
	    //sql处理
	    String sql="select * from newstype";
	    
		PreparedStatement pst = con.prepareStatement(sql);// 准备执行语句
		ResultSet rs = pst.executeQuery();// 执行语句，得到结果集
		ResultSetMetaData rsmd = rs.getMetaData();

		while (rs.next()) {
			Map<String, String> record = new HashMap<String, String>();
			for (int i = 0; i < rsmd.getColumnCount(); i++) {
				// 说明：不宜使用getColumnName方法，否则无法得到as后的列名
				String colName = rsmd.getColumnLabel(i + 1);
				

				String colContent = rs.getString(i + 1);

				record.put(colName, colContent);
			}
			list.add(record);
		}
		rs.close();
		pst.close();
		
	}catch (SQLException e1) {
		out.println(e1.getMessage());
	    System.err.println(e1.getMessage());
	}
%>
<%
	for(Map<String, String> map:list){%>
		<%=map.get("id")%>
		<%=map.get("newsType")%>
<%
	}
%>
