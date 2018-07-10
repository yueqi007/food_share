package com.yueqi.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.yueqi.service.BaseService;

public class BaserController {

	@Resource
	BaseService baseService;

	protected String basePath(HttpServletRequest request) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
				+ "/";
		return basePath;
	}

}
