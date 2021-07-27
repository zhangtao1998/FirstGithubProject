package com.ssm.service;

import java.util.List;

import com.ssm.entity.Book;

public interface BookService {
	
	List<Book> getBookList();
	
	//多条件分页模糊查
	List<Book> getListByPage(String name,String author);
	
	int deleteBookById(Integer id);
	
	//批量删去
	int deleteManyBooks(List<Integer> ids);

}
