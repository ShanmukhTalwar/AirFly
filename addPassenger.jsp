<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddPassenger</title>
</head>
<body>
<%! class Register{
	
	public String url ="jdbc:mysql://127.0.0.1:3306/TRAVELLER";
	public String uname="root";
	public String pass="Sannu@08";
	private String Querry = "INSERT REGISTER VALUES(?,?,?,?,?,?)";
	private String verifyQuerry = "SELECT * FROM REGISTER WHERE USERNAME=? AND PASSWORD=?";
	
	public void addPassenger (String userName, String password, String name, int age, String gender,String number) {
			
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url,uname,pass);
		
		PreparedStatement ps = con.prepareStatement(Querry);
		
		ps.setString(1, userName);
		ps.setString(2, password);
		ps.setString(3, name);
		ps.setInt(4, age);
		ps.setString(5, gender);
		ps.setString(6, number);
			
		ps.executeUpdate();

		ps.close();
		con.close();
		
	}catch( Exception e) {
		System.out.println(e);
	}
		
}
}

class Data{
	
	public String username;
	public String password;	
}

%>


<%

String passengerName = request.getParameter("passengerName");
String passengerNumber = request.getParameter("passengerNumber");
int passengerAge = Integer.parseInt(request.getParameter("passengerAge"));
String passengerGender = request.getParameter("gender");


String passengerUser = request.getParameter("username");
String passengerPassword = request.getParameter("password");

session.setAttribute("passengerName", passengerName);
session.setAttribute("passengerNumber", passengerNumber);
session.setAttribute("passengerAge", passengerAge);
session.setAttribute("passengerGender", passengerGender);
Register r= new Register();
r.addPassenger(passengerUser , passengerPassword, passengerName, passengerAge, passengerGender, passengerNumber);

%>

<h1>Updated Successfully</h1>
<a href="TravellerForm.jsp">Home</a>

</body>
</html>