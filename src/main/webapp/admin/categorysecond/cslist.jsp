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
  	<th colspan="5"><a href="${pageContext.request.contextPath}/categorysecond/addCategorysecondPage"><button type="button" style="width: 100%;">添加二级分类</button></a></th>
  </tr>
  <tr>
    <th style="width: 7%">编号</th>
    <th style="width: 60%">二级分类名</th>
    <th style="width: 20%">所属一级分类名</th>
    <th style="width: 7%">编辑</th>
    <th style="width: 6%">删除</th>
  </tr>
  <c:forEach items="${categorysecondQueryVo.list}" varStatus="s" var="cs">
  	<tr align="center">
   		<td >${s.count+categorysecondQueryVo.begin}</td>
   		<td>${cs.csname}</td>
   		<c:forEach items="${cList}" var="c">
   			<c:if test="${c.cid eq cs.cid}">
   				<td>${c.cname}</td>
   			</c:if>
   		 </c:forEach>
   		<td><a href="${pageContext.request.contextPath}/categorysecond/updatePage?csid=${cs.csid}"><img src="${pageContext.request.contextPath}/image/i_edit.gif"/></a></td>
   		<td><a href="${pageContext.request.contextPath}/categorysecond/delete?csid=${cs.csid}"><img src="${pageContext.request.contextPath}/image/i_del.gif"/></a></td>
 	</tr>
  </c:forEach>
  <tr align="center">
  	<td colspan="5">
  		<a href="${pageContext.request.contextPath}/categorysecond/findAll?page=1">首页</a>&nbsp;
  		<c:if test="${categorysecondQueryVo.newpage > 1}">
  			<a href="${pageContext.request.contextPath}/categorysecond/findAll?page=${categorysecondQueryVo.newpage-1}">上一页</a>&nbsp;
  		</c:if>
  		<c:if test="${categorysecondQueryVo.newpage <= 1}">
  			<a href="${pageContext.request.contextPath}/categorysecond/findAll?page=1">上一页</a>&nbsp;
  		</c:if>
  		${categorysecondQueryVo.newpage}/${categorysecondQueryVo.pagecount}&nbsp;
  		<c:if test="${categorysecondQueryVo.newpage < categorysecondQueryVo.pagecount}">
  			<a href="${pageContext.request.contextPath}/categorysecond/findAll?page=${categorysecondQueryVo.newpage+1}">下一页</a>&nbsp;
  		</c:if>
  		<c:if test="${categorysecondQueryVo.newpage >= categorysecondQueryVo.pagecount}">
  			<a href="${pageContext.request.contextPath}/categorysecond/findAll?page=${categorysecondQueryVo.pagecount}">下一页</a>&nbsp;
  		</c:if>
  		<a href="${pageContext.request.contextPath}/categorysecond/findAll?page=${categorysecondQueryVo.pagecount}">尾页</a></td>
  </tr>
</table>
</body>
</html>
