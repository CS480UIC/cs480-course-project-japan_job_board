<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Adding New Job</title>
    
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
  <h1>Adding New Job</h1>

<p style="color: red; font-weight: 900">${msg }</p>
<form action="<c:url value='/controls?action=newJ'/>" method="post">
	<input type="hidden" name="method" value="regist"/>
	Job Title    :<input type="text" name="job_title" value="${form.username }"/>
	<span style="color: red; font-weight: 900">${errors.username }</span>
	<br/>
	Job Location：<input type="text" name="job_location" value="${form.password }"/>
	<span style="color: red; font-weight: 900">${errors.password }</span>
	<br/>
	Job Salary	：<input type="text" name="job_salary" value="${form.first_name }"/>
	<span style="color: red; font-weight: 900">${errors.first_name }</span>
	<br/>
	Job Language	：<input type="text" name="job_language" value="${form.last_name }"/>
	<span style="color: red; font-weight: 900">${errors.last_name }</span>
	<br/>
	Job Company	：<input type="text" name="job_company" value="${form.is_admin }"/>
	<span style="color: red; font-weight: 900">${errors.is_admin }</span>
	<br/>
	Job Description	：<input type="text" name="job_description" value="${form.need_visa_sponsor }"/>
	<span style="color: red; font-weight: 900">${errors.need_visa_sponsor }</span>
	<br/>
	Job Residence	：<input type="text" name="job_residence" value="${form.language_proficiency }"/>
	<span style="color: red; font-weight: 900">${errors.language_proficiency }</span>
	Job Employment	：<input type="text" name="job_employment" value="${form.language_proficiency }"/>
	<span style="color: red; font-weight: 900">${errors.language_proficiency }</span>
	<input type="submit" value="Register"/>
</form>
  </body>
</html>
