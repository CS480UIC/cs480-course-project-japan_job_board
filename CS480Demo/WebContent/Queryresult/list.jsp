<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body style='background: white;'>
	<h3 align="center"> User Table</h3>

		<table border="1" width="70%" align="center">
			<tr>
				<th>User Name</th>
				<th>Password</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>is Admin</th>
				<th>Visa Sponsor Needed</th>
				<th>Language Proficiency</th>
				<th>Actions</th>
			</tr>


		<c:forEach items="${UserList}" var="user">
		<tr>
			<td>${user.username }</td>
			<td>${user.password }</td>
			<td>${user.getFirstName()}</td>
			<td>${user.getLastName()}</td>
			<td>${user.getIsAdmin()}</td>
			<td>${user.getNeedVisaSponsor()}</td>
			<td>${user.getLanguageProficiency()}</td>
            <td>
            	<form action="<c:url value='/controls?action=delete&username=${user.username}'/>" method="post">
					<input type="submit" value='Delete ${user.username}'/>
				</form>
				<form action="<c:url value='/jsps/updateUser.jsp?username=${user.username}'/>" method="post">
				
					<input type="submit" value='Update ${user.username}'/>
				</form>               
            </td>
		</tr>
		</c:forEach>
		</table>	


</body>
</html>