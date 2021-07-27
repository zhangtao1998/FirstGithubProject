package com.ssm.service;

import com.ssm.entity.User;

public interface UserService {
	
	User login(String name,String password); //登录
	
	int updateUser(User user);
}
