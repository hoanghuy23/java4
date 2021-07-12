package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.dao.FavoriteDAO;
import edu.poly.dao.ShareDAO;
import edu.poly.dao.VideoDAO;
import edu.poly.domain.FavoriteReport;
import edu.poly.domain.FavoriteUserReport;
import edu.poly.domain.FavoriteUserReportShare;
import edu.poly.model.Video;

/**
 * Servlet implementation class ReportsManagementServlet
 */
@WebServlet("/Admin/ReportsManagementServlet")
public class ReportsManagementServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reportFavoritesByVideos(request, response);
		reportFavoriteUsersByVideo(request, response);
		reportFavoriteSharesByVideo(request, response);
		PageInfo.prepareAndForward(request, response, PageType.REPORT_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void reportFavoritesByVideos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			FavoriteDAO dao = new FavoriteDAO();
			List<FavoriteReport> list = dao.reportFavoritesByVideos();
			
			request.setAttribute("favList", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
	protected void reportFavoriteUsersByVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String videoUserId = request.getParameter("videoUserId");
			VideoDAO vdao = new VideoDAO();
			List<Video> vlist = vdao.findAll();
			
			if(videoUserId == null && vlist.size()>0) {
				videoUserId = vlist.get(0).getVideoId();
			}
			
			FavoriteDAO dao = new FavoriteDAO();
			List<FavoriteUserReport> list = dao.reportFavoriteUsersByVideo(videoUserId);
			
			request.setAttribute("videoUserId", videoUserId);
			request.setAttribute("vidList", vlist);
			
			request.setAttribute("favUsers", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
	
	protected void reportFavoriteSharesByVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String videoUserId = request.getParameter("videoUserId");
			VideoDAO vdao = new VideoDAO();
			List<Video> vlist = vdao.findAll();
			
			if(videoUserId == null && vlist.size()>0) {
				videoUserId = vlist.get(0).getVideoId();
			}
			
			ShareDAO dao = new ShareDAO();
			List<FavoriteUserReportShare> list = dao.reportFavoritesSharesVideo(videoUserId);
			
			request.setAttribute("videoUserId", videoUserId);
			request.setAttribute("vidList", vlist);
			
			request.setAttribute("Shares", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

}
