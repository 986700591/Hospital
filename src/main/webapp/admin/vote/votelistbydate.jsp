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
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
		var startdate_year = ${startdate.year+1900};
		var startdate_month = ${startdate.month+1};
		var startdate_day = ${startdate.date};
		var overdate_year = ${overdate.year+1900};
		var overdate_month = ${overdate.month+1};
		var overdate_day = ${overdate.date};
		//初始化开始时间月份
		for(var i = 1;i <= 12;i++){
			if(i == startdate_month){
				$("#month1").append("<option value="+i+" selected='selected'>"+i+"月</option");
			}else{
				$("#month1").append("<option value="+i+" >"+i+"月</option");
			}
		}
		//初始化结束时间月份
		for(var i = 1;i <= 12;i++){
			if(i == overdate_month){
				$("#month2").append("<option value="+i+" selected='selected'>"+i+"月</option");
			}else{
				$("#month2").append("<option value="+i+" >"+i+"月</option");
			}
		}
		//初始化开始时间日期
		switch(startdate_month){
			case 1:case 3:case 5:case 7:case 8:case 10:case 12:
				for(var i = 1;i <= 31;i++){
					if(i == startdate_day){
						$("#day1").append("<option value="+i+" selected='selected'>"+i+"日</option");
					}else{
						$("#day1").append("<option value="+i+" >"+i+"日</option");
					}
				}
				break;
			
			case 4:case 6:case 9:case 11:
				for(var i = 1;i <= 30;i++){
					if(i == startdate_day){
						$("#day1").append("<option value="+i+" selected='selected'>"+i+"日</option");
					}else{
						$("#day1").append("<option value="+i+" >"+i+"日</option");
					}
				}
				break;
			
			case 2:
				if(startdate_year % 4 == 0){
					for(var i = 1;i <= 29;i++){
						if(i == startdate_day){
							$("#day1").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day1").append("<option value="+i+" >"+i+"日</option");
						}
					}
				}else{
					for(var i = 1;i <= 28;i++){
						if(i == startdate_day){
							$("#day1").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day1").append("<option value="+i+" >"+i+"日</option");
						}
					}
				}
				break;
		}
		
		//初始化结束时间日期
		switch(overdate_month){
			case 1:case 3:case 5:case 7:case 8:case 10:case 12:
				for(var i = 1;i <= 31;i++){
					if(i == overdate_day){
						$("#day2").append("<option value="+i+" selected='selected'>"+i+"日</option");
					}else{
						$("#day2").append("<option value="+i+" >"+i+"日</option");
					}
				}
				break;
			
			case 4:case 6:case 9:case 11:
				for(var i = 1;i <= 30;i++){
					if(i == overdate_day){
						$("#day2").append("<option value="+i+" selected='selected'>"+i+"日</option");
					}else{
						$("#day2").append("<option value="+i+" >"+i+"日</option");
					}
				}
				break;
			
			case 2:
				if(overdate_year % 4 == 0){
					for(var i = 1;i <= 29;i++){
						if(i == overdate_day){
							$("#day2").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day2").append("<option value="+i+" >"+i+"日</option");
						}
					}
				}else{
					for(var i = 1;i <= 28;i++){
						if(i == overdate_day){
							$("#day2").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day2").append("<option value="+i+" >"+i+"日</option");
						}
					}
				}
				break;
		}
		
		//开始时间年份变更,计算是否为2月份 ,是则判断是否闰年,调整2月份总天数
		$("#year1").change(function(){
			if($("#month1").val() == 2){
				var day1 = $("#day1").val();
				$("#day1").children("option").remove();
				if($("#year1").val() % 4 == 0 ){
					for(var i = 1;i <= 29;i++){
						if(i == day1){
							$("#day1").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day1").append("<option value="+i+" >"+i+"日</option");
						}
					}
				}else{
					for(var i = 1;i <= 28;i++){
						if(i == day1){
							$("#day1").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day1").append("<option value="+i+" >"+i+"日</option");
						}
					}
				}
				
			}
		});
		
		
		//开始时间月份变更
		$("#month1").change(function(){
			var day1 = $("#day1").val();
			var month1 = $("#month1").val();
			$("#day1").children("option").remove();
			switch(month1){
				case '1': case '3': case '5': case '7': case '8': case '10': case '12':
					for(var i = 1;i <= 31;i++){
						if(i == day1){
							$("#day1").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day1").append("<option value="+i+" >"+i+"日</option");
						}
					}
					break;
				
				case '4':case '6':case '9':case '11':
					for(var i = 1;i <= 30;i++){
						if(i == day1){
							$("#day1").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day1").append("<option value="+i+" >"+i+"日</option");
						}
					}
					break;
				
				case '2':
					if($("#year1").val() % 4 == 0){
						for(var i = 1;i <= 29;i++){
							if(i == day1){
								$("#day1").append("<option value="+i+" selected='selected'>"+i+"日</option");
							}else{
								$("#day1").append("<option value="+i+" >"+i+"日</option");
							}
						}
					}else{
						for(var i = 1;i <= 28;i++){
							if(i == day1){
								$("#day1").append("<option value="+i+" selected='selected'>"+i+"日</option");
							}else{
								$("#day1").append("<option value="+i+" >"+i+"日</option");
							}
						}
					}
					break;
				default:
					
					break;
			}
		});
		
		//结束时间年份变更,计算是否为2月份 ,是则判断是否闰年,调整2月份总天数
		$("#year2").change(function(){
			if($("#month2").val() == 2){
				var day2 = $("#day2").val();
				$("#day2").children("option").remove();
				if($("#year2").val() % 4 == 0 ){
					for(var i = 1;i <= 29;i++){
						if(i == day2){
							$("#day2").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day2").append("<option value="+i+" >"+i+"日</option");
						}
					}
				}else{
					for(var i = 1;i <= 28;i++){
						if(i == day2){
							$("#day2").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day2").append("<option value="+i+" >"+i+"日</option");
						}
					}
				}
				
			}
		});
		
		
		//结束时间月份变更
		$("#month2").change(function(){
			var month2 = $("#month2").val();
			var day2 = $("#day2").val();
			$("#day2").children("option").remove();
			switch(month2){
				case '1': case '3': case '5': case '7': case '8': case '10': case '12':
					for(var i = 1;i <= 31;i++){
						if(i == day2){
							$("#day2").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day2").append("<option value="+i+" >"+i+"日</option");
						}
					}
					break;
				
				case '4':case '6':case '9':case '11':
					for(var i = 1;i <= 30;i++){
						if(i == day2){
							$("#day2").append("<option value="+i+" selected='selected'>"+i+"日</option");
						}else{
							$("#day2").append("<option value="+i+" >"+i+"日</option");
						}
					}
					break;
				
				case '2':
					if($("#year2").val() % 4 == 0){
						for(var i = 1;i <= 29;i++){
							if(i == day2){
								$("#day2").append("<option value="+i+" selected='selected'>"+i+"日</option");
							}else{
								$("#day2").append("<option value="+i+" >"+i+"日</option");
							}
						}
					}else{
						for(var i = 1;i <= 28;i++){
							if(i == day2){
								$("#day2").append("<option value="+i+" selected='selected'>"+i+"日</option");
							}else{
								$("#day2").append("<option value="+i+" >"+i+"日</option");
							}
						}
					}
					break;
			}
		});
		//防止多次点击
		flag = 0;
		//提交搜索时间间隔
		$("#searchbt").click(function(){
			flag ++;
			if(flag == 1){
				//整理提交时间字符串格式
				var a = $("#month1").val();
				var b = $("#day1").val();
				var c = $("#month2").val();
				var d = $("#day2").val();
				if($("#month1").val()<10){
					a = "0" + a;
				}
				if($("#day1").val()<10){
					b = "0" + b;
				}
				if($("#month2").val()<10){
					c = "0" + c;
				}
				if($("#day2").val()<10){
					d = "0" + d;
				}
				var startdate = $("#year1").val()+"-"+a+"-"+b+" 00:00:00";
				var overdate = $("#year2").val()+"-"+c+"-"+d+" 23:59:59";
				$("#dateform").append("<input type='hidden' id='aad' value='"+startdate+"' name='startdate'/>");
				$("#dateform").append("<input type='hidden' id='abd' value='"+overdate+"' name='overdate'/>");
				$("#dateform").submit(); 
			}
		});
		
	});
</script>
</head>
<body id="page">
<h2>投票项信息</h2>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<th>
  		日期选定：
  	</th>
	  	<th colspan="8">
	  		<form method="post" action="${pageContext.request.contextPath}/voteItem/findVoteByDate?page=1" id="dateform">
	  		<select name="year1" id="year1">
	  			<c:forEach begin="2000" end="2020" step="1" var="y">
	  				<c:if test="${startdate.year + 1900 == y}">
	  					<option value="${y}" selected="selected">${y}年</option>
	  				</c:if>
	  				<c:if test="${startdate.year + 1900 != y}">
	  					<option value="${y}">${y}年</option>
	  				</c:if>
	  			</c:forEach>
	  		</select>
	  		<select name="month1" id="month1">
	  		</select>
	  		<select name="day1" id="day1">
	  		</select>
	  		&nbsp;&nbsp;至&nbsp;&nbsp;
	  		<select name="year2" id="year2">
	  			<c:forEach begin="2020" end="2020" step="1" var="y">
	  				<c:if test="${overdate.year + 1900 == y}">
	  					<option value="${y}" selected="selected">${y}年</option>
	  				</c:if>
	  				<c:if test="${overdate.year + 1900 != y}">
	  					<option value="${y}">${y}年</option>
	  				</c:if>
	  			</c:forEach>
	  		</select>
	  		<select name="month2" id="month2">
	  		</select>
	  		<select name="day2" id="day2">
	  		</select>
	  		<button type="button" id="searchbt">查找</button>
	  	</form>
	  	</th>
  	
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
	   		<td><a href="${pageContext.request.contextPath}/voteItem/deleteVote?vid=${v.vid}&page=${voteitemQueryVo.newpage}&startdate=<fmt:formatDate value="${voteitemQueryVo.startdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&overdate=<fmt:formatDate value="${voteitemQueryVo.overdate}" pattern="yyyy-MM-dd HH:mm:ss"/>"><img src="${pageContext.request.contextPath}/image/i_del.gif"/></a></td>
	 	</tr>
	  </c:forEach>
	 </c:if>
  <tr align="center">
  	<c:if test="${voteitemQueryVo.pagemark == 5 }">
  		<td colspan="9">
	  		<a href="${pageContext.request.contextPath}/voteItem/findVoteByDatePage?page=1">首页</a>&nbsp;
	  		<c:if test="${voteitemQueryVo.newpage > 1}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDatePage?page=${voteitemQueryVo.newpage-1}">上一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.newpage <= 1}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDatePage?page=1">上一页</a>&nbsp;
	  		</c:if>
	  		${voteitemQueryVo.newpage}/${voteitemQueryVo.pagecount}&nbsp;
	  		<c:if test="${voteitemQueryVo.newpage < voteitemQueryVo.pagecount}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDatePage?page=${voteitemQueryVo.newpage+1}">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.newpage >= voteitemQueryVo.pagecount && voteitemQueryVo.pagecount != 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDatePage?page=${voteitemQueryVo.pagecount}">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.newpage >= voteitemQueryVo.pagecount && voteitemQueryVo.pagecount == 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDatePage?page=1">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.pagecount == 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDatePage?page=1">尾页</a>
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.pagecount != 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDatePage?page=${voteitemQueryVo.pagecount}">尾页</a>
	  		</c:if>
	  	</td>
  	</c:if>
  	
  	<c:if test="${voteitemQueryVo.pagemark == 6 }">
  		<td colspan="9">
	  		<a href="${pageContext.request.contextPath}/voteItem/findVoteByDate?page=1&startdate=<fmt:formatDate value="${voteitemQueryVo.startdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&overdate=<fmt:formatDate value="${voteitemQueryVo.overdate}" pattern="yyyy-MM-dd HH:mm:ss"/>">首页</a>&nbsp;
	  		<c:if test="${voteitemQueryVo.newpage > 1}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDate?page=${voteitemQueryVo.newpage-1}&startdate=<fmt:formatDate value="${voteitemQueryVo.startdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&overdate=<fmt:formatDate value="${voteitemQueryVo.overdate}" pattern="yyyy-MM-dd HH:mm:ss"/>">上一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.newpage <= 1}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDate?page=1&startdate=<fmt:formatDate value="${voteitemQueryVo.startdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&overdate=<fmt:formatDate value="${voteitemQueryVo.overdate}" pattern="yyyy-MM-dd HH:mm:ss"/>">上一页</a>&nbsp;
	  		</c:if>
	  		${voteitemQueryVo.newpage}/${voteitemQueryVo.pagecount}&nbsp;
	  		<c:if test="${voteitemQueryVo.newpage < voteitemQueryVo.pagecount}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDate?page=${voteitemQueryVo.newpage + 1}&startdate=<fmt:formatDate value="${voteitemQueryVo.startdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&overdate=<fmt:formatDate value="${voteitemQueryVo.overdate}" pattern="yyyy-MM-dd HH:mm:ss"/>">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.newpage >= voteitemQueryVo.pagecount && voteitemQueryVo.pagecount != 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDate?page=${voteitemQueryVo.pagecount}&startdate=<fmt:formatDate value="${voteitemQueryVo.startdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&overdate=<fmt:formatDate value="${voteitemQueryVo.overdate}" pattern="yyyy-MM-dd HH:mm:ss"/>">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.newpage >= voteitemQueryVo.pagecount && voteitemQueryVo.pagecount == 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDate?page=1&startdate=<fmt:formatDate value="${voteitemQueryVo.startdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&overdate=<fmt:formatDate value="${voteitemQueryVo.overdate}" pattern="yyyy-MM-dd HH:mm:ss"/>">下一页</a>&nbsp;
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.pagecount != 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDate?page=${voteitemQueryVo.pagecount}&startdate=<fmt:formatDate value="${voteitemQueryVo.startdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&overdate=<fmt:formatDate value="${voteitemQueryVo.overdate}" pattern="yyyy-MM-dd HH:mm:ss"/>">尾页</a>
	  		</c:if>
	  		<c:if test="${voteitemQueryVo.pagecount == 0}">
	  			<a href="${pageContext.request.contextPath}/voteItem/findVoteByDate?page=1&startdate=<fmt:formatDate value="${voteitemQueryVo.startdate}" pattern="yyyy-MM-dd HH:mm:ss"/>&overdate=<fmt:formatDate value="${voteitemQueryVo.overdate}" pattern="yyyy-MM-dd HH:mm:ss"/>">尾页</a>
	  		</c:if>
  		</td>
  	</c:if>
  	
  </tr>
</table>
</body>
</html>
