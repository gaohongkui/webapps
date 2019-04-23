package news.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataBaseAccess {

	// 数据库管理系统名称
	private String dataDirverName = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/dbnews?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	private String username = "root";
	private String password = "";
	// 数据库连接
	Connection con = null;

	// 默认自己处理
	public DataBaseAccess() {
		try {
			open();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 当用户名与密码改变时，抛出sql异常给别人处理
	public DataBaseAccess(String username, String password) throws SQLException {
		super();
		this.username = username;
		this.password = password;
		open();
	}

	// 这种也交给别人
	public DataBaseAccess(String dataDirverName, String url, String username, String password) throws SQLException {
		this.dataDirverName = dataDirverName;
		this.url = url;
		this.username = username;
		this.password = password;
		open();
	}

	public Connection open() throws SQLException {

		if (null == url) {
			throw new SQLException("数据库链接url未指定");
		}

		try {
			if (null == con) {
				// 设置数据库访问的编码方式
				// url = url + "?useUnicode=true&characterEncoding=UTF-8";
				Class.forName(dataDirverName);// 指定连接类型
				con = DriverManager.getConnection(url, username, password);// 获取连接
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return con;
	}

	public Connection getConnection() throws SQLException {
		if (null == con) {
			return open();
		} else {
			return con;
		}
	}

	public void close() {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public List<Map<String, String>> getMultiRecord(String sql) throws SQLException {

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

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
		return list;
	}

	public Map<String, String> getSingleRecord(String sql) throws SQLException {

		List<Map<String, String>> list = null;
		Map<String, String> map = null;
		list = getMultiRecord(sql);
		if (null != list) {
			if (list.size() > 0) {
				map = list.get(0);
			}
		}

		return map;
	}

	public void excuteBatchSql(String[] sqls) throws SQLException {

		Statement st = con.createStatement();
		con.setAutoCommit(false);

		for (int i = 0; i < sqls.length; i++) {
			st.addBatch(sqls[i]);
		}
		st.executeBatch();
		con.commit();

		st.close();

		return;
	}

	public int executeUpdate(String sql) throws SQLException {

		Statement st = con.createStatement();
		int executeUpdate = st.executeUpdate(sql);
		st.close();
		return executeUpdate;
	}

	public static DataBaseAccess getInstance() throws SQLException {

		DataBaseAccess dba = null;
		dba = new DataBaseAccess();
		dba.getConnection();
		return dba;
	}

}
