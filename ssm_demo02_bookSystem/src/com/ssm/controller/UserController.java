package com.ssm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.entity.User;
import com.ssm.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;
	
	//去首页登录
	@RequestMapping("/toIndex.do")
	public String toIndex(){
		return "index";
	}
	
	//登录
	@RequestMapping("/login.do")
	public String login(User user,Model model,HttpServletRequest request){
		//调用业务处理
		User u=uService.login(user.getName(),user.getPassword());
		//判断-作出响应
		if(u!=null){ //证明登录成功-去图书列表页面-并把当前登录用户的信息保存到session当中
			request.getSession().setAttribute("user",u);
			//return "redirect:bookList.do"; //重定向
			return "redirect:bkList.do"; //重定向
		}else{ //登录失败-去登录页面重新登录-且带消息提示
			model.addAttribute("msg","用户名或密码不正确!");
			return "forward:toIndex.do";
		}
	}
	//退出
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:login.do";
	}
	
	//去修改当前登录用户的信息页面
	@RequestMapping("/toUpdateUser.do")
	public String toUpdateUserPage(){
		return "updateUser";
	}
	
	//修改用户信息
	@RequestMapping("/updateUser.do")
	public ModelAndView updateUser(User user){
		int num=uService.updateUser(user);
		if(num>0){
			return new ModelAndView("redirect:bkList.do"); 
		}
		return null;
	}
	
}
