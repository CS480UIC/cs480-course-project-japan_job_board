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
  
  <h1></h1>
  		<div class="jumbotron jumbotron-fluid">
  			<div class="container">
				<c:set var="companyName" value="<%= resultSet.getString(3) %>"/>
    			<h1 class="display-4">Updating ${companyName }'s Username</h1>
    			<p class="lead">Click the update button below to update ${username }'s changes</p>
  			</div>
		<p style="color: red; font-weight: 900">${msg }</p>
		<form action="<c:url value='/controls?action=updateC&oldUsername=${username }'/>" method="post">
				<input type="hidden" name="method" value="regist"/>
			
				 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Username</span>
        </div>
        <input type="text" class="form-control" name="username" id="validationCustomUsername" value="<%= resultSet.getString(1) %>" placeholder="<%= resultSet.getString(1) %>" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose a username
        </div>
      </div>
    </div>
    
	 <div class="col-md-12 mb-3">
      <div class="input-group" id="show_hide_password">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Password</span>
        </div>
        <div class="input-group-prepend">
           <span class="input-group-text" id="inputGroupPrepend2"><a href=""><i class="fa fa-eye-slash" aria-hidden="true"></i></a></span>
        </div>
        <input type="password" class="form-control" name="password" id="validationCustomUsername" value="<%= resultSet.getString(2) %>" placeholder="<%= resultSet.getString(2) %>" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose a password
        </div>
      </div>
    </div>
    
       	<div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Company Name</span>
        </div>
        <input type="text" class="form-control" name="company_name" id="validationCustomUsername" value="<%= resultSet.getString(3) %>" placeholder="<%= resultSet.getString(3) %>" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose a company name
        </div>
      </div>
    </div>
    
           	<div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Company Location</span>
        </div>
        <input type="text" class="form-control" name="company_location" id="validationCustomUsername" value="<%= resultSet.getString(4) %>" placeholder="<%= resultSet.getString(4) %>" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please enter the company's location
        </div>
      </div>
    </div>
    
               	<div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Company Bio</span>
        </div>
        <input type="text" class="form-control" name="company_bio" id="validationCustomUsername" value="<%= resultSet.getString(5) %>" placeholder="<%= resultSet.getString(5) %>" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please enter a bio for the company
        </div>
      </div>
    </div>
    
                   	<div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Company Size</span>
        </div>
        <input type="number" class="form-control" name="company_size" id="validationCustomUsername" value="<%= resultSet.getString(6) %>" placeholder="<%= resultSet.getString(6) %>" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please enter a company size
        </div>
      </div>
    </div>
    
    	 <div class="col-md-12 mb-3">
		<button class="btn btn-primary" type="submit" value="Update">Update</button>
		</div>
    
		</form>
		</div>

  </body>
    <script>
  $(document).ready(function() {
	    $("#show_hide_password span a").on('click', function(event) {
	    	console.log("in");
	        event.preventDefault();
	        if($('#show_hide_password input').attr("type") == "text"){
	            $('#show_hide_password input').attr('type', 'password');
	            $('#show_hide_password i').addClass( "fa-eye-slash" );
	            $('#show_hide_password i').removeClass( "fa-eye" );
	        }else if($('#show_hide_password input').attr("type") == "password"){
	            $('#show_hide_password input').attr('type', 'text');
	            $('#show_hide_password i').removeClass( "fa-eye-slash" );
	            $('#show_hide_password i').addClass( "fa-eye" );
	        }
	    });
	});
  </script>
</html>
