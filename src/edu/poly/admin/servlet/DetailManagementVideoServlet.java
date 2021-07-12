package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.EmailUtils;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.FavoriteDAO;
import edu.poly.dao.JpaUtils;
import edu.poly.dao.ShareDAO;
import edu.poly.dao.VideoDAO;
import edu.poly.domain.Email;
import edu.poly.model.Favorite;
import edu.poly.model.Share;
import edu.poly.model.User;
import edu.poly.model.Video;

/**
 * Servlet implementation class DetailVideoServlet
 */
@WebServlet({"/Admin/DetailManagementVideoServlet", "/Admin/DetailManagementVideoServlet/insert", "/Admin/DetailManagementVideoServlet/delete", "/Admin/DetailManagementVideoServlet/share"})
public class DetailManagementVideoServlet extends HttpServlet {
	User user = new User();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = SessionUtils.getLoginedUsername(request);
		String videoId = request.getParameter("videoId");
		
		VideoDAO dao = new VideoDAO();
		Video video = dao.findById(videoId);
		
		if(username != null) {
			FavoriteDAO favdao = new FavoriteDAO();
			Favorite fav = favdao.findOneByUserIdAndVideoId(username, videoId);
			request.setAttribute("favorite", fav);
			request.setAttribute("username", username);
		}else {
			request.getRequestDispatcher("/LoginServlet").forward(request, response);
			return;
		}
			
			request.setAttribute("video", video);
			
				PageInfo.prepareAndForward(request, response, PageType.DETAIL_VIDEO_MANAGEMENT_PAGE);
			
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if (uri.contains("insert")) {
			this.like(request, response);
		} else if (uri.contains("delete")) {
			this.unlike(request, response);
		} else if (uri.contains("share")) {
			this.share(request, response);
		}
	}
	
	private void share(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String videoId = request.getParameter("videoId");
		response.sendRedirect("http://localhost:8080/WebVideo/Admin/ShareVideoManagementServlet?videoId=" + videoId);
	}
		
	
	private void unlike(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = SessionUtils.getLoginedUsername(request);
		String videoId = request.getParameter("videoId");
		Video video = new Video();
		try {
			BeanUtils.populate(video, request.getParameterMap());
			FavoriteDAO dao = new FavoriteDAO();
			Favorite favorite = dao.findOneByUserIdAndVideoId(userId, video.getVideoId());
			dao.delete(favorite.getId());
			response.sendRedirect("http://localhost:8080/WebVideo/Admin/DetailManagementVideoServlet?videoId=" + videoId);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void like(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		FavoriteDAO dao = new FavoriteDAO();
		String userId = SessionUtils.getLoginedUsername(request);
		Video video = new Video();
		String videoId = request.getParameter("videoId");
		if (userId != null) {
			try {
				Favorite favorite = new Favorite();
				BeanUtils.populate(video, request.getParameterMap());
				favorite.setVideo(video);
				
				User user = new User();
				user.setUsername(userId);
				favorite.setUser(user);

				favorite.setLikeDate(new Date());
				
				dao.insert(favorite);
				response.sendRedirect("http://localhost:8080/WebVideo/Admin/DetailManagementVideoServlet?videoId=" + videoId + "");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public boolean isCheck(User user) {
		if(user.getAdmin()) {
			return true;
		}
		return false;
	}
}
