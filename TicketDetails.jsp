<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking</title>
</head>
<body>
<%! class Seat{
	
	public String url ="jdbc:mysql://127.0.0.1:3306/TRAVELLER";
	public String uname="root";
	public String pass="Sannu@08";
	private String Querry = "UPDATE TIMETABLE SET SEATLEFT=? WHERE FLIGHTNO=? AND DESTINATION=? AND SOURCE1=? AND DATES=?";
	private String passengerQuerry = "SELECT * FROM REGISTER WHERE USERNAME=?";
	
	public void seatLeftUpdate (int seatLeft, String source,String dest,String date,int flightNo) {
			
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url,uname,pass);
		
		PreparedStatement ps = con.prepareStatement(Querry);
		
		ps.setInt(1, seatLeft);
		ps.setInt(2, flightNo);
		ps.setString(3, dest);
		ps.setString(4, source);
		ps.setString(5, date);		
		ps.executeUpdate();
		 
		ps.close();
		con.close();
		  
		
	}catch( Exception e) {
		System.out.println(e);
	}
		
}
	
	public Data getPassengerDetails (String passengerUser) {
		
		Data d = new Data();
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url,uname,pass);
		
		PreparedStatement ps = con.prepareStatement(passengerQuerry);
		
		ps.setString(1,passengerUser);

		
		ResultSet rs = ps.executeQuery();	
		while(rs.next()==true){
			
		d.name = rs.getString("NAME");
		d.number = rs.getString("PHONENUMBER");
		d.age = Integer.parseInt( rs.getString("AGE"));
		d.gender = rs.getString("GENDER");
		d.name = rs.getString("NAME");
			
		}
		  return d;
		
	}catch( Exception e) {
		System.out.println(e);
		
	}
		return d;
		
 }
}


class Data{
	
		public String name;
		public String number;
		public String destination;
		public int flightNo;
		public int seatLeft;
		public String price;
		public String gender; 
		public int age;
}


%>


<%
    
	String PassengerAge = (String)session.getAttribute("PassengerAge");
	String PassengerNumber = (String)session.getAttribute("PassengerNumber");
	String source = (String)session.getAttribute("source");
	String dest = (String)session.getAttribute("dest");
	String date= (String)session.getAttribute("date");
	String price =(String)session.getAttribute("price");
    int flightNo= (int)session.getAttribute("flightNo"); 
 	int seatLeft =(int)(session.getAttribute("seatLeft"));
 	String amount= request.getParameter("amount");
 	String a = request.getParameter("a");
 	
 	String PassengerUser = (String)session.getAttribute("passengerUser");
 	Seat s = new Seat();
 	seatLeft--;
 	
 	s.seatLeftUpdate(seatLeft, source, dest, date, flightNo);
 	
 	Data d = s.getPassengerDetails(PassengerUser);
 	
%>



<c:out value="${a}"/>

<h1>Ticket Details</h1>
<pre>

Name   : <%=d.name%> <br> 

Age    : <%=d.age %> <br>

Number : <%=d.number%><br>

From   : <%=source%><br>

To     : <%=dest%><br>

Date   : <%=date%><br>

Amount : <%= price %><br>

Seat Number : <%=seatLeft+1 %><br>

Flight No : <%=flightNo %>

<a href="TravellerForm.jsp">Home</a>

</pre>
</body>
</html>