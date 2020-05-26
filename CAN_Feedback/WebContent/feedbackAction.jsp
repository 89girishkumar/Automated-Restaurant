<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.io.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color:#CC99FF;">
        <h1>Thank you for your feedback!!</h1>
        <%
            String Name=request.getParameter("Name");
            String Email=request.getParameter("Email");
            String Phone=request.getParameter("Phone");
            String Dish=request.getParameter("Dish");
            String Comments=request.getParameter("Comments");
            String star=request.getParameter("star");
            //String Date=request.getParameter("date");
            
try {
	//out.println("HelloWorld");
Class.forName("com.mysql.cj.jdbc.Driver");  
//out.println("HelloWorld");
//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?allowPublicKeyRetrieval=true&useSSL=false","root","Dontforget@1"); 
Connection con=DriverManager.getConnection("jdbc:mysql://cloudinstance.c4fdeflgqelg.us-east-2.rds.amazonaws.com:3306/cumuloautonation?allowPublicKeyRetrieval=true&useSSL=false","dileep","dileep123"); 

Statement stmt=con.createStatement();  
//ResultSet rs=stmt.executeQuery("select * from feedback"); 
   java.util.Date date=new java.util.Date();
   java.sql.Date sqlDate=new java.sql.Date(date.getTime());

int i=stmt.executeUpdate("insert into feedback(NAME,EMAILID,PHONENO,DISHNAME,FEEDBACK,RATING,DATE)values('"+Name+"','"+Email+"','"+Phone+"','"+Dish+"','"+Comments+"','"+star+"','"+sqlDate+"')");

//out.print("Data is successfully inserted!");        
// rs.close();
//statement.close();
//connection.close();
} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
out.println(ex);


}%>
</body>
</html>


