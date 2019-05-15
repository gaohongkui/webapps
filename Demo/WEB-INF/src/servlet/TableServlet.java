package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.beans.DataBaseAccess;
import newsPub.beans.News;

/**
 * Servlet implementation class TableServlet
 */
@WebServlet("/TableServlet")
public class TableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TableServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		Context context = new HttpServletRequestContext(request);
//		LimitFactory limitFactory = new TableLimitFactory(context);
//		Limit limit = new TableLimit(limitFactory);
//		String string = "limit.getCurrentRowsDisplayed()" + limit.getCurrentRowsDisplayed() + "\nlimit.getPage()"
//				+ limit.getPage() + "\nlimit.getRowStart()" + limit.getRowStart() + "\nlimit.getRowEnd()"
//				+ limit.getRowEnd() + "\nlimit.getTotalRows()" + limit.getTotalRows() + "\nlimitFactory.getPage()"
//				+ limitFactory.getPage();
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
		request.setAttribute("newsList", newsList);
		request.getRequestDispatcher("/manageNews.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
