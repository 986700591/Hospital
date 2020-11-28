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
<h2>投票项信息</h2>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th style="width: 7%">编号</th>
    <th style="width: 10%">投票名称</th>
    <th style="width: 30%">投票内容</th>
    <th style="width: 6%">投票人数</th>
    <th style="width: 12%">开始时间</th>
    <th style="width: 12%">结束时间</th>
    <th style="width: 10%">所属二级分类</th>
    <th style="width: 7%">查看详情</th>
    <th style="width: 6%">删除</th>
  </tr>
	 <c:if test="${voteitemQueryVo.list != null && fn:length(voteitemQueryVo.list)>0}">
	 	<c:forEach items="${voteitemQueryVo.list}" varStatus="s" var="v">
	  	<tr align="center">
	   		<td>${s.count+voteitemQueryVo.begin}</td>
	   		<td>${v.vname}</td>
	   		<td>${v.vintro}</td>
	   		<td>${v.total}</td>
	   		<td><fmt:formatDate value="${v.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	   		<td><fmt:formatDate value="${v.overtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	   		<c:forEach items="${csList}" var="cs">
	   			<c:if test="${cs.csid == v.csid}">
	   				<td>${cs.csname}</td>
	   			</c:if>
	   		</c:forEach>
	   		<td><a href="${pageContext.request.contextPath}/voteItem/viewTheVote?vid=${v.vid}"><img src="${pageContext.request.contextPath}/image/See.png"/></a></td>
	   		<td><a href="${pageContext.request.contextPath}/voteItem/deleteVote?vid=${v.vid}&page=${voteitemQueryVo.newpage}"><img src="${pageContext.request.contextPath}/image/i_del.gif"/></a></td>
	 	</tr>
	  </c:forEach>
	 </c:if>
  <tr align="center">
  	<c:if test="${voteitemQueryVo.pagemark == 7 }">
  		<td colspan="9">
	  		<a href="${pageContext.request.contextPath}/voteItem/findVoteByOverdue?page=1">首页</a>&nbsp;
	  		<c:if test="${voteitemQueryVo.newpage > 1}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByOverdue?page=${voteitemQueryVo.newpage-1}">上一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.newpage <= 1}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByOverdue?page=1">上一页</a>&nbsp;
	  		</c:if>
	  		${voteitemQueryVo.newpage}/${voteitemQueryVo.pagecount}&nbsp;
	  		<c:if test="${voteitemQueryVo.newpage < voteitemQueryVo.pagecount}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByOverdue?page=${voteitemQueryVo.newpage+1}">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.newpage >= voteitemQueryVo.pagecount && voteitemQueryVo.pagecount != 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByOverdue?page=${voteitemQueryVo.pagecount}">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.newpage >= voteitemQueryVo.pagecount && voteitemQueryVo.pagecount == 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByOverdue?page=1">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.pagecount == 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByOverdue?page=1">尾页</a>
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.pagecount != 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByOverdue?page=${voteitemQueryVo.pagecount}">尾页</a>
	  		</c:if>
	  	</td>
  	</c:if>
  </tr>
</table>
</body>
</html>
