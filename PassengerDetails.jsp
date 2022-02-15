<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PassengerDetails</title>
</head>
<body>
<form action="addPassenger.jsp">
<h3> REGISTRATION FORM </h3>
<br>
<pre>

Name	     : <input type="text" name="passengerName"><br>
<br>
Phone Number : <input type="text" name="passengerNumber"> <br>
<br>
Age 	     : <input type="text" name="passengerAge">
<br>
Gender 	     :<input type="text" name="gender">
<br>
User Name    :<input type="text"  name="username">
<br>
Password     :<input type="text"  name="password">

<input type="reset" value="reset"> 

<input type="submit" value="register">

</pre>
</form>

<a href="TravellerForm.jsp">Home</a>

</body>
</html>