<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Updating User</title>
    
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
  
  <% 
  String username=request.getParameter("username");
  pageContext.setAttribute("username", username);

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connect = DriverManager
	          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
		              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
  String sql = "select * from tb_user where username=?";
  PreparedStatement preparestatement = connect.prepareStatement(sql); 
  preparestatement.setString(1,username);
  ResultSet resultSet = preparestatement.executeQuery();
  
  if(!resultSet.next()) {
      out.println("Sorry, could not find that ");
  } else {}
  %>
  
  <h1>Updating User: ${username }</h1>
  
<p style="color: red; font-weight: 900">${msg }</p>
<form action="<c:url value='/controls?action=update&oldUsername=${username }'/>" method="post">
	
	<input type="hidden" name="method" value="regist"/>
	Username   :<input type="text" name="username" value="<%= resultSet.getString(1) %>"/>
	<span style="color: red; font-weight: 900">${errors.username }</span>
	<br/>
	Password：<input type="password" name="password" value="<%= resultSet.getString(2) %>"/>
	<span style="color: red; font-weight: 900">${errors.password }</span>
	<br/>
	First Name	：<input type="text" name="first_name" value="<%= resultSet.getString(3) %>"/>
	<span style="color: red; font-weight: 900">${errors.first_name }</span>
	<br/>
	Last Name	：<input type="text" name="last_name" value="<%= resultSet.getString(4) %>"/>
	<span style="color: red; font-weight: 900">${errors.last_name }</span>
	<br/>
	Is Admin?	：<input type="text" name="is_admin" value="<%= resultSet.getString(5) %>"/>
	<span style="color: red; font-weight: 900">${errors.is_admin }</span>
	<br/>
	Need Visa Sponsor?	：<input type="text" name="need_visa_sponsor" value="<%= resultSet.getString(6) %>"/>
	<span style="color: red; font-weight: 900">${errors.need_visa_sponsor }</span>
	<br/>
	Language Proficiency	：<input type="text" name="language_proficiency" value="<%= resultSet.getString(7) %>"/>
	<span style="color: red; font-weight: 900">${errors.language_proficiency }</span>
	<input type="submit" value="Update"/>
</form>
  </body>
</html>
