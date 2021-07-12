package edu.poly.site.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.common.CookieUtils;
import edu.poly.common.PageInfo;
import edu.poly.common.PageType;
import edu.poly.common.SessionUtils;
import edu.poly.dao.UserDAO;
import edu.poly.domain.LoginForm;
import edu.poly.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = CookieUtils.get("username", request);
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_LOGIN_PAGE);
		if(username != null) {
			SessionUtils.add(request, "username", username);
			request.getRequestDispatcher("/HomepageServlet").forward(request, response);
			return;
		}	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			LoginForm form = new LoginForm();
			
			BeanUtils.populate(form, request.getParameterMap());
			
			UserDAO dao = new UserDAO();
			User user = dao.findById(form.getUsername());
			
			if(user!=null && user.getPassword().equals(form.getPassword())) {
				SessionUtils.add(request, "username", user.getUsername());
				
				if(form.isRemember()) {
					CookieUtils.add("username", form.getUsername(), 0, response);
				}else {
					CookieUtils.add("username", form.getUsername(), 24, response);
				}
				if(this.isCheck(user)) {
					response.sendRedirect("Admin/HomeManagementServlet");
				}else {
					response.sendRedirect("HomepageServlet");
				}
				request.setAttribute("isLogin", true);
				request.setAttribute("name", user.getFullname());
				//request.getRequestDispatcher("/HomepageServlet").forward(request, response);
				return;
			}
			request.setAttribute("error", "invalid username or password");
			
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("error", e.getMessage());
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_LOGIN_PAGE);
	}
	public boolean isCheck(User user) {
		if(user.getAdmin()) {
			return true;
		}
		return false;
	}

}
