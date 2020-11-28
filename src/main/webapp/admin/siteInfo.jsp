<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理界面</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body id="page">
<h2>站点信息</h2>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 	<c:if test="${voteitemQueryVo.list == null || fn:length(voteitemQueryVo.list)<=0}">
	  <tr>
	    <th>站点名称：</th>
	    <td>网上投票系统</td>
	  </tr>
	  <tr>
	    <th>投票项目数：</th>
	    <td><strong>${votecount}</strong>项投票包含在<strong>${cscount}</strong>个二级分类中</td>
	  </tr>
	  <tr>
	    <th>今日发布：</th>
	    <td><strong>${releasedTodayCount}</strong>项</td>
	  </tr>
	  <tr>
	    <th>搜索投票项：</th>
	    <form method="post" action="${pageContext.request.contextPath}/voteItem/voteSearch?page=1">
	    	<td><input type="text" name="search"/>
	    	<input  type="submit" class="bt" value="搜索" /></td>
	    </form>
	  </tr>
   </c:if>
   <c:if test="${voteitemQueryVo.list != null && fn:length(voteitemQueryVo.list)>0}">
   		<tr>
		    <th colspan="2">站点名称：</th>
		    <td colspan="7">网上投票系统</td>
		</tr>
		<tr>
		    <th colspan="2">投票项目数：</th>
		    <td colspan="7"><strong>${votecount}</strong>项投票包含在<strong>${cscount}</strong>个二级分类中</td>
		</tr>
		<tr>
		    <th colspan="2">今日发布：</th>
		    <td colspan="7"><strong>${releasedTodayCount}</strong>项</td>
		</tr>
		<tr>
		    <th colspan="2">搜索投票项：</th>
		    <form method="post" action="${pageContext.request.contextPath}/voteItem/voteSearch?page=1">
		    	<td colspan="7"><input type="text" name="search"/>
		    	<input  type="submit" class="bt" value="搜索" /></td>
		    </form>
		</tr>
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
		   		<td><a href="${pageContext.request.contextPath}/voteItem/deleteVote?vid=${v.vid}&page=${voteitemQueryVo.newpage}&startdate=<fmt:formatDate value="${voteitemQueryVo.startdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&overdate=<fmt:formatDate value="${voteitemQueryVo.overdate}" pattern="yyyy-MM-dd HH:mm:ss"/>"><img src="${pageContext.request.contextPath}/image/i_del.gif"/></a></td>
			 </tr>
		  </c:forEach>
	  	  <tr align="center">
	  		<td colspan="9">
		  		<a href="${pageContext.request.contextPath}/voteItem/voteSearch?page=1&search=${voteitemQueryVo.search}">首页</a>&nbsp;
		  		<c:if test="${voteitemQueryVo.newpage > 1}">
		  			<a href="${pageContext.request.contextPath}/voteItem/voteSearch?page=${voteitemQueryVo.newpage-1}&search=${voteitemQueryVo.search}">上一页</a>&nbsp;
		  		</c:if>
		  		<c:if test="${voteitemQueryVo.newpage <= 1}">
		  			<a href="${pageContext.request.contextPath}/voteItem/voteSearch?page=1&search=${voteitemQueryVo.search}">上一页</a>&nbsp;
		  		</c:if>
		  		${voteitemQueryVo.newpage}/${voteitemQueryVo.pagecount}&nbsp;
		  		<c:if test="${voteitemQueryVo.newpage < voteitemQueryVo.pagecount}">
		  			<a href="${pageContext.request.contextPath}/voteItem/voteSearch?page=${voteitemQueryVo.newpage+1}&search=${voteitemQueryVo.search}">下一页</a>&nbsp;
		  		</c:if>
		  		<c:if test="${voteitemQueryVo.newpage >= voteitemQueryVo.pagecount && voteitemQueryVo.pagecount != 0}">
		  			<a href="${pageContext.request.contextPath}/voteItem/voteSearch?page=${voteitemQueryVo.pagecount}&search=${voteitemQueryVo.search}">下一页</a>&nbsp;
		  		</c:if>
		  		<c:if test="${voteitemQueryVo.newpage >= voteitemQueryVo.pagecount && voteitemQueryVo.pagecount == 0}">
		  			<a href="${pageContext.request.contextPath}/voteItem/voteSearch?page=1&search=${voteitemQueryVo.search}">下一页</a>&nbsp;
		  		</c:if>
		  		<c:if test="${voteitemQueryVo.pagecount == 0}">
		  			<a href="${pageContext.request.contextPath}/voteItem/voteSearch?page=1&search=${voteitemQueryVo.search}">尾页</a>
		  		</c:if>
		  		<c:if test="${voteitemQueryVo.pagecount != 0}">
		  			<a href="${pageContext.request.contextPath}/voteItem/voteSearch?page=${voteitemQueryVo.pagecount}&search=${voteitemQueryVo.search}">尾页</a>
		  		</c:if>
		  	</td>
	  	 </tr>
	</c:if>	
	  	
</table>
</body>
</html>
