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
  	<th colspan="4"><a href="${pageContext.request.contextPath}/category/addCategoryPage"><button type="button" style="width: 100%;">添加一级分类</button></a></th>
  </tr>
  <tr>
    <th style="width: 7%">编号</th>
    <th style="width: 80%">一级分类名</th>
    <th style="width: 7%">编辑</th>
    <th style="width: 6%">删除</th>
  </tr>
  <c:forEach items="${categoryQueryVo.clist}" varStatus="s" var="c">
  	<tr align="center">
   		<td >${s.count+categoryQueryVo.begin}</td>
   		<td>${c.cname}</td>
   		<td><a href="${pageContext.request.contextPath}/category/updatePage?cid=${c.cid}"><img src="${pageContext.request.contextPath}/image/i_edit.gif"/></a></td>
   		<td><a href="${pageContext.request.contextPath}/category/delete?cid=${c.cid}"><img src="${pageContext.request.contextPath}/image/i_del.gif"/></a></td>
 	</tr>
  </c:forEach>
  <tr align="center">
  	<td colspan="4">
  		<a href="${pageContext.request.contextPath}/category/findAll?page=1">首页</a>&nbsp;
  		<c:if test="${categoryQueryVo.newpage > 1}">
  			<a href="${pageContext.request.contextPath}/category/findAll?page=${categoryQueryVo.newpage-1}">上一页</a>&nbsp;
  		</c:if>
  		<c:if test="${categoryQueryVo.newpage <= 1}">
  			<a href="${pageContext.request.contextPath}/category/findAll?page=1">上一页</a>&nbsp;
  		</c:if>
  		${categoryQueryVo.newpage}/${categoryQueryVo.pagecount}&nbsp;
  		<c:if test="${categoryQueryVo.newpage < categoryQueryVo.pagecount}">
  			<a href="${pageContext.request.contextPath}/category/findAll?page=${categoryQueryVo.newpage+1}">下一页</a>&nbsp;
  		</c:if>
  		<c:if test="${categoryQueryVo.newpage >= categoryQueryVo.pagecount}">
  			<a href="${pageContext.request.contextPath}/category/findAll?page=${categoryQueryVo.pagecount}">下一页</a>&nbsp;
  		</c:if>
  		<a href="${pageContext.request.contextPath}/category/findAll?page=${categoryQueryVo.pagecount}">尾页</a></td>
  </tr>
</table>
</body>
</html>
