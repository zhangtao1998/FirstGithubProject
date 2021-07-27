package com.ssm.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//文件操作相关的控制器
@Controller
public class FileOpController {
	
	//下载功能
	@RequestMapping("/download.do")
	public void downLoadFile(String filename,HttpServletRequest request,HttpServletResponse response) throws Exception{
		//1、拿到文件的路径
		String file=request.getServletContext().getRealPath("/imgs/"+filename);
		//2、创建一个文件输入流
		FileInputStream fis=new FileInputStream(file);
		//3、字符编码的处理--浏览器默认解析编码为iso-8859-1
		filename=new String(filename.getBytes("UTF-8"),"ISO-8859-1");
		//4、设置响应信息【文档头-内容类型-文件长度等】
		response.setHeader("content-disposition","attchment;filename="+filename); //设置文档头
		response.setContentType("application/octet-stream");//  设置文档的类型
		response.setContentLength(fis.available()); //设置 文档的长度
		//5、循环读写--创建缓冲区
		byte[] by=new byte[2048]; //构建一个缓冲区-
		int len=0; //读的长度
		while((len=fis.read(by))!=-1){ //不等于-1就继续读
			response.getOutputStream().write(by, 0, len); //写
		}
		//6、关闭资源
		response.getOutputStream().flush(); //刷新
		response.getOutputStream().close(); //关闭资源
		fis.close();
	}
}
