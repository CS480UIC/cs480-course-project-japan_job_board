<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body style='background: white;'>
	<h3 align="center"> Job Table</h3>

		<table border="1" width="70%" align="center">
			<tr>
				<th>Job ID</th>
				<th>Job Title</th>
				<th>Job Location</th>
				<th>Job Salary</th>
				<th>Job Language</th>
				<th>Job Company</th>
				<th>Job Description</th>
				<th>Job Residence</th>
				<th>Job Employment</th>
				<th>Actions</th>
			</tr>


		<c:forEach items="${JobList}" var="job">
		<tr>
			<td>${job.getJobID() }</td>
			<td>${job.getJobTitle() }</td>
			<td>${job.getJobLocation()}</td>
			<td>${job.getJobSalary()}</td>
			<td>${job.getJobLanguage()}</td>
			<td>${job.getJobCompany()}</td>
			<td>${job.getJobDescription()}</td>
			<td>${job.getJobResidence()}</td>
			<td>${job.getJobEmploymentn()}</td>
            <td>
            	<form action="<c:url value='/controls?action=deleteJ&jobid=${job.getJobID()}'/>" method="post">
					<input type="submit" value='Delete ${job.getJobID()}'/>
				</form>
				<form action="<c:url value='/jsps/updateJob.jsp?jobid=${job.getJobID()}'/>" method="post">
				
					<input type="submit" value='Update ${job.getJobID()}'/>
				</form>               
            </td>
		</tr>
		</c:forEach>
		</table>	


</body>
</html>