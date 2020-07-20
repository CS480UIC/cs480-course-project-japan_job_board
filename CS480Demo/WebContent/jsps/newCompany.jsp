<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Adding New Company</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <h1>Adding New Company</h1>

<p style="color: red; font-weight: 900">${msg }</p>
<form action="<c:url value='/controls?action=newC'/>" method="post">
	<input type="hidden" name="method" value="regist"/>
	Username    :<input type="text" name="username" value="${form.username }"/>
	<span style="color: red; font-weight: 900">${errors.username }</span>
	<br/>
	Password：<input type="password" name="password" value="${form.password }"/>
	<span style="color: red; font-weight: 900">${errors.password }</span>
	<br/>
	Company Name	：<input type="text" name="company_name" value="${form.company_name }"/>
	<span style="color: red; font-weight: 900">${errors.first_name }</span>
	<br/>
	Company Location	：<input type="text" name="company_location" value="${form.company_location }"/>
	<span style="color: red; font-weight: 900">${errors.last_name }</span>
	<br/>
	Company Bio	：<input type="text" name="company_bio" value="${form.company_bio }"/>
	<br />
	<span style="color: red; font-weight: 900">${errors.is_admin }</span>
	Company Size ：<input type="text" name="company_size" value="${form.company_bio }"/>
	<br />
	<span style="color: red; font-weight: 900">${errors.is_admin }</span>

	<input type="submit" value="Register"/>
</form>
  </body>
</html>
