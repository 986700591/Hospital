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
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<form method="post" action="${pageContext.request.contextPath}/category/addCategory">
	  <tr>
	    <th>一级分类名称 :</th>
	    <td><input type="text" name="cname"/></td>
	  </tr>
	  <tr align="center">
	  	<td colspan="2">
	  		<button type="reset" value="重置" style="width: 120px; height: 30px;">重置</button>
	  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  		<button type="submit" value="确定" style="width: 120px; height: 30px;">保存</button>
	  	</td>
	  </tr>
	</form>
</table>
</body>
</html>
