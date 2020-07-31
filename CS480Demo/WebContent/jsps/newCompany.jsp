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
	<!-- CSS only -->
	<link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

  </head>
  
  <body style="background-color: rgb(231, 233, 235);">
  <jsp:include page="/jsps/top.jsp"/>
  
	<div class="jumbotron jumbotron-fluid">
  		<div class="container">
    		<h1 class="display-4">Adding a new company</h1>
    		<p class="lead">Click the add button below to confirm changes</p>
  		</div>
  		<hr class="my-4">
	<p style="color: red; font-weight: 900">${msg }</p>
	<form action="<c:url value='/controls?action=newC'/>" method="post">
	<input type="hidden" name="method" value="regist"/>
	
	 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Username</span>
        </div>
        <input type="text" class="form-control" name="username" id="validationCustomUsername" value="${form.username }" aria-describedby="inputGroupPrepend" required>
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
        <input type="password" class="form-control" name="password" id="validationCustomUsername" value="${form.password }" aria-describedby="inputGroupPrepend" required>
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
        <input type="text" class="form-control" name="company_name" id="validationCustomUsername" value="${form.company_name }" aria-describedby="inputGroupPrepend" required>
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
        <input type="text" class="form-control" name="company_location" id="validationCustomUsername" value="${form.company_location }" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose a company location
        </div>
      </div>
    </div>
    
	 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Company Bio</span>
        </div>
        <input type="text" class="form-control" name="company_bio" id="validationCustomUsername" value="${form.company_bio }" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please enter a company bio
        </div>
      </div>
    </div>
    
	 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Company Size</span>
        </div>
        <input type="number" class="form-control" name="company_size" id="validationCustomUsername" value="${form.company_size }" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please enter size of company
        </div>
      </div>
    </div>
    
    		 <div class="col-md-12 mb-3">
		<button class="btn btn-primary" type="submit" value="Register">Add Company</button>
		</div>
	
	</form>
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
