package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.BookMapper;
import com.ssm.entity.Book;
import com.ssm.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	private BookMapper bMapper;

	@Override
	public List<Book> getBookList() {
		return bMapper.getBookList();
	}

	@Override
	public List<Book> getListByPage(String name, String author) {
		return bMapper.getListByPage(name, author);
	}

	@Transactional
	public int deleteBookById(Integer id) {
		return bMapper.deleteBookById(id);
	}

	@Transactional
	public int deleteManyBooks(List<Integer> ids) {
		int num=0; //定义一个变量 记录删去成功的元素的个数
		for (Integer id : ids) {
			if(bMapper.deleteBookById(id)>0){
				num++;
			}
		}
		if(num==ids.size())
			return 1;
		else
			return 0;
	}

}
