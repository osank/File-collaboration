<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//code to connect to the database table extension
//searching for the matching extension of the file extension to be found

String p1=request.getParameter("f6");
String f1=request.getParameter("f7");
if(!f1.equals("qwerty"))
{
	%><html><body bgcolor="#56b4c9"><br><br><center><table border="2"><tr><td><b><font color="##ffffff" size=5 face="times new roman"><b>Wrong Password</font></b>
	</center></td></tr></table></body></html>

	<%
return;
	
}
		
		String p3=request.getParameter("type");
		
	if(p3.equals("block"))
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
PreparedStatement ps=con.prepareStatement( "Update register set flag=0 where nm=?");
ps.setString(1,p1);
ps.executeUpdate();
%><html><body bgcolor="#56b4c9"><br><br><center><table border="2"><tr><td><b><font color="##ffffff" size=5 face="times new roman"><b>The person in now blocked</font></b>
</center></td></tr></table></body></html>
<% 
return ;
}

	%>
	<%
String p5=request.getParameter("f8");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
PreparedStatement ps=con.prepareStatement( "Update register set flag=1 where nm=?");
ps.setString(1,p5);
ps.executeUpdate();
%><html><body bgcolor="#56b4c9"><br><br><center><table border="2"><tr><td><b><font color="##ffffff" size=5 face="times new roman"><b>The person in now unblocked</font></b>
</center></td></tr></table></body></html>


</body>
</html>