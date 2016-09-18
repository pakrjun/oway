package com.practice.User;

import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	private UserMapper mapper;
	public int userCount(String id){
		return mapper.UserCount(id);
	}
	public UserVO userData(String id){
		return mapper.UserData(id);
	}
}
