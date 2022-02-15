<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
<%! class Flight{
	
	public String url ="jdbc:mysql://127.0.0.1:3306/TRAVELLER";
	public String uname="root";
	public String pass="Sannu@08";
	private String Querry = "SELECT * FROM TIMETABLE WHERE FLIGHTNO = ?";
	
	
	public Data flightSearch (String flightNo) {
			
		 Data d = new Data();
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url,uname,pass);
		
		PreparedStatement ps = con.prepareStatement(Querry);
		
		ps.setString(1,flightNo);
		
		ResultSet rs = ps.executeQuery();	
		
		while(rs.next()==true){
			
			d.source=rs.getString("SOURCE1");
			d.destination=rs.getString("DESTINATION");
			d.date = rs.getString("DATES"); 
			
		}
		  return d;
		
	}catch( Exception e) {
		System.out.println(e);
	}
		return d;
		
}
}

class Data{
	public String date;
	public String source;
	public String destination;
}
%>



<form action="UpdateTimeTable.jsp">
<pre>
Search by Flight number : <input type="text" name="FlightNumber">
<input type="submit" value="search">
</pre>
</form>



<%
String flightno = request.getParameter("FlightNumber");
Flight f= new Flight();
Data d=f.flightSearch(flightno);
out.println("Date:- "+d.date+"-------------Source :-"+d.source+"------------Destination :-"+d.destination);
String source= (String)d.source;
String dest= (String)d.destination;
String date= (String)d.date;

%>


<form action="Update.jsp">
<pre>
From      : <input type="text" value =<%=source%>  name="source"> <br>
To        : <input type="text" value =<%=dest%> name="destination"><br>
Date      : <input type="date" value =<%=date%> name="date"><br>
Flight No : <input type="text" value=<%=flightno%>  name="flightno"><br>
          <input  type="submit" value="update"> 
</pre>
</form>


</body>
</html>