package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ssm.entity.Book;

public interface BookMapper {
	
	@Select("select * from book")
	List<Book> getBookList();
	
	//多条件分页模糊查
	List<Book> getListByPage(@Param("name")String name,@Param("author")String author);
	
	@Delete("delete from book where id=#{id}")
	int deleteBookById(Integer id);

}
