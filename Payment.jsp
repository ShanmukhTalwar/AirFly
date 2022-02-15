<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
</head>
<body>
<form action="Booking.jsp">


<h3>PAYMENT FORM</h3>
<br>
<%
String price=(String)session.getAttribute("price") ;
out.println("Pay "+price+"/Rs");

%>
Enter Amount : <input type="text" name="a" ><br>


<input type="submit" value ="pay">
</form>

<a href="TravellerForm.jsp">Home</a>

</body>
</html>