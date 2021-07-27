<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){ //jquery简写的初始化 --//：even代表是偶数行  :odd 代表的是基数行 
	//$(".base:even").css("background-color","green");
	$(".base:odd").css("background-color","green");
	
	//全选全不选
	$("#all").click(function(){
		if($(this).is(":checked")){
			$('[name="ids"]').prop("checked",true);
		}else{
			$('[name="ids"]').prop("checked",false);
		}
	});
	//批量删去
	$("#delMany").click(function(){
		var ch=$('[name="ids"]:checked'); //被选中的元素
		if(ch.length==0){ //长度为0说明没有被选中元素 
			alert("请至少选中一个要删去的元素!");
			return; //代码不往下执行 
		}//有被选中的元素 
		var url="delMany.do?ids="; //基础url 
		for(var i=0;i<ch.length;i++){
			url+=$(ch[i]).val()+",";
		}
		window.location.href=url; //发送请求 
	});
});
</script>
</head>
<body>
	<div align="center">
		<h3><a href="toUpdateUser.do">${sessionScope.user.name}</a>欢迎您!&nbsp;<a href="logout.do">退出</a></h3>
		<p>
		  <img src="${ctx}/imgs/${sessionScope.user.picture}" alt="" width="100px" height="100px"/><br>
		  <a href="download.do?filename=${sessionScope.user.picture}">点击下载</a>
		  </p>
		<form action="bkList.do" method="post">
			<p>
				书名:<input type="text" name="name" value="${name==null?'':name}"/>&nbsp;
				作者:<input type="text" name="author" value="${author==null?'':author}"/>&nbsp;
				<input type="submit" value="搜索"/>&nbsp;<input type="button" id="delMany" value="批量删去"/>
			</p>
		</form>
		<table border="1" cellpadding="0" cellspacing="0" width="80%">
			<tr>
				<th colspan="9" style="background-color: orange"><h3>图书列表页面</h3></th>
			</tr>
			<tr>
				<th><input type="checkbox" name=""  id="all" value="" /></th>
				<th>书名</th>
				<th>作者</th>
				<th>出版社</th>
				<th>出版日期</th>
				<th>页数</th>
				<th>价格</th>
				<th>摘要</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${list}" var="bk">
				<tr class="base">
					<th><input type="checkbox" name="ids" value="${bk.id}" /></th>
					<th>${bk.name}</th>
					<th>${bk.author}</th>
					<th>${bk.publish}</th>
					<th><fmt:formatDate value="${bk.publishdate}" pattern="yyyy-MM-dd"/></th>
					<th>${bk.page}</th>
					<th>${bk.price}</th>
					<th>${bk.content}</th>
					<th>
					  <a href="#">详情</a>
					  <a href="#">修改</a>
					  <a href="deleteBook.do?id=${bk.id}">删去</a>
					  </th>
				</tr>
			</c:forEach>
			<tr>
				<th colspan="9"><input type="button" value="新增图书" /></th>
			</tr>
		</table>
		<p>
			<a href="bkList.do?pno=${page.navigateFirstPage}&&name=${name}&&author=${author}">首页</a>&nbsp;
			<a href="bkList.do?pno=${page.hasNextPage ? page.nextPage:page.navigateLastPage}&&name=${name}&&author=${author}">下页</a>&nbsp;
			<a href="bkList.do?pno=${page.hasPreviousPage ? page.prePage:page.navigateFirstPage}&&name=${name}&&author=${author}">上页</a>&nbsp;
			<a href="bkList.do?pno=${page.navigateLastPage}&&name=${name}&&author=${author}">末页</a>&nbsp;
			当前页${page.size}条数据,总条数为:${page.total},当前第${page.pageNum}页/共${page.pages}页<br>
			<span style="color:green">${msg==null?'':msg}</span>
		</p>
	</div>
</body>
</html>