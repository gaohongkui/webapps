package newsPub.beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import news.beans.DataBaseAccess;

public class NewsDAO {
	public ArrayList<News> getAllNews() {
		ArrayList<News> newsList = new ArrayList<News>();
		News news = null;
		DataBaseAccess dba = new DataBaseAccess();
		try {
			String sql = "select *,newstype.newstype as type from news,newstype where news.newstype=newstype.id";
			Connection conn = dba.getConnection();
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setAuthor(rs.getString("author"));
				news.setPubtime(rs.getString("pubtime"));
				news.setKeyword(rs.getString("keyword"));
				news.setAcnumber(rs.getInt("acnumber"));
				news.setNewstype(rs.getInt("newstype"));
				news.setType(rs.getString("type"));
				newsList.add(news);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dba.close();
		}
		return newsList;

	}

	public boolean insert(News news) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		news.setPubtime(df.format(new Date()));
		DataBaseAccess dba = new DataBaseAccess();
		String sql = "insert into news(title,content,author,pubtime,keyword,newstype)" + "values('" + news.getTitle()
				+ "','" + news.getContent() + "','" + news.getAuthor() + "','" + news.getPubtime() + "','"
				+ news.getKeyword() + "'," + news.getNewstype() + ")";
		try {
			return (dba.executeUpdate(sql) > 0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public News getByID(String id) {
		News news = new News();
		;
		DataBaseAccess dba = new DataBaseAccess();
		try {
			String sql = "select * from news where id=" + id;
			Connection conn = dba.getConnection();
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setAuthor(rs.getString("author"));
				news.setPubtime(rs.getString("pubtime"));
				news.setKeyword(rs.getString("keyword"));
				news.setAcnumber(rs.getInt("acnumber"));
				news.setNewstype(rs.getInt("newstype"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dba.close();
		}
		return news;
	}

	public void increaseAc(String id) {
		DataBaseAccess dba = new DataBaseAccess();
		String sql = "update news set acnumber=acnumber+1 where id=" + id;
		try {
			dba.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public boolean deleteNews(String id) {
		DataBaseAccess dba = new DataBaseAccess();
		String sql = "delete from news where id =" + id;
		try {
			int rs = dba.executeUpdate(sql);
			if (rs > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean modiNews(News news) {
		DataBaseAccess dba = new DataBaseAccess();
		String sql = "update news set title='" + news.getTitle() + "',newstype='" + news.getNewstype() + "',keyword='"
				+ news.getKeyword() + "',content='" + news.getContent() + "' where id =" + news.getId();
		try {
			int rs = dba.executeUpdate(sql);
			if (rs > 0) {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public List<Map<String, String>> getAllNewstype() {
		List<Map<String, String>> list = new ArrayList<>();
		DataBaseAccess dba = new DataBaseAccess();
		String sql = "select * from newstype";
		try {
			list = dba.getMultiRecord(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<News> getByKeyword(String keyword) {
		News news = null;
		ArrayList<News> newsList = new ArrayList<News>();
		DataBaseAccess dba = new DataBaseAccess();
		String sql = "select *,newstype.newstype as type from news,newstype where keyword like '%" + keyword
				+ "%' and news.newstype=newstype.id";
		Connection connection;
		try {
			connection = dba.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setPubtime(rs.getString("pubtime"));
				news.setKeyword(rs.getString("keyword"));
				news.setType(rs.getString("type"));
				newsList.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dba.close();
		}
		return newsList;
	}
}
