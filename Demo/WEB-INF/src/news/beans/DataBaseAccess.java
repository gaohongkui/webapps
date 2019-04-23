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

	// ���ݿ����ϵͳ����
	private String dataDirverName = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/dbnews?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
	private String username = "root";
	private String password = "";
	// ���ݿ�����
	Connection con = null;

	// Ĭ���Լ�����
	public DataBaseAccess() {
		try {
			open();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// ���û���������ı�ʱ���׳�sql�쳣�����˴���
	public DataBaseAccess(String username, String password) throws SQLException {
		super();
		this.username = username;
		this.password = password;
		open();
	}

	// ����Ҳ��������
	public DataBaseAccess(String dataDirverName, String url, String username, String password) throws SQLException {
		this.dataDirverName = dataDirverName;
		this.url = url;
		this.username = username;
		this.password = password;
		open();
	}

	public Connection open() throws SQLException {

		if (null == url) {
			throw new SQLException("���ݿ�����urlδָ��");
		}

		try {
			if (null == con) {
				// �������ݿ���ʵı��뷽ʽ
				// url = url + "?useUnicode=true&characterEncoding=UTF-8";
				Class.forName(dataDirverName);// ָ����������
				con = DriverManager.getConnection(url, username, password);// ��ȡ����
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

		PreparedStatement pst = con.prepareStatement(sql);// ׼��ִ�����
		ResultSet rs = pst.executeQuery();// ִ����䣬�õ������
		ResultSetMetaData rsmd = rs.getMetaData();

		while (rs.next()) {
			Map<String, String> record = new HashMap<String, String>();
			for (int i = 0; i < rsmd.getColumnCount(); i++) {
				// ˵��������ʹ��getColumnName�����������޷��õ�as�������
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
