package com.ssm.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ssm.entity.User;

public interface UserMapper {
	
	@Select("select * from user where name=#{name} and password=#{password}")
	User login(@Param("name")String name,@Param("password")String password); //登录
	
	int updateUser(User user); //修改用户-动态Sql去完成
}
