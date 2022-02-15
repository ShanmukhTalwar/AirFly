<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TravellerForm</title>
</head>
<body>
<h1>WELCOME TO AIRTRAVELLER</h1>



<form action="FlightsTable.jsp">
<pre>

DATE        : <input type="date" name="date"> <br>
<br>
FROM        : <input type="text" name="source"> <br>
<br>
TO          : <input type="text" name ="dest"> <br>
             <input type="submit" value ="search" name ="search">
</pre>
</form>

<form action="adminLogin.jsp">
<input type ="submit" value="admin login">
</form>


</body>
</html>