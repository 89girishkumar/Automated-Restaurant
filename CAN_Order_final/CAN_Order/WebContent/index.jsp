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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome!</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- jQuery library -->
<script src="js/jquery.js"></script>

<!-- Latest compiled JavaScript -->

</head>
<body>

<div class="container-fluid ">
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0> 
  <TBODY> 
  <TR> 
      <TD><IMG src="images/Capture.JPG"  width="100%" height=150   usemap="#Map">
	</TD> 
  </TR> 
  <TR>
    <TD bgColor=#39CCCC height="2"></td></tr> 
</TBODY></TABLE><br>
<div class ="container">
	<div class="col-lg-8 m-auto d-block">
	<TABLE>
	<TR><TD>
	<div class="form-group">
				<label>Online Order </label>
		        </div> 
	</TD>
	<TD> 	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</TD>
	<TD>
	<div class="form-group">
				<label>Feedback </label>
		        </div> 
	
	</TD>
	</TR>
	<TR>
	<TD>
	<form name="Test" method="post" action="onlineOrder.jsp">
			     	
               <input type="submit" name="submit" value="Submit" bold></input>
                
		</form>
	</TD>
	<TD> 	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</TD>
	<TD>
	<form name="Test" method="post" action="feedback.jsp">
			     	
               <input type="submit" name="submit" value="Submit" bold></input>
                
		</form>
	</TD>
	</TR></TABLE>
		
		
	</div>
	</div>
</div>

</body>
</html>