<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户管理</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body id="page">
<h2>用户信息</h2>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<form method="post" action="${pageContext.request.contextPath}/user/userSearch?page=1">
	  	<th>用户搜索：</th>
	  	<th colspan="2" align="left"><input type="text" name="search" size="25"/></th>
	  	<th colspan="5" align="left">&nbsp;&nbsp;<button type="submit" style="height: 35px;width: 90px;padding-top: 5px">搜索</button></th>
	</form>
  </tr>
  <tr>
    <th style="width: 7%">编号</th>
    <th style="width: 12%">用户账号</th>
    <th style="width: 12%">用户名</th>
    <th style="width: 12%">用户邮箱</th>
    <th style="width: 12%">用户手机</th>
    <th style="width: 32%">用户地址</th>
    <th style="width: 7%">编辑</th>
    <th style="width: 6%">删除</th>
  </tr>
  <c:forEach items="${userQueryVo.userList}" varStatus="s" var="u">
  	<tr align="center">
   		<td >${s.count+userQueryVo.begin}</td>
   		<td>${u.username}</td>
   		<td>${u.name}</td>
   		<td>${u.email}</td>
   		<td>${u.phone}</td>
   		<td>${u.address}</td>
   		<td><a href="${pageContext.request.contextPath}/user/userUpdatePage?userid=${u.uid}"><img src="${pageContext.request.contextPath}/image/i_edit.gif"/></a></td>
   		<td><a href="${pageContext.request.contextPath}/user/userDelete?userid=${u.uid}"><img src="${pageContext.request.contextPath}/image/i_del.gif"/></a></td>
 	</tr>
  </c:forEach>
  <tr align="center">
  	<td colspan="8">
  		<c:if test="${userQueryVo.pagemark == 1}">
  			<a href="${pageContext.request.contextPath}/user/findAll?page=1">首页</a>&nbsp;
	  		<c:if test="${userQueryVo.newpage > 1}">
	  			<a href="${pageContext.request.contextPath}/user/findAll?page=${userQueryVo.newpage-1}">上一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${userQueryVo.newpage <= 1}">
	  			<a href="${pageContext.request.contextPath}/user/findAll?page=1">上一页</a>&nbsp;
	  		</c:if>
	  		${userQueryVo.newpage}/${userQueryVo.pagecount}&nbsp;
	  		<c:if test="${userQueryVo.newpage < userQueryVo.pagecount}">
	  			<a href="${pageContext.request.contextPath}/user/findAll?page=${userQueryVo.newpage+1}">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${userQueryVo.newpage >= userQueryVo.pagecount && userQueryVo.pagecount != 0}">
	  			<a href="${pageContext.request.contextPath}/user/findAll?page=${userQueryVo.pagecount}">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${userQueryVo.newpage >= userQueryVo.pagecount && userQueryVo.pagecount == 0}">
	  			<a href="${pageContext.request.contextPath}/user/findAll?page=1">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${userQueryVo.pagecount == 0}">
	  			<a href="${pageContext.request.contextPath}/user/findAll?page=1">尾页</a>
	  		</c:if>
	  		<c:if test="${userQueryVo.pagecount != 0}">
	  			<a href="${pageContext.request.contextPath}/user/findAll?page=${userQueryVo.pagecount}">尾页</a>
	  		</c:if>
  		</c:if>
  		
  		<c:if test="${userQueryVo.pagemark == 2}">
  			<a href="${pageContext.request.contextPath}/user/userSearch?page=1&search=${userQueryVo.search}">首页</a>&nbsp;
	  		<c:if test="${userQueryVo.newpage > 1}">
	  			<a href="${pageContext.request.contextPath}/user/userSearch?page=${userQueryVo.newpage-1}&search=${userQueryVo.search}">上一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${userQueryVo.newpage <= 1}">
	  			<a href="${pageContext.request.contextPath}/user/userSearch?page=1&search=${userQueryVo.search}">上一页</a>&nbsp;
	  		</c:if>
	  		${userQueryVo.newpage}/${userQueryVo.pagecount}&nbsp;
	  		<c:if test="${userQueryVo.newpage < userQueryVo.pagecount}">
	  			<a href="${pageContext.request.contextPath}/user/userSearch?page=${userQueryVo.newpage+1}&search=${userQueryVo.search}">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${userQueryVo.newpage >= userQueryVo.pagecount && userQueryVo.pagecount != 0}">
	  			<a href="${pageContext.request.contextPath}/user/userSearch?page=${userQueryVo.pagecount}&search=${userQueryVo.search}">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${userQueryVo.newpage >= userQueryVo.pagecount && userQueryVo.pagecount == 0}">
	  			<a href="${pageContext.request.contextPath}/user/userSearch?page=1&search=${userQueryVo.search}">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${userQueryVo.pagecount == 0}">
	  			<a href="${pageContext.request.contextPath}/user/userSearch?page=1&search=${userQueryVo.search}">尾页</a>
	  		</c:if>
	  		<c:if test="${userQueryVo.pagecount != 0}">
	  			<a href="${pageContext.request.contextPath}/user/userSearch?page=${userQueryVo.pagecount}&search=${userQueryVo.search}">尾页</a>
	  		</c:if>
  		</c:if>
  	</td>
  </tr>
</table>
</body>
</html>
