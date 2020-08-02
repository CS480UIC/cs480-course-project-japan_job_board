<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    	<c:choose>
		<c:when test="${empty sessionScope.session_user }">
		<div class="jumbotron jumbotron-fluid">
  			<div class="container">
    			<h1 class="display-4">All kind of jobs in Japan for English speakers</h1>
    			<p class="lead">👍 No Japanese required. 🌍 Overseas applicants welcome.</p>
    			<hr class="my-4">
    			<p>Hi! The initialization button below will create the tables and populate them. Make sure that the database: <em>cs480project</em> exists first. </p>
  				<form action="<c:url value='/InitServlet'/>" method="post">
					<button onclick="databaseAlert()" type="button submit" value="Initialize Database" class="btn btn-outline-danger">Initialize Database</button>
				</form>
  			</div>
		</div>
		</c:when>
		<c:otherwise>
		      <div class="jumbotron jumbotron-fluid">
  				<div class="container">
   			 		<h1 class="display-4">Hello ${sessionScope.session_user.getFirstName() }!</h1>		
   			 		<p class="lead">Good luck with your search</p>
  			    </div>
			  </div>
		</c:otherwise>
	</c:choose>
	
	<script>
	function databaseAlert() {
  		alert("Attempting Database Initialization");
	}
	</script>
