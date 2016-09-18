package com.practice.oway;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.practice.User.UserService;

@Controller
public class UserController {
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping("user/login.do")
	public String user_login(Model model,String id,String pwd,HttpSession session){
		boolean result=userService.getUserData(model, id, pwd, session);
		
		model.addAttribute("result",result);
		return "user/login";
	}
	
}
