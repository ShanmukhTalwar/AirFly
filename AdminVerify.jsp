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
<title>AdminVerify</title>
</head>
<body>
<%! class Check{
	
	public String url ="jdbc:mysql://127.0.0.1:3306/TRAVELLER";
	public String uname="root";
	public String pass="Sannu@08";
	private String Querry = "SELECT * FROM REGISTRATION WHERE UNAME=? AND PASSWORD=?";
	
	
	public Data check (String AdminUser,String AdminPass) {
			
		 Data d = new Data();
		
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url,uname,pass);
		
		PreparedStatement ps = con.prepareStatement(Querry);
		
		ps.setString(1,AdminUser);
		
		ps.setString(2,AdminPass);
		
		ResultSet rs = ps.executeQuery();	
		if(rs.next()==true){
			d.verified=true;
			d.name=rs.getString("UNAME");
		}
		  return d;
		
	}catch( Exception e) {
		System.out.println(e);
	}
		return d;
		
}
}

class Data{
	public boolean verified;
	public String name;
}

	%>
	
	
	
	<%
	String AdminUser,AdminPass;
	AdminUser=request.getParameter("uname");
	AdminPass=request.getParameter("pass");	
	Check c = new Check();
	Data d = c.check(AdminUser, AdminPass);
	if(d.verified==true){
		out.println("<h3>LOGIN SUCCESSFUL<h3>");
		out.println("<br>");
		out.println("<form action='UpdateTimeTable.jsp'>");
		out.println("<input type='submit' value='Change Time Table'>");
		out.println("</form>");
	}
	else{
		out.println("<h3>ENTERED CREDENTIALS ARE NOT FOUND IN DATABASE <h3>");
	}
	%>
	
</body>
</html>