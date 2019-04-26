package newsPub.beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import news.beans.DataBaseAccess;

public class NewsDAO {
	public ArrayList<News> getAllNews() {
		ArrayList<News> newsList = new ArrayList<News>();
		News news = null;
		DataBaseAccess dba = new DataBaseAccess();
		try {
			String sql = "select * from news";
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
		String sql = "insert into news(title,content,author,pubtime,keyword,newtype)" + "values('" + news.getTitle()
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

}
