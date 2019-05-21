package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import newsPub.beans.News;
import newsPub.beans.NewsDAO;

/**
 * Servlet implementation class NewsServlet
 */
@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewsServlet() {
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
		request.setCharacterEncoding("utf-8");
		ArrayList<News> newsList = new ArrayList<News>();
		NewsDAO newsDAO = new NewsDAO();
		String func = request.getParameter("action");
		if (func == null) {
			func = "";
		}

		if (func.equals("query")) {
			String keyword = request.getParameter("keyword");
			newsList = newsDAO.getByKeyword(keyword);
			request.setAttribute("action", "query");
			request.setAttribute("keyword", keyword);
		} else {
			newsList = newsDAO.getAllNews();
		}
		System.out.println(newsList.toString());
		request.setAttribute("newsList", newsList);
		request.getRequestDispatcher("listNews.jsp").forward(request, response);
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
