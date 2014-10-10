<%@ page  import="java.sql.*" %>  
<%@ page  import="java.lang.*" %>  
<%@ page import="java.io.*" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css"><center>
<center>
<table width=95% height=2% border=0 cellspacing=0>
<tr>
<td bgcolor="#7171CE" width=100% height=2%>
</td>
</tr>
</table>

</center></head><body bgcolor="#56b4c9">
<center>
<%
try
 {
   Class.forName("com.mysql.jdbc.Driver");
   Connection       con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
   String name=request.getParameter("textwrite");
   String ext=request.getParameter("type");
   String filename=name+"."+ext;
   if(ext.equals("others"))
   {
	   filename=name;
   }		
 		int flag=0;
			PreparedStatement psmnt = null;
			psmnt = con.prepareStatement("select *from file where filename=?");
			psmnt.setString(1,filename);   
			ResultSet rs=psmnt.executeQuery();
			
			while(rs.next())
			{
				String q=rs.getString(1);
%><br><br><br><br><font color=black size=5 face="times new roman">File Found:&nbsp;&nbsp;</font><font color="#ffffff" size=5 face="times new roman"><u>
				<%
				out.println(q);
				flag=1;
%><BR><form name=fm action="download.jsp" method=post><input type=hidden name=h value=<%=filename%>><br><input type=submit name=submit value="Download" class="button3"><%
			}
			if(flag==0)
			{
%><br><br><BR><font color=black size=5>
				<%
				out.println("There are no files left with file name: ");
				%><font color="#ffffff" size=5><u>
				<%
				out.println(filename);
				%></u>
			<%
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
</font>


