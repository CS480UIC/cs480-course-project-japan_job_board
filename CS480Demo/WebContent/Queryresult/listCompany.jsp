<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    			<h1 class="display-4">Companies</h1>
    			<p class="lead">List of all companies in the database</p>
  			</div>
		</div>

		<div class="table-responsive" style="padding: 0 20px 0 20px;">
			<table class="table table-hover table-dark" align="center">
			<tr>
				<th>User Name</th>
				<th>Password</th>
				<th>Company Name</th>
				<th>Company Location</th>
				<th>Company Bio</th>
				<th>Company Size</th>
				<th>Actions</th>
			</tr>

		<c:forEach items="${CompanyList}" var="company">
		<tr>
			<td>${company.username }</td>
			<td>${company.password }</td>
			<td>${company.getCompanyName()}</td>
			<td>${company.getCompanyLocation()}</td>
			<td>${company.getCompanyBio()}</td>
			<td>${company.getCompanySize()}</td>
            <td>
				<form action="<c:url value='/jsps/updateCompany.jsp?username=${company.username}'/>" method="post">
					<button type="button submit" value="Update" class="btn btn-outline-warning">Update</button>
				</form>
				<br/>
				<form action="<c:url value='/controls?action=deleteC&username=${company.username}'/>" method="post">
					<button type="button submit" value="Delete" class="btn btn-outline-danger">Delete</button>
				</form>    
            </td>
		</tr>
		</c:forEach>
		</table>	


</body>
</html>