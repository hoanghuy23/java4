package edu.poly.admin.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.UploadUtils;
import edu.poly.dao.VideoDAO;
import edu.poly.model.Video;

/**
 * Servlet implementation class VideoManagermentServlet
 */
@WebServlet({"/Admin/VideoManagermentServlet", "/Admin/VideoManagermentServlet/create", 
	"/Admin/VideoManagermentServlet/update", "/Admin/VideoManagermentServlet/delete", "/Admin/VideoManagermentServlet/reset",
	"/Admin/VideoManagermentServlet/edit"})
@MultipartConfig
public class VideoManagermentServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		
		if(url.contains("edit")) {
			edit(request, response);
			return;
		}
		if(url.contains("delete")) {
			delete(request, response);
			return;
		}
		if(url.contains("reset")) {
			reset(request, response);
			return;
		}
		Video video = new Video();
		//video.setPoster("images/desktop.jpg");
		video.setPoster("images/Doraemon.png");
		findAll(request, response);
		request.setAttribute("video", video);
		
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		
		if(url.contains("create")) {
			create(request, response);
			return;
		}
		if(url.contains("delete")) {
			delete(request, response);
			return;
		}
		if(url.contains("update")) {
			update(request, response);
			return;
		}
		if(url.contains("reset")) {
			reset(request, response);
			return;
		}
	}
	
	private void reset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();
		video.setPoster("images/desktop.jpg");
		request.setAttribute("video", video);
		findAll(request, response);
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
		
	}

	private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Video video = new Video();
		try {
			BeanUtils.populate(video, request.getParameterMap());
			
			VideoDAO dao = new VideoDAO();
			Video oldVideo = dao.findById(video.getVideoId());
			
			if(request.getPart("cover").getSize()==0) {
				oldVideo.setPoster(video.getPoster());
			}else {
			oldVideo.setPoster("uploads/" + UploadUtils.processUploadField("cover", request, "/uploads", video.getPoster()));
			}
			oldVideo.setTitle(video.getTitle());
			oldVideo.setDiscription(video.getDiscription());
			oldVideo.setCode(video.getCode());
			oldVideo.setActive(video.getActive());
			oldVideo.setViews(video.getViews());
			
			dao.update(oldVideo);
			
			request.setAttribute("video", oldVideo);
			request.setAttribute("message", "Video id update!");
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: "+e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}
	
	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Video video = new Video();
		try {
			BeanUtils.populate(video, request.getParameterMap());
			
			video.setPoster("uploads/" + UploadUtils.processUploadField("cover", request, "/uploads", video.getPoster()));
			
			VideoDAO dao = new VideoDAO();
			dao.insert(video);
			
			request.setAttribute("video", video);
			request.setAttribute("message", "Video is inserted!");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error: "+e.getMessage());
		}
		findAll(request, response);
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
	}
	
	private void findAll(HttpServletRequest request, HttpServletResponse response) {
			try {
			VideoDAO dao = new VideoDAO();
			
			List<Video> list = dao.findAll();
			
			request.setAttribute("videos", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: "+e.getMessage());
		}
		
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("videoId");
		
		if(id == null) {
			request.setAttribute("error", "Video id is required !");
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
			return;
		}
		try {
			VideoDAO dao = new VideoDAO();
			Video video = dao.findById(id);
			
			if(video == null) {
				request.setAttribute("error", "Video id not found !");
				PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
				return;
			}
			
			dao.delete(id);
			request.setAttribute("message", "video is delete !");
			
			request.setAttribute("video", new Video());
			findAll(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
		
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) 
				throws ServletException, IOException {
		String id = request.getParameter("videoId");
		
		if(id == null) {
			request.setAttribute("error", "Video id is required !");
			PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
			return;
		}
		try {
			VideoDAO dao = new VideoDAO();
			Video video = dao.findById(id);
			
			request.setAttribute("video", video);
			
			findAll(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
		PageInfo.prepareAndForward(request, response, PageType.VIDEO_MANAGEMENT_PAGE);
		
	}

	

}
