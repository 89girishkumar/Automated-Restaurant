<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.io.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="org.jfree.chart.ChartFactory" %>
<%@page import="org.jfree.chart.ChartUtilities" %>
<%@page import="org.jfree.chart.JFreeChart" %>
<%@page import="org.jfree.chart.plot.PlotOrientation" %>
<%@page import="org.jfree.data.*" %>
<%@page import="org.jfree.data.general.PieDataset" %>
<%@page import="org.jfree.data.jdbc.JDBCCategoryDataset" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Customer Ratings</h1>
        <% String query = "Select dishname,avg(rating) rating from feedback where rating not in('null','Select dishname from DISH order by dishname') group by dishname";
   /* JDBCCategoryDataset dataset = new JDBCCategoryDataset(
	"jdbc:mysql://cloudinstance.c4fdeflgqelg.us-east-2.rds.amazonaws.com:3306/cumuloautonation?allowPublicKeyRetrieval=true&useSSL=false", 
        "com.mysql.cj.jdbc.Driver","dileep", "dileep123");
    Connection con=DriverManager.getConnection("jdbc:mysql://cloudinstance.c4fdeflgqelg.us-east-2.rds.amazonaws.com:3306/cumuloautonation?allowPublicKeyRetrieval=true&useSSL=false","dileep","dileep123"); 
	*/
	JDBCCategoryDataset dataset = new JDBCCategoryDataset(
			"jdbc:mysql://localhost:3306/sys?allowPublicKeyRetrieval=true&useSSL=false", 
		         "com.mysql.cj.jdbc.Driver","root", "Dontforget@1");
    dataset.executeQuery(query);
   JFreeChart chart =  
         ChartFactory.createBarChart3D("Feedback", "Dishname", "Rating",
     dataset, PlotOrientation.VERTICAL, true, true, false);
    //JFreeChart chart =ChartFactory.createPieChart("Test123",dataset);
    try {
    ChartUtilities.saveChartAsJPEG(new File("C:\\Users\\CampusUser\\Desktop\\Final\\chartjsp.jpg"),
         chart,800, 600);
    } catch (IOException e) {
    System.out.println("Problem in creating chart.");
}%>

<IMG src="C:\\Users\\CampusUser\\Desktop\\Final\\chartjsp.jpg"  width="400" height=400> 
</body>
</html>


