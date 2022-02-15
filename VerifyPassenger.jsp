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
<title>VerifyPassenger</title>
</head>
<body>

<%! class Register{
	
	public String url ="jdbc:mysql://127.0.0.1:3306/TRAVELLER";
	public String uname="root";
	public String pass="Sannu@08";
	private String verifyQuerry = "SELECT * FROM REGISTER WHERE USERNAME=? AND PASSWORD=?";
	
	
    public Data  verifyPassenger (String userName, String password) {
		
	    Data d = new Data();
	    
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url,uname,pass);
		
		PreparedStatement ps = con.prepareStatement(verifyQuerry);
		
		ps.setString(1, userName);
		ps.setString(2, password);
				
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()==true){
			String userName1 = rs.getString("USERNAME");
			String password1 = rs.getString("PASSWORD");
			d.username = userName1;
			d.password = password1;
		}
		
		ps.close();
		con.close();
		
		return d;
	}catch( Exception e) {
		System.out.println(e);
	}
		return d;
}
	
}

class Data{
	
	public String username;
	public String password;	
}
%>

	
<%

String passengerUser = request.getParameter("passengerUser");
String passengerPassword = request.getParameter("password");

session.setAttribute("passengerUser", passengerUser);

Register r = new Register();
Data  d = r.verifyPassenger(passengerUser, passengerPassword);
if(d.username != null ){
	out.print("<h2> verified <h2>");
	out.println("<form action='Payment.jsp'>");
	out.println("<input type='submit'>");
	out.println("</form>");
	
}
else{
	out.println("not verified");
	
}
%>

<a href="TravellerForm.jsp">Home</a>

</body>
</html>