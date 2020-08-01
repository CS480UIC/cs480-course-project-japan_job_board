<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    
    <a class="navbar-brand" href="#">
    <img src="https://icon-library.com/images/japan-icon/japan-icon-11.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
    Japan Job Board
    </a>
    
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <ul class="nav navbar-nav ml-auto">
      <c:choose>
		<c:when test="${empty sessionScope.session_user }">
      <li><a class="nav-item nav-link" href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent"><i class="fa fa-user" aria-hidden="true"></i> Register</a></li>
      <li><a class="nav-item nav-link" href="<c:url value='/jsps/user/login.jsp'/>" target="_parent"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a></li>
      
      	</c:when>
      	<c:when test="${sessionScope.session_user.getIsAdmin() == 1 }">
      	
      <li><a class="nav-item nav-link" href="<c:url value='/jsps/viewAll.jsp'/>">User Management</a></li>
      <li><a class="nav-item nav-link" href="<c:url value='/jsps/viewAllCompany.jsp'/>">Company Management</a></li>
      <li><a class="nav-item nav-link" href="<c:url value='/jsps/viewAllJobs.jsp'/>">Job Management</a></li>
             
      <li>
      	<form id="my_form2" method="post" action="<c:url value='/InitServlet'/>">
            <a class="nav-item nav-link" href="javascript:{}" onclick="document.getElementById('my_form2').submit();">Initialize Database</a>
        </form>
      </li>
      
      <li>
      	<form id="my_form" method="get" action="<c:url value='/UserServletLogout'/>">
            <a class="nav-item nav-link" href="javascript:{}" onclick="document.getElementById('my_form').submit();">Logout ${sessionScope.session_user.getUsername() }</a>
        </form>
      </li>
		</c:when>
		<c:when test="${sessionScope.session_user.getIsAdmin() == 0 }">
      <li><a class="nav-item nav-link" href="<c:url value='/jsps/viewAllJobs.jsp'/>"/>View Jobs</a></li>
      <li>
      	<form id="my_form" method="get" action="<c:url value='/UserServletLogout'/>">
            <a class="nav-item nav-link" href="javascript:{}" onclick="document.getElementById('my_form').submit();">Logout ${sessionScope.session_user.getUsername() }</a>
        </form>
      </li>
		</c:when>
	</c:choose>
	</ul>
  </div>
</nav>

  <!-- 
<h1 style="text-align: center;">Japan Job Board</h1>
<div style="font-size: 10pt;">
	<c:choose>
		<c:when test="${empty sessionScope.session_user }">
			<a href="<c:url value='/jsps/user/login.jsp'/>" target="_parent">Login</a> |&nbsp; 
			<a href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent">Register</a>
			<br />
			<form action="<c:url value='/InitServlet'/>" method="post">
				<input type="submit" value="Initialize Database"/>
			</form>
					
		</c:when>
		<c:when test="${sessionScope.session_user.getIsAdmin() == 1 }">
			<h3 style="text-align: center;">Hello Admin, ${sessionScope.session_user.username }</h3>
			<div style="text-align:center">
				<a href="<c:url value='/jsps/viewAll.jsp'/>" target="body">User Management</a> &nbsp;|&nbsp;
				<a href="<c:url value='/jsps/viewAllCompany.jsp'/>" target="body">Company Management</a> &nbsp;|&nbsp;
				<a href="<c:url value='/jsps/viewAllJobs.jsp'/>" target="body">Job Management</a> &nbsp;&nbsp;
			</div>
			
		</c:when>
		<c:otherwise>
			Hello：${sessionScope.session_user.username };
			
			<a href="<c:url value='/jsps/item.jsp'/>" target="body">Query Result</a>&nbsp;&nbsp;
		</c:otherwise>
	</c:choose>

</div>
 -->
