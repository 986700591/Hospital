<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>投票项管理</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body id="page">
<h2>投票信息</h2>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
   	<th>投票名称</th>
   	<td colspan="3">${voteitemCustom.vname}</td>
  </tr>
  <tr>
   	<th>投票内容</th>
   	<td colspan="3">${voteitemCustom.vintro}</td>
  </tr>
  <tr>
   	<th>投票人数</th>
   	<td colspan="3">${voteitemCustom.total}</td>
  </tr>
  <tr>
   	<th>投票时间</th>
   	<td colspan="3">
   		<c:if test="${ now < voteitemCustom.overtime}">
   			<fmt:formatDate value="${voteitemCustom.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>
	   		&nbsp;至&nbsp;
	   		<fmt:formatDate value="${voteitemCustom.overtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
   		</c:if>
   		<c:if test="${ now >= voteitemCustom.overtime}">
   			<font color="red">投票结束</font>
   		</c:if>
   	</td>
  </tr>
   <tr>
   	<th>所属二级分类</th>
   	<c:forEach items="${csList}" var="cs">
   		<c:if test="${cs.csid == voteitemCustom.csid}">
   			<td colspan="3">${cs.csname}</td>
   		</c:if>
   	</c:forEach>
   </tr>
   <tr align="center">
   		<td colspan="4"><b>投票选项</b></td>
   </tr>
   <tr align="center">
   		<th>序号</th>
   		<th>选项内容</th>
   		<th>投票人数</th>
   		<th>投票占比</th>
   </tr>
   <c:forEach items="${voteitemCustom.options}" var="op" varStatus="s">
   		<tr align="center">
	   		<td>${s.count}</td>
	   		<td>${op.opname}</td>
	   		<td>${op.subtotal}</td>
	   		<c:if test="${voteitemCustom.total != 0}">
				<td style="width:10%;"><fmt:formatNumber type="number" value="${op.subtotal/voteitemCustom.total * 100}" maxFractionDigits="2"/>%</td>
			</c:if>
			<c:if test="${voteitemCustom.total == 0}">
				<td style="width:10%;">无</td>
			</c:if>
	   </tr>
   </c:forEach>
   <tr>
   		<td colspan="4"><button style="width: 100%;" onclick="history.go(-1)">返回</button></td>
   </tr>
</table>
</body>
</html>
