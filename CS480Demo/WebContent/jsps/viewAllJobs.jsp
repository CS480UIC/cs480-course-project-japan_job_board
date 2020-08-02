<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="">
    
    <c:choose>
    <c:when test="${sessionScope.session_user.getIsAdmin() == 1 }">
    <title>Job Management</title>
    </c:when>
	</c:choose>
	
	<c:choose>
    <c:when test="${sessionScope.session_user.getIsAdmin() == 0 }">
    <title>Job Search</title>
    </c:when>
	</c:choose>
	
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
  			
  			 <c:choose>
    		<c:when test="${sessionScope.session_user.getIsAdmin() == 1 }">
    		<h1 class="display-4">Job Management</h1>
    		<p class="lead">View and modify job information</p>
    		</c:when>
			</c:choose>
	
			<c:choose>
    		<c:when test="${sessionScope.session_user.getIsAdmin() == 0 }">
    		<h1 class="display-4">Job Search</h1>
    			<p class="lead">Select an option below to search our database to find your future job here in Japan</p>
    		</c:when>
			</c:choose>
  			
    			<hr class="my-4">
    			
  				<a href="<c:url value='/findAllJob'/>" class="btn btn-outline-primary" role="button">View All Jobs</a>
  				
  				<!-- simple -->
  				<a href="<c:url value='/controls?action=nottokyoJob'/>" class="btn btn-outline-primary" role="button">View All Jobs Not In Tokyo</a>
				
				<!-- complex -->
  				<a href="<c:url value='/controls?action=viewSizeLessF'/>" class="btn btn-outline-primary" role="button">View All Jobs With A Company Size Less Than 501</a>
  				<a href="<c:url value='/controls?action=viewAllProgramming'/>" class="btn btn-outline-primary" role="button">View All Programming Jobs With Company Bio</a>
  				<a href="<c:url value='/controls?action=viewLanguageGoodFromKoriyama'/>" class="btn btn-outline-primary" role="button">View All Jobs in Koriyama, Japan with Required Strong Japanese</a>


  				<c:choose>
    			<c:when test="${sessionScope.session_user.getIsAdmin() == 1 }">
  				<a href="<c:url value='/jsps/newJob.jsp'/>" class="btn btn-outline-primary" role="button">Add New Job</a>
    			</c:when>
				</c:choose>
  			</div>
		</div>   
  </body>
</html>
