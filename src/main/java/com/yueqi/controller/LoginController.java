package com.yueqi.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.yueqi.pojo.User;

@Controller
@RequestMapping("/main")
public class LoginController extends BaserController{
	
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("loginInfo");
		ModelAndView mv = new ModelAndView();
		if (user != null) {
			request.getSession().invalidate();
		}
		mv.setViewName("user/login");
		return mv;
	}
	
	@RequestMapping("/index")
	public ModelAndView index(String username,String password,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		ModelMap map = new ModelMap();
		User user = (User) baseService.queryByName("user.getByName", username.trim());
		if(user == null) {
			mv.addObject("errMsg", "用户不存在，请核对");
			mv.setViewName("user/login");
			return mv;
		}
		if(!user.getPassword().equals(password.trim())) {
			mv.addObject("errMsg", "密码错误，请核对");
			mv.setViewName("user/login");
			return mv;
		}
		request.getSession().setAttribute("loginInfo", user);
		
		mv.clear();
		mv.setViewName("index");
		return mv;
	}

}
