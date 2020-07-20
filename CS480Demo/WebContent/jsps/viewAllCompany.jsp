<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="">
    
    <title>Company Management</title>
    
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
  
  <body style='background: white;'>
    <h1 style="text-align: center;">Company Management</h1>
    <br>
    <div style="text-align:center">
    	<a href="<c:url value='/findAllCompany'/>" target="body">List All Companies</a>&nbsp;&nbsp;
    	<a href="<c:url value='/jsps/newCompany.jsp'/>" target="_parent">Add New Company</a>
    </div>
 
    
  </body>
</html>
