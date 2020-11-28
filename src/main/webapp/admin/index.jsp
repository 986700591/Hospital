<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>管理界面</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/js.js"></script>
</head>

<body id="index">
<h1>药品管理系统</h1>
<ul id="globalNav">
	<li><span id="siteInfo"><a href="javascript:void(0);">首页</a></span></li>
	<li><a href="#">用户管理</a>
		<ul>
			<li><span id="userManagement"><a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户管理</a></span></li>
		</ul>
	</li>
	<li><a >一级分类管理</a>
		<ul>
			<li><span id="categoryManagement"><a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一级分类管理</a></span></li>
		</ul>
	</li>
	<li><a href="#">二级分类管理</a>
		<ul>
			<li><span id="categorysecondManagement"><a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二级分类管理</a></span></li>
		</ul>
	</li>
	<li><a href="#">投票项管理</a>
		<ul>
			<li><span id="findVoteByDate"><a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;按日期查找投票项</a></span></li>
			<li><span id="findVoteByUnexpired"><a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未过期投票项</a></span></li>
			<li><span id="findVoteByOverdue"><a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已过期投票项</a></span></li>
		</ul>
	</li>
	<li><span id="dateBaseSave"><a href="javascript:void(0);">数据库备份</a></span></li>
	<li><a href="${pageContext.request.contextPath}/admin/logout">退出</a></li>
</ul>
<iframe id="frameBord" name="frameBord" frameborder="0" width="100%" height="100%" src="siteInfo"></iframe>
</body>
</html>
