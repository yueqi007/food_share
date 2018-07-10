package com.yueqi.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yueqi.pojo.User;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if (uri.indexOf("login") >= 0 || uri.indexOf("index") >= 0) {
			return true;
		}
		User user = (User) request.getSession().getAttribute("loginInfo");
		if (user == null) {
			request.setAttribute("errMsg", "ÇëÏÈµÇÂ¼£¡");
			request.getRequestDispatcher("/WEB-INF/jsp/user/login.jsp").forward(request, response);
			return false;
		} else {
			return true;
		}
		// }
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
