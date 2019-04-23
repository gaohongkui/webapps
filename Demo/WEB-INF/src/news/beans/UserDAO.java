package news.beans;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	public User user = new User();

	public boolean queryByNamePwd(String uName, String uPwd) {
		DataBaseAccess dba = new DataBaseAccess();
		String sql = "select username,userType from user where username= ? and password = ?";
		try {
			PreparedStatement pst = dba.getConnection().prepareStatement(sql);
			pst.setString(1, uName);
			pst.setString(2, uPwd);
			ResultSet rs = pst.executeQuery();
			if (rs != null && rs.next()) {
				user.setUsername(rs.getString("username"));
				user.setUserType(rs.getString("userType"));
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dba.close();
		}
		return false;
	}

	public int addUser(User user) {
		DataBaseAccess dba = new DataBaseAccess();
		String sql = "insert into user(username,password,gender,resume) values('" + user.getUsername() + "','"
				+ user.getPassword() + "','" + user.getGender() + "','" + user.getResume() + "')";
		System.out.println(sql);
		try {
			int rs = dba.executeUpdate(sql);
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dba.close();
		}
		return 0;
	}
}
