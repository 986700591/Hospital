<%--
  Created by IntelliJ IDEA.
  User: Lyr
  Date: 2020/11/8
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%
    pageContext.setAttribute("paths", request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:forward page="/toindex"></jsp:forward>
<a href="${paths}/toindex">首页</a>
</body>
</html>
