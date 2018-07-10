package com.yueqi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yueqi.pojo.Comment;
import com.yueqi.pojo.User;

@Controller
@RequestMapping("/comment")
public class CommentController extends BaserController {

	@RequestMapping("/test")
	public ModelAndView test(@RequestParam(value = "id", required = false) int id) {
		ModelAndView mvAndView = new ModelAndView();
		System.out.println(id);
		Object obj = baseService.queryById("comment.selectById", id);
		Comment comment = (Comment) obj;
		System.out.println(comment.getContent() + ":" + comment.getId());
		User user = comment.getUser();
		if (user != null) {
			System.out.println(user.getId());
			System.out.println(user.getUsername());
		}

		// Iterator iterator = map.keySet().iterator();
		// while (iterator.hasNext()) {
		// String key = (String) iterator.next();
		// String value = (String) map.get(key);
		// System.out.println("key:" + key + ";value:" + value);
		// }
		return mvAndView;
	}

}
