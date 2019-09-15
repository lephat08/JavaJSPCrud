<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
	<%
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String database = "jspcrud";
		String userid = "root";
		String password = "";
		String id = request.getParameter("id");
		try {
			Class.forName(driver);
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	%>
<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
<style type="text/css">
	
	th{
		background-color: green;
		color: white;
	}
	
	td{
		text-align: center;
	}

</style>


</head>
<body>
	<h1>Search Data</h1>
	<table border="1px;" style="width: 100%;">
	<tr>
			<th>Name</th>
			<th>Password</th>
			<th>Email</th>
			<th>Sex</th>
			<th>Country</th>
	</tr>
	<%
		try{
		/* connection = DriverManager.getConnection(connectionUrl+database, userid, password); */
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspcrud","root", "");
		/* statement=connection.createStatement(); */
		Statement st=conn.createStatement();
		ResultSet rs = st.executeQuery("select * from register where id='"+id+"'");
		/* String sql ="select * from register where id='"+id+"'"; */
		/* resultSet = statement.executeQuery(sql); */
		while(rs.next()){
	%>
		<tr>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getString("sex") %></td>
			<td><%=rs.getString("country") %></td>
		</tr>
	<%
		}
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
	%>

</table>
<br/><a href="viewusers.jsp">Trang chủ</a>

</body>
</html>