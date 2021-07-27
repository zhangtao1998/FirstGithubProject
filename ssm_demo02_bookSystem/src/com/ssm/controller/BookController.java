package com.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Book;
import com.ssm.service.BookService;

@Controller
public class BookController {
	
	@Autowired
	private BookService bServce;
	
	//图书列表查询
	@RequestMapping("/bookList.do")
	public ModelAndView getBookList(){
		List<Book> blist = bServce.getBookList();
		if(blist!=null){
			return new ModelAndView("booklist","blist",blist);
		}
		return null;
	}
	
	
	   //多条件分页模糊查
		@RequestMapping("/bkList.do")
		public ModelAndView getBkListByManyCon(
				@RequestParam(name="name",required=false,defaultValue="")String name
				,@RequestParam(name="author",required=false,defaultValue="")String author
				,@RequestParam(name="pno",required=true,defaultValue="1")Integer pno){
			ModelAndView mv=new ModelAndView(); //新建ModelAndView对象
			PageHelper.startPage(pno,3,"publishdate desc");//分页
			//调用业务处理-查询
			List<Book> list = bServce.getListByPage(name,author);
			PageInfo<Book> page=new PageInfo<Book>(list);//封装数据--分好页的数据
			//响应
			if(list!=null){
				mv.addObject("list",list);
				mv.addObject("page",page);
				mv.addObject("name",name);
				mv.addObject("author",author);
				mv.addObject("pno",pno);
				mv.setViewName("booklist");
				return mv;
			}
			return null;
		}
		
		//根据图书id删去图书
		@RequestMapping("/deleteBook.do")
		public ModelAndView deleteBook(Integer id){
			int num=bServce.deleteBookById(id);
			if(num>0){
				return new ModelAndView("forward:bkList.do","msg","delete success!");
			}
			return null;
		}
		
		//批量删去
		@RequestMapping("/delMany.do")
		public ModelAndView delManyBook(String ids){
			//1、声明一个集合装载切割的元素
			List<Integer> idlist=new ArrayList<Integer>();
			String[] idss = ids.split(",");
			for (String id: idss) {
				idlist.add(Integer.parseInt(id));
			}
			//2、调用业务处理
			if(idlist!=null && idlist.size()>0){
				int num=bServce.deleteManyBooks(idlist);
				if(num>0){ //3、响应
					return new ModelAndView("redirect:bkList.do"); //去图书列表页面
				}
			}
			return null;
		}
}
