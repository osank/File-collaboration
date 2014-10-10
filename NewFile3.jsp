<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String p1=request.getParameter("f2");
String f1=request.getParameter("f3");
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
PreparedStatement ps=con.prepareStatement( "insert into ext values(?)");
ps.setString(1,p1);
ps.executeUpdate();
%><html><body bgcolor="#56b4c9"><br><br><center><table border="2"><tr><td><b><font color="##ffffff" size=5 face="times new roman"><b>Extension blocked</font></b>
</center></td></tr></table></body></html>

<%


return;}
//ResultSet rs=ps.executeQuery();
	//while(rs.next())
//{   p1=rs.getString(1);
//out.println(p1);
   //  	
    	
%>
<%

String p2=request.getParameter("f4");
Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
PreparedStatement ps=con1.prepareStatement( "delete from ext where name=?");
ps.setString(1,p2);
ps.executeUpdate();
%><html><body bgcolor="#56b4c9"><br><br><center><table border="2"><tr><td><b><font color="##ffffff" size=5 face="times new roman"><b>The Extension is Now Unblocked</font></b>
</center></td></tr></table></body></html>



</body>
</html>