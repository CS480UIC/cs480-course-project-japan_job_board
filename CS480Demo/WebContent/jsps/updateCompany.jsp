<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Updating Company</title>
    
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
  String sql = "select * from tb_company where username=?";
  PreparedStatement preparestatement = connect.prepareStatement(sql); 
  preparestatement.setString(1,username);
  ResultSet resultSet = preparestatement.executeQuery();
  
  if(!resultSet.next()) {
      out.println("Sorry, could not find that ");
  } else {}
  %>
  
  <h1>Updating Company Username: ${username }</h1>
  
<p style="color: red; font-weight: 900">${msg }</p>
<form action="<c:url value='/controls?action=updateC&oldUsername=${username }'/>" method="post">
	
	<input type="hidden" name="method" value="regist"/>
	Username   :<input type="text" name="username" value="<%= resultSet.getString(1) %>"/>
	<span style="color: red; font-weight: 900">${errors.username }</span>
	<br/>
	Password：<input type="password" name="password" value="<%= resultSet.getString(2) %>"/>
	<span style="color: red; font-weight: 900">${errors.password }</span>
	<br/>
	Company Name	：<input type="text" name="company_name" value="<%= resultSet.getString(3) %>"/>
	<span style="color: red; font-weight: 900">${errors.first_name }</span>
	<br/>
	Company Location	：<input type="text" name="company_location" value="<%= resultSet.getString(4) %>"/>
	<span style="color: red; font-weight: 900">${errors.last_name }</span>
	<br/>
	Company Bio	：<input type="text" name="company_bio" value="<%= resultSet.getString(5) %>"/>
	<span style="color: red; font-weight: 900">${errors.is_admin }</span>
	<br/>
	<input type="submit" value="Update"/>
</form>
  </body>
</html>
