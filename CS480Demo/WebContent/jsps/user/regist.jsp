<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Register</title>
    
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
  <h1>Register</h1>
  <%--
  1. 显示errors --> 字段错误
  2. 显示异常错误
  3. 回显
   --%>
<p style="color: red; font-weight: 900">${msg }</p>
<form action="<c:url value='/UserServletRegister'/>" method="post">
	<input type="hidden" name="method" value="regist"/>
	User    :<input type="text" name="username" value="${form.username }"/>
	<span style="color: red; font-weight: 900">${errors.username }</span>
	<br/>
	Password：<input type="password" name="password" value="${form.password }"/>
	<span style="color: red; font-weight: 900">${errors.password }</span>
	<br/>
	First Name	：<input type="text" name="first_name" value="${form.first_name }"/>
	<span style="color: red; font-weight: 900">${errors.first_name }</span>
	<br/>
	Last Name	：<input type="text" name="last_name" value="${form.last_name }"/>
	<span style="color: red; font-weight: 900">${errors.last_name }</span>
	<br/>
	Is Admin?	：<input type="text" name="is_admin" value="${form.is_admin }"/>
	<span style="color: red; font-weight: 900">${errors.is_admin }</span>
	<br/>
	Need Visa Sponsor?	：<input type="text" name="need_visa_sponsor" value="${form.need_visa_sponsor }"/>
	<span style="color: red; font-weight: 900">${errors.need_visa_sponsor }</span>
	<br/>
	Language Proficiency	：<input type="text" name="language_proficiency" value="${form.language_proficiency }"/>
	<span style="color: red; font-weight: 900">${errors.language_proficiency }</span>
	<input type="submit" value="Register"/>
</form>
  </body>
</html>
