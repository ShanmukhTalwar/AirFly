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
<title>FlightsTable</title>
</head>
<body>
<%! class FlightSearch{
	
	public String url ="jdbc:mysql://127.0.0.1:3306/TRAVELLER";
	public String uname="root";
	public String pass="Sannu@08";
	private String Querry = "SELECT * FROM TIMETABLE WHERE DATES =? AND SOURCE1=? AND DESTINATION=?";
	
	
	public Data flightSearch (String source,String destination,String date) {
			
		Data d = new Data();
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url,uname,pass);
		
		PreparedStatement ps = con.prepareStatement(Querry);
		
		ps.setString(2,source);
		
		ps.setString(1,date);
		
		ps.setString(3,destination);
		
		ResultSet rs = ps.executeQuery();	
		while(rs.next()==true){
			
			d.source=rs.getString("SOURCE1");
			d.destination=rs.getString("DESTINATION");
			d.date = rs.getString("DATES");
			d.flightNo=rs.getInt("FLIGHTNO");
			d.seatLeft=rs.getInt("SEATLEFT");
			d.price = rs.getString("PRICE");
			
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
		public int flightNo;
		public int seatLeft;
		public String price;
}
	%>
	
	<%
	String source=request.getParameter("source");
	String dest=request.getParameter("dest");
	String date=request.getParameter("date"); 

	FlightSearch f= new FlightSearch();
	Data  d=f.flightSearch(source, dest, date);
	if(d.date!=null && d.destination!=null && d.source!=null){
		
	out.println("<h1>FLIGHT DETAILS</h1>");
	
	out.println("<h2><pre>");
	out.println("Date         :- "+d.date+"<br>");
	out.println("Source       :- "+d.source+"<br><br>");
	out.println("Destination  :- "+d.destination+"<br><br>");
	out.println("Flight number:- "+d.flightNo+"<br><br>");
	out.println("Seat Left    :- "+d.seatLeft+"<br><br>");
	out.println("Price        :- "+d.price+"<br><br>");
	out.println("</pre>");

	out.println("<form action='PassengerDetails.jsp'>");	
	session.setAttribute("source", source);
	session.setAttribute("dest", dest);
	session.setAttribute("date", date);
	int seatLeft=d.seatLeft;
	session.setAttribute("seatLeft", d.seatLeft);
	int flightNo=d.flightNo;
	session.setAttribute("flightNo", d.flightNo);
	session.setAttribute("price", d.price);
	out.println("<a href='PassengerLogin.jsp'>Book Ticket</a>");
	}
	
	
	else{
		out.println("<h1>No Flights Available</h1>");
	}
	
	%>
	
	<pre>
	
 <a href="TravellerForm.jsp">Home</a>
	</pre>
	

	
</body>
</html>