<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){ //jquery简写的初始化 --//：even代表是偶数行  :odd 代表的是基数行 
	var sex='${sessionScope.user.sex}'; //性别 
	if(sex=="0"){ //男
		$("#man").prop("checked",true);
	}else{ // 女
		$("#girl").prop("checked",true);
	}
	
	//返回的操作 
	$("#but").click(function(){
		//history.go(-1); 
		 history.back();
	});
	
});
</script>
</head>
<body>
	<div align="center">
		<form action="updateUser.do" method="post">
			<p>
				<input type="hidden" name="id" value="${sessionScope.user.id}"/>
				姓名:<input type="text" name="name" value="${sessionScope.user.name}"/>
			</p>
			<p>
				性别:<input type="radio" name="sex" id="man" value="0"/>男
				<input type="radio" name="sex" id="girl" value="1"/>女
			</p>
			<p>
				年龄:<input type="text" name="age" value="${sessionScope.user.age}"/>
			</p>
			<p>
				<input type="submit" value="修改"/> &nbsp;<input type="button" id="but" value="返回"/>
			</p>
		</form>
	</div>
</body>
</html>