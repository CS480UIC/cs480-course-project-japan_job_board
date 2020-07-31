<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Updating Job</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!-- CSS only -->
	<link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	
	<style>
		a, a:hover{
  			color:#333
		}
		input {
  width: 100%;
}

textarea {
  width: 100%;
}

form {
  width: 100%;
}
	</style>
	
  </head>
  
  <body style="background-color: rgb(231, 233, 235);">
  <jsp:include page="/jsps/top.jsp"/>
  
  <% 
  String jobid=request.getParameter("jobid");
  pageContext.setAttribute("jobid", jobid);

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connect = DriverManager
	          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
		              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
  String sql = "select * from tb_job where job_id=?";
  PreparedStatement preparestatement = connect.prepareStatement(sql); 
  preparestatement.setString(1,jobid);
  ResultSet resultSet = preparestatement.executeQuery();
  
  if(!resultSet.next()) {
      out.println("Sorry, could not find that ");
  } else {}
  %>
  
  <h1>Updating Job: ${jobid }</h1>
  
<p style="color: red; font-weight: 900">${msg }</p>
<form action="<c:url value='/controls?action=update&oldUsername=${username }'/>" method="post">
	
	<input type="hidden" name="method" value="regist"/>
	Job Title   :<input type="text" name="username" value="<%= resultSet.getString(2) %>"/>
	<span style="color: red; font-weight: 900">${errors.username }</span>
	<br/>
	Job Location：<input type="text" name="password" value="<%= resultSet.getString(3) %>"/>
	<span style="color: red; font-weight: 900">${errors.password }</span>
	<br/>
	job Salary	：<input type="text" name="first_name" value="<%= resultSet.getString(4) %>"/>
	<span style="color: red; font-weight: 900">${errors.first_name }</span>
	<br/>
	Job Language	：<input type="text" name="last_name" value="<%= resultSet.getString(5) %>"/>
	<span style="color: red; font-weight: 900">${errors.last_name }</span>
	<br/>
	Job Company	：<input type="text" name="is_admin" value="<%= resultSet.getString(6) %>"/>
	<span style="color: red; font-weight: 900">${errors.is_admin }</span>
	<br/>
	Job Description	：<input type="text" name="need_visa_sponsor" value="<%= resultSet.getString(7) %>"/>
	<span style="color: red; font-weight: 900">${errors.need_visa_sponsor }</span>
	<br/>
	Job Residence	：<input type="text" name="language_proficiency" value="<%= resultSet.getString(8) %>"/>
	<span style="color: red; font-weight: 900">${errors.language_proficiency }</span>
		<br/>
	Job Employment	：<input type="text" name="language_proficiency" value="<%= resultSet.getString(9) %>"/>
	<span style="color: red; font-weight: 900">${errors.language_proficiency }</span>
	<input type="submit" value="Update"/>
</form>
  </body>
</html>
