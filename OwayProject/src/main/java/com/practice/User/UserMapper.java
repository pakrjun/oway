package com.practice.User;

import org.apache.ibatis.annotations.Select;

public interface UserMapper {
	@Select("SELECT COUNT(id) "
			+ "FROM owayuser "
			+ "WHERE id=#{id}")
	public int UserCount(String id);
	@Select("SELECT id,pwd,name "
			+ "FROM owayuser "
			+ "WHERE id=#{id}")
	public UserVO UserData(String id);
}
