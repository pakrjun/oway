package com.practice.User;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class UserService {
	private UserDAO dao;
	
	public boolean getUserData(Model model,String id,String pwd,HttpSession session){
		
		int ck=dao.userCount(id);
		boolean result=true;
		if(ck==0){
			result=false;
		}else{
			UserVO user=dao.userData(id);
			if(!user.getPwd().equals(pwd)){
				session.setAttribute("userId", user.getId());
				session.setAttribute("userName", user.getName());
			}else{
				result=false;
			}
		}
		return result;
	}
	public void userLogout(HttpSession session){
		session.invalidate();
	}
}
