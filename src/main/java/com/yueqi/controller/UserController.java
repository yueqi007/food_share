package com.yueqi.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.yueqi.common.StringUtils;
import com.yueqi.pojo.User;


@Controller
@RequestMapping("/user")
public class UserController extends BaserController{
	 
	@RequestMapping("/toRegister")
	public String toRegister() {
		
		return "user/register";
	}
	
	@RequestMapping("/list")
	public String list() {
		return "user/list";
	}
	
	@RequestMapping("/toUpdate")
	public String toUpdate(@RequestParam String id,HttpServletRequest request) {
		System.out.println("id:"+id);
		if(id != null && id!="") {
			request.getSession().setAttribute("updateUser", (User)baseService.queryById("user.getById", id));
		}
		return "user/update";
	}
	
	@RequestMapping(value="/validateUserName",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Map<String,String> validateUserName(String username) {
		
		HashMap<String, String> map = new HashMap<String,String>();
		User user =  (User) baseService.queryByName("user.getByName",username);
		if(user != null) {
			map.put("status", "true");
		}else{
			map.put("status", "false");
		}
		return map;
	}
	

	
	@RequestMapping("/register")
	@ResponseBody
	public String register(User user) {
		JSONObject jsonObject = new JSONObject();
		System.out.println(user.getUsername());
		int i = baseService.insert("user.insertUser", user);
		
		if(i==0) {
			jsonObject.put("status", "false");
			jsonObject.put("msg", "新增用户发生错误！");
		}else {
			jsonObject.put("status", "true");
			jsonObject.put("msg", "新增用户成功！");
		}
		return jsonObject.toJSONString();
	}
	

	
	@RequestMapping(value="/getList",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public  String list( Integer page,Integer rows,@RequestParam(value="searchPhrase",required=false) String searchPhrase){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (page-1)*rows);
		map.put("limit", rows);
		map.put("name", searchPhrase);
		List<User> list = (List<User>) baseService.queryAll("user.queryAll",map);
		Integer total = baseService.getTotalCount("user.getTotalCount",map);
		JSONObject json = new JSONObject();
		json.put("rows", list);
		json.put("current", page);
		json.put("rowCount", rows);
		json.put("total", total);
		return json.toJSONString();
	}
	
	@RequestMapping(value="/delete",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String delete(String ids){
		JSONObject jsonObject = new JSONObject();
		Integer i = baseService.delete("user.deleteUser", StringUtils.StringToList(ids));
		if(i==0) {
			jsonObject.put("status", "false");
			jsonObject.put("msg", "删除用户发生错误！");
		}else {
			jsonObject.put("status", "true");
			jsonObject.put("msg", "删除用户成功！");
		}
		return jsonObject.toJSONString();
	}
	
	@RequestMapping("/update")
	public String update(Model model,HttpServletRequest request,User user){
		JSONObject jsonObject = new JSONObject();
		Date date = user.getBirthday();
		int id = user.getId(); 
		int i = baseService.update("user.updateUser",user);
		if(i==0) {
			jsonObject.put("status", "false");
			jsonObject.put("msg", "更新用户发生错误！");
		}else {
			jsonObject.put("status", "true");
			jsonObject.put("msg", "更新用户成功！");
		}
		return  "user/update";
	}
	
}
