<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="">
    
    <title>Job Management</title>
    
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
    <h1 style="text-align: center;">Job Management</h1>
    <br>
    <div style="text-align:center">
    	<a href="<c:url value='/findAllJob'/>" target="body">List All Jobs</a>&nbsp;&nbsp;
    	<a href="<c:url value='/jsps/newJob.jsp'/>" target="_parent">Add New Job</a>
    </div>
 
    
  </body>
</html>
