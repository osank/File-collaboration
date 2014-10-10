<%@page import="java.sql.*"%>
<html>
<head>
<link rel=stylesheet type="text/css" href="style.css">
<center>
<table width=95% height=3% border=0 cellspacing=0>
<tr>
<td bgcolor="#fa6600" width=100% height=3%>
</td>
</tr>
</table>
</center>
</head>
<body bgcolor="#56b4c9"><center><br><br><br><font size=6 color=black>

<%
		try
		{
			String t1=request.getParameter("t1");
			String t2=request.getParameter("t2");
			String pass="";
			String pass2="";
			String p1="";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
			PreparedStatement ps=con.prepareStatement("select * from register where uid=?");
			ps.setString(1,t1);
			ResultSet rs=ps.executeQuery();
			int flag=0;
		
		while(rs.next())
		{   p1=rs.getString(1);
			pass=rs.getString(4);
			pass2=rs.getString(6);
			
			if(pass.equals(t2)&&pass2.equals("1"))
			{
				flag=1;
			}
			else
			{
				flag=0;	
			}
		}
		if(flag==1)
		{ 	
			out.print("Hey ");
			out.print(p1); 
			if(p1.equals("osank"))
			{
%>
			<br><a href="middle1.html" target=middle><font color="#ffffff" size=5>Want to Go at Homepage</a></br><%
			}
			else
			{
%>
		<br><a href="middle.html" target=middle><font color="#ffffff" size=5>Want to Go at Homepage</a></br>
<%
			}
		}
		else
			%><a href="login.html" target=bottom><font color=black size=5>Login Failed,Click here to Login</a></font><%
	}
	catch(Exception e)
	{out.print(e);
	}
%>
</body>
</html>
