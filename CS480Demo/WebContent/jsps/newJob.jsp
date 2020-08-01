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
    		<h1 class="display-4">Adding a new job</h1>
    		<p class="lead">Click the add job button below to comfirm changes</p>
  		</div>
  		<hr class="my-4">
   		<p style="color: red; font-weight: 900">${msg }</p>

<p style="color: red; font-weight: 900">${msg }</p>
<form action="<c:url value='/controls?action=newJ'/>" method="post">
	<input type="hidden" name="method" value="regist"/>
	
		 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Job Title</span>
        </div>
        <input type="text" class="form-control" name="job_title" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose a job title
        </div>
      </div>
    </div>
	
			 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Job Location</span>
        </div>
        <input type="text" class="form-control" name="job_location" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose a job location
        </div>
      </div>
    </div>
	
				 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Job Salary ¥</span>
        </div>
        <input type="number" class="form-control" name="job_salary" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose a job salary
        </div>
      </div>
    </div>
	
					 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Job Language</span>
        </div>
        <input type="text" class="form-control" name="job_language" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose the job's language
        </div>
      </div>
    </div>
    
    					 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Job Company</span>
        </div>
        <input type="text" class="form-control" name="job_company" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please choose the job's company
        </div>
      </div>
    </div>
    
        					 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Job Description</span>
        </div>
        <input type="text" class="form-control" name="job_description" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please enter job description
        </div>
      </div>
    </div>
    
            					 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Job Residence</span>
        </div>
        <select name="job_residence" class="custom-select">
  			<option value="Japan Residents Only">Japan Residents Only</option>
  			<option value="Will Sponsor Visa" selected>Will Sponsor Visa</option>
		</select>
		<!-- 
        <input type="text" class="form-control" name="job_residence" id="validationCustomUsername" value="${form.language_proficiency }" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please enter job residence
        </div> -->
      </div>
    </div>
    
                					 <div class="col-md-12 mb-3">
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend">Job Employment</span>
        </div>
        <select name="job_employment" class="custom-select">
  			<option value="Part-Time">Part-Time</option>
  			<option value="Full-Time" selected>Full-Time</option>
		</select>
		<!-- 
        <input type="text" class="form-control" name="job_residence" id="validationCustomUsername" value="${form.language_proficiency }" aria-describedby="inputGroupPrepend" required>
        <div class="invalid-feedback">
          Please enter job residence
        </div> -->
      </div>
    </div>
    
    		 <div class="col-md-12 mb-3">
		<button class="btn btn-primary" type="submit" value="Register">Add Job</button>
		</div>
	<!-- 
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
	<input type="submit" value="Register"/> -->
</form>
</div>
  </body>
</html>
