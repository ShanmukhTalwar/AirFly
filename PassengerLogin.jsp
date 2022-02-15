<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PassengerLogin</title>
</head>
<body>


<form action="VerifyPassenger.jsp">
<h3>PASSENGER LOGIN</h3>
<pre>
User Name: <input type="text" name="passengerUser">

Password : <input type="text" name="password">

<input type="submit" value="login">     

</pre>
</form>

<a href="PassengerDetails.jsp">Register</a>

</body>
</html>