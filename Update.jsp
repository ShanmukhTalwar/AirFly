<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%! class AdminUpdate{
	
	public String url ="jdbc:mysql://127.0.0.1:3306/TRAVELLER";
	public String uname="root";
	public String pass="Sannu@08";
	private String Querry = "UPDATE TIMETABLE SET SOURCE1= ?,DATES=?,DESTINATION = ? WHERE FLIGHTNO= ?";
	
	
	public void adminUpdate ( String source,String dest,String date,int flightNo) {
			
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url,uname,pass);
		
		PreparedStatement ps = con.prepareStatement(Querry);
		
		ps.setString(1,source);
		ps.setInt(4, flightNo);
		ps.setString(3, dest);
/* 		ps.setString(4, source); */
		ps.setString(2, date);		
		ps.executeUpdate();
		 
		ps.close();
		con.close();
		  
		
	}catch( Exception e) {
		System.out.println(e);
	}
		
}
}

%>

<%
	String source = request.getParameter("source");
	String destination = request.getParameter("destination");
	String date = request.getParameter("date");
	
	int flightNo = Integer.parseInt(request.getParameter("flightno"));	
	AdminUpdate a = new  AdminUpdate();
	a.adminUpdate(source, destination, date, flightNo);
	out.println("<h3>Updated successpully<h3>");
%>



</body>
</html>