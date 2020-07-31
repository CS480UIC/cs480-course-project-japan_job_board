<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Adding New User</title>
    
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
    		<h1 class="display-4">Adding a new user</h1>
    		<p class="lead">Click the add button below to comfirm changes</p>
  		</div>
  		<hr class="my-4">
   		<p style="color: red; font-weight: 900">${msg }</p>
		<form action="<c:url value='/controls?action=new'/>" method="post" style="width: 100%;">
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
          <span class="input-group-text" id="inputGroupPrepend">First Name</span>
        </div>
        <input type="text" class="form-control" name="first_name" id="validationCustomUsername" value="${form.first_name }" form.first_name aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose a first name
        </div>
      </div>
    </div>
    
    <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Last Name</span>
        </div>
        <input type="text" class="form-control" name="last_name" id="validationCustomUsername" value="${form.last_name }" form.last_name aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose a last name
        </div>
      </div>
    </div>

        <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Make Admin</span>
        </div>
        
        <select name="is_admin" class="custom-select">
  			<option value="1">True</option>
  			<option value="0" selected>False</option>
		</select>
      </div>
    </div>
    
            <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Visa Sponsorship</span>
        </div>
        
        <select name="need_visa_sponsor" class="custom-select">
  			<option value="1" selected>True</option>
  			<option value="0">False</option>
		</select>
      </div>
    </div>

    <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Language Proficiency</span>
        </div>

        <select name="language_proficiency" class="custom-select">
  			<option value="Moot" selected>Moot</option>
  			<option value="JLPT N5">JLPT N5</option>
  			<option value="JLPT N4">JLPT N4</option>
  			<option value="JLPT N3">JLPT N3</option>
  			<option value="JLPT N2">JLPT N2</option>
  			<option value="JLPT N1">JLPT N1</option>
  			<option value="Native">Native</option>
		</select>
      </div>
    </div>
    
		 <div class="col-md-12 mb-3">
		<button class="btn btn-primary" type="submit" value="Register">Add User</button>
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
