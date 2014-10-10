<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>


<% String contentType = request.getContentType();
PreparedStatement psmnt = null;
FileInputStream fis;
String saveFile="";
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
{
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
int flag=1;
while (totalBytesRead < formDataLength)
 {
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));


Class.forName("com.mysql.jdbc.Driver");
Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
psmnt = con1.prepareStatement("select * from ext");
ResultSet rs=psmnt.executeQuery();
while(rs.next())
{

	String q=rs.getString(1);
	
	
	if(q.equals(saveFile.substring(saveFile.length()-q.length(),saveFile.length())))
	{
		flag=0;
		}
}
if(flag==0)
{
	%><html><body bgcolor="#56b4c9"><br><br><center><table border="2"><tr><td><b><font color="##ffffff" size=5 face="times new roman"><b>You are trying upload the file having blocked extension</font></b>
</td></tr></table></body></html>

<%
return;

}

int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
FileOutputStream fileOut = new FileOutputStream(saveFile);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
}
try
 {
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
psmnt = con.prepareStatement("insert into file values(?)");
psmnt.setString(1,saveFile);
int s = psmnt.executeUpdate();
if(s>0)
{
	
%><html><body bgcolor="#56b4c9"><br><br><center><table border="2"><tr><td><b><font color="##ffffff" size=5 face="times new roman"><b>You have successfully upload the file by the name of:</font></b>
</center><% out.println(saveFile);
%></td></tr></table></body></html>

<%
}


}
catch(SQLException a)
{
%><html><body bgcolor="#56b4c9"><br><br><center><b><font color="black" size=5 face="times new roman"></b><% out.println(saveFile);
%><table border="2"><tr><td><b><font color="##ffffff" size=5 face="times new roman"><b>Same filename exists,choose another filename</font></b>
</center></td></tr></table></body></html><%
}
catch(Exception e)
{out.println(e);}
%>
