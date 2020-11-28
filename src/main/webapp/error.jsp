<%--
  Created by IntelliJ IDEA.
  User: Ming
  Date: 2017/11/17
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("paths", request.getContextPath());
%>
<html>
<head>
    <title>错误页面</title>
</head>
<body>
 错误信息:　${msg}
</body>
</html>
