<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body style='background: white;'>
	<h3 align="center"> Company Table</h3>

		<table border="1" width="70%" align="center">
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
            	<form action="<c:url value='/controls?action=deleteC&username=${company.username}'/>" method="post">
					<input type="submit" value='Delete ${company.username}'/>
				</form>
				<form action="<c:url value='/jsps/updateUser.jsp?username=${company.username}'/>" method="post">
				
					<input type="submit" value='Update ${company.username}'/>
				</form>               
            </td>
		</tr>
		</c:forEach>
		</table>	


</body>
</html>