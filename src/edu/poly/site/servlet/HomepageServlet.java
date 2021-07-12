package edu.poly.site.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.poly.common.CookieUtils;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.FavoriteDAO;
import edu.poly.dao.VideoDAO;
import edu.poly.model.User;
import edu.poly.model.Video;

/**
 * Servlet implementation class HomepageServlet
 */
@WebServlet("/HomepageServlet")
public class HomepageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = SessionUtils.getLoginedUsername(request);
		try {
			
			VideoDAO dao = new VideoDAO();
			request.setAttribute("numberPage", dao.getNumberPage());
			String index = request.getParameter("index");
			if (index== null) {
				index="1";
			}
			int indexPage = Integer.parseInt(index);
			request.setAttribute("indexPage", indexPage);
			List<Video> list = dao.FindAllVideoView((indexPage-1) * 6,6);
			FavoriteDAO favdao = new FavoriteDAO();
			List<Video> favlist = favdao.findAllByUserId(username);
			request.setAttribute("favlist", favlist);
			request.setAttribute("videos", list);
			request.setAttribute("username", username);
			
		} catch (Exception e) {
			e.printStackTrace();
			
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_HOME_PAGE);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
