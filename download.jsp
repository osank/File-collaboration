<%@ page  import="java.io.*" %>
<%@ page  import="java.io.BufferedInputStream"  %>
<%@ page  import="java.io.File"  %>
<%@ page import="java.io.IOException" %>
<font color="#ffffff" size=5>
<%@ page import="java.util.*"%>
<%
   	String filename=request.getParameter("h");
   //String filepath="C:/Program Files/Apache Software Foundation/Tomcat 5.5/";
   BufferedInputStream buf=null;
   ServletOutputStream myOut=null;
try
{
myOut = response.getOutputStream( );
 File myfile = new File(filename);
      		//set response headers
     response.setContentType("text/plain");
   		 response.addHeader(
        "Content-Disposition","attachment; filename="+filename );
   response.setContentLength( (int) myfile.length( ) );     
     FileInputStream input = new FileInputStream(myfile);
     buf = new BufferedInputStream(input);
     int readBytes = 0;
   //read from the file; write to the ServletOutputStream
     while((readBytes = buf.read( )) != -1)
       myOut.write(readBytes);
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
finally
 {
         		//close the input/output streams
         if (myOut != null)
           	  myOut.close( );
          if (buf != null)
          		buf.close( );
          }
%>
</font>
