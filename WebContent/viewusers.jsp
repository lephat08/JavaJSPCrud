<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>View Users</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style type="text/css">
	th{
		background-color: green;
		color:white;
		text-align: center;
	}
	#table{
		text-align: center;
	}

</style>
	
</head>
<body>

	<%@page import="com.javatpoint.dao.UserDao,com.javatpoint.bean.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1 style="text-align: center;">Danh sách người dùng </h1>
	
	<%
		List<User> list = UserDao.getAllRecords();
		request.setAttribute("list",list);
	%>
	
	<table border="1" width="100%" class="table table-striped" id="table" >
	<tr>
			<th>Name</th>
<!-- 			<th>Password</th> -->
			<th>Email</th>
			<th>Sex</th>
			<th>Country</th>
			<th>Edit</th>
			<th>Delete</th>
	</tr>
	<c:forEach items="${list}" var="u">
		<tr>
			<%-- <td>${u.getId()}</td> --%>
			<td>${u.getName()}</td>
			<%-- <td>${u.getPassword()}</td> --%>
			<td>${u.getEmail()}</td>
			<td>${u.getSex()}</td>
			<td>${u.getCountry()}</td>
			<td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>
			<td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td>
		</tr>
	</c:forEach>
<!-- 		<tr>
			<td colspan=2">Tìm kiếm</td>
			<td>
				<form action="viewusers.jsp">
					<input type="text">
					<button class="btn btn-warning" name="search">Search</button>
				</form>
			</td>
		</tr> -->
	</table>
	<br/><a href="adduserform.jsp">Thêm người dùng mới</a>
	<br/><a href="Hienthi_timkiem.html">Search người dùng</a>

</body>
</html>