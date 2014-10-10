<%@ page  import="java.sql.*" %>  
<%@ page  import="java.lang.*" %>  
<%@ page import="java.io.*" %>
<html>
<head>
<center>
<table width=95% height=2% border=0 cellspacing=0>
<tr>
<td bgcolor="#7171CE" width=100% height=2%>
</td>
</tr>
</table>

</center>
</head>
<body bgcolor="#56b4c9"><%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
		PreparedStatement ps=con.prepareStatement("select * from file");
		ResultSet rs=ps.executeQuery();
%><b><center><br><font size=4>The files present in your folder is</font></b><br><br><%
		while(rs.next())
		{
     String  p1=rs.getString(1);
			    out.println(p1);
		         	%><br><%
		}
	}
catch(FileNotFoundException fe)
{
out.println("File could not be found on filesystem");
} 
catch (IOException ioe)
{
     throw new ServletException(ioe.getMessage( ));
 	 } 
catch(Exception e)
{
e.printStackTrace();
out.println("file not found"+e.getMessage());
}
%>

