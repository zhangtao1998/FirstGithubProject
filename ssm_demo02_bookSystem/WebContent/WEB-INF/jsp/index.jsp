<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#lg").click(function(){ //用户提交表单时
		$("#form1").submit(function(){//提交表单
			if(checkName() && checkPwd()){
				return true;
			}else{
				return false;
			}
		});
	});
	//用户离开焦点时 
	$("#name").blur(checkName);
	$("#pwd").blur(checkPwd);
});

function checkName(){ //验证用户名 
	//1、获取文本框的值
	var name=$("#name").val();
	//2、编写验证规则
	var reg=/^\w{6,8}$/;
	var flag=reg.test(name);
	if(flag){
		//去边框-清空提示信息 -
		$("#name").css("border","");
		$("#nmsg").html("");
        return true; 
	}else{
      //加红色边框-且给提示信息 
		$("#name").css("border","1px solid red");
		$("#nmsg").html("用户名不能为空且由6-8位数字字母下划线组成!").css("color","red");
		$("#name").focus(); //获得
        return false; 
	};
}

function checkPwd(){ //验证密码
	//1、获取文本框的值
	var pwd=$("#pwd").val(); 
	//2、编写验证规则
	var reg=/^\w{6,8}$/;
	var flag=reg.test(pwd);
	if(flag){
		//去边框-清空提示信息 -
		$("#pwd").css("border","");
		$("#pmsg").html("");
        return true; 
	}else{
		//加红色边框-且给提示信息 
		$("#pwd").css("border","1px solid red");
		$("#pmsg").html("密码不能为空且由6-8位数字字母下划线组成!").css("color","red");
		$("#pwd").focus(); //获得
		 return false; 
	};
}
</script>
</head>
<body>
  <div align="center">
	<form action="login.do" method="post" id="form1">
		<table border="1" cellpadding="0" cellspacing="0" width="80%">
			<tr>
				<th colspan="2"><h3>图书管理系统</h3></th>
			</tr>
			<tr>
				<th style="background-color: orange">用户名:</th>
				<th><input  type="text" name="name" id="name" value=""/><span id="nmsg"></span></th>
			</tr>
			<tr>
				<th style="background-color: orange">密码:</th>
				<th><input  type="text" name="password" id="pwd" value=""/><span id="pmsg"></span></th>
			</tr>
			<tr>
				<th colspan="2"><input  type="submit"  id="lg" value="登录"/></th>
			</tr>
		</table>
		<span style="color:blue">${msg==null?'':msg}</span>
	</form>
</div>
</body>
</html>