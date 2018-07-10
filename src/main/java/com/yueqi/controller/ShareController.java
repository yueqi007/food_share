package com.yueqi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yueqi.pojo.Share;
import com.yueqi.pojo.User;

@Controller
@RequestMapping("/share")
public class ShareController extends BaserController {

	@RequestMapping("/toShare")
	public String toRegister() {
		return "share/share";
	}

	@RequestMapping(value = "/test", method = { RequestMethod.POST, RequestMethod.GET })
	public String testPage() {
		Map map = new HashMap();

		map.put("limit", "18");
		map.put("start", "0");
		List<Share> list = (List<Share>) baseService.queryAll("share.getShareAndUser", map);
		for (Share share : list) {
			User user = share.getUser();
			String username = user.getUsername();
		}
		return "";
	}

	@RequestMapping("/toList")
	public String toList(@RequestParam(value = "page", defaultValue = "1") int page, HttpServletRequest request,
			@RequestParam(value = "orderBy", defaultValue = "createdate") String orderBy) {
		Map map = new HashMap<>();
		map.put("start", (page - 1) * 18);
		map.put("limit", "18");
		if (orderBy.equals("createdate")) {
			map.put("createdate", "1");
		} else {
			map.put("view_times", "1");
		}
		List<Share> list = (List<Share>) baseService.queryAll("share.getShareAndUser", map);
		request.getSession().setAttribute("share_list", list);
		return "share/list";
	}

	@RequestMapping("/share")
	public String share() {
		return "share/share";
	}

	@RequestMapping("/toIndex")
	public String toIndex() {
		return "share/index";
	}

	@RequestMapping("/totest")
	public String toTest() {
		return "share/test";
	}

}
