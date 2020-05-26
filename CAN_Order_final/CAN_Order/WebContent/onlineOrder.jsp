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
<title>Order here!!</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- jQuery library -->
<script src="js/jquery.js"></script>

<!-- Latest compiled JavaScript -->
<script src="js/bootstrap.min.js"></script>

</head>
<body style="overflow: auto">
<script type="text/javascript" language="javascript">


var test=0;
var flag=0;
function func(test){

	flag=test;	
	
}


function validation_email(){
	var Email = document.getElementById('Email').value;
	if (Email == "")
	{
		document.getElementById('emailid').innerHTML = "**Email id cannot be blank";
		//alert(document.getElementById('Name').value);
		return false;
	}
else
	{
		document.getElementById('emailid').innerHTML = "";
	}
if (Email.indexOf('@') <= 0)
	{
		document.getElementById('emailid').innerHTML = "**Invalid position of @";
		//alert("hello");
		return false;
	}
else
	{
		document.getElementById('emailid').innerHTML = "";
	}
if ((Email.charAt(Email.length-4)!='.') && (Email.charAt(Email.length-3)!='.'))
	{
		document.getElementById('emailid').innerHTML = "**Invalid position of .";
		//alert(document.getElementById('Name').value);
		return false;
	}
else
	{
		document.getElementById('emailid').innerHTML = "";
	}
}
function validation_name(){
	var Name = document.getElementById('Name').value;
	if (Name == "")
	{
		document.getElementById('username').innerHTML = "**Name cannot be blank";
		//alert("hello");
		return false;
	}
else
	{
		document.getElementById('username').innerHTML = "";
	}
if (!isNaN(Name))
	{
		document.getElementById('username').innerHTML = "**Please enter alphabets only";
		//alert(document.getElementById('Name').value);
		return false;
	}
else
	{
		document.getElementById('username').innerHTML = "";
	}
		//Name= /^[0-9a-zA-Z]+$/;
if (!Name.match(/^[a-zA-Z]+$/))
	{
		document.getElementById('username').innerHTML = "**Only alphabets are allowed";
		//alert("hello");
		return false;
	}
else
	{
		document.getElementById('username').innerHTML = "";
	}
	
}
	function validation1()
	{
		var check=0;
		var Name = document.getElementById('Name').value;
		var Email = document.getElementById('Email').value;
		var Phone = document.getElementById('Phone').value;
		var Dish = document.getElementById('DISHNAME').value;
		var Comments = document.getElementById('Comments').value;
		alert("hello");		
		if (Name == "")
			{
				document.getElementById('username').innerHTML = "**Name cannot be blank";
				//alert("hello");
				check=1;
			}
		
		else if (!isNaN(Name))
			{
				document.getElementById('username').innerHTML = "**Please enter alphabets only";
				//alert(document.getElementById('Name').value);
				check=1;
			}
						//Name= /^[0-9a-zA-Z]+$/;
		else if (!Name.match(/^[a-zA-Z]+$/))
			{
				document.getElementById('username').innerHTML = "**Only alphabets are allowed";
				//alert("hello");
				check=1;
			}
		else
			{
			
				document.getElementById('username').innerHTML = "";
			}
		
		if (Email == "")
			{
				document.getElementById('emailid').innerHTML = "**Email id cannot be blank";
				//alert(document.getElementById('Name').value);
				check=1;
			}
		
		else if (Email.indexOf('@') <= 0)
			{
				document.getElementById('emailid').innerHTML = "**Invalid position of @";
				//alert("hello");
				check=1;
			}
		else if ((Email.charAt(Email.length-4)!='.') && (Email.charAt(Email.length-3)!='.'))
			{
				document.getElementById('emailid').innerHTML = "**Invalid position of .";
				//alert(document.getElementById('Name').value);
				check=1;
			}
		else
			{
				document.getElementById('emailid').innerHTML = "";
			}
		 
		if (check==1)
			{
			return false;
			}
	}
</script>

<div class="container-fluid ">
	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0> 
  <TBODY> 
  <TR> 
      <TD><IMG src="images/pics/WALL.PNG"  width="100%" height=200 >
	</TD> 
  </TR> 
  <TR>
    <TD bgColor=#39CCCC height="2"></td></tr> 
</TBODY></TABLE><br>
<div class ="container">
	<div class="col-lg-8 m-auto d-block">
		<form name="Test" method="post" action="orderAction.jsp" onsubmit="return validation1()">
			<div class="form-group">
				<label>Name: </label>
				<input type="text" name="Name" class="form-control" id="Name" onchange="return validation_name()"></input>
				<span id="username" class="text-danger" font-weight-bold></span>
			</div>
			<div class="form-group">
				<label>Email ID: </label>
				<input type="text" name="Email" class="form-control" id="Email"  autocomplete="off" onchange="return validation_email()"></input>
				<span id="emailid" class="text-danger" font-weight-bold></span>
			</div>
			<div>
				<label>Dish Name: </label><BR>
				<%
				try{
					//Email e=new Email();
					//e.send();
					String Query="Select dishname,DISHID,PRICE from dishprice order by dishid";
					Class.forName("com.mysql.cj.jdbc.Driver");  
					Connection con=DriverManager.getConnection("jdbc:mysql://cloudinstance.c4fdeflgqelg.us-east-2.rds.amazonaws.com:3306/cumuloautonation?allowPublicKeyRetrieval=true&useSSL=false","dileep","dileep123"); 
					//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?allowPublicKeyRetrieval=true&useSSL=false","root","Dontforget@1"); 
					Statement stmt=con.createStatement();  
					ResultSet rs=stmt.executeQuery(Query); 
					%>
					<div>
					<Table  width=100%><%
					while(rs.next())
					{
						String name="";
						String id="";
						String price="";
						name=rs.getString("DISHNAME");
						id=rs.getString("DISHID");
						String pic="images/pics/"+id+".JPG";
						price=rs.getString("PRICE");
						//Integer value=rs.getInt("PRICE");
						%>
						
						<TR>
						<TD>
						<Table>
						<tr><TD><IMG src="<%=pic%>" width=150 height=100></TD></tr>
						<tr><TD><input type="checkbox" name="<%=id %>" id="DISHNAME" value=<%=id%> autocomplete="off">
						<%=name%>&nbsp ($<%=price%> per plate)
						</input>
						</TD>
						</tr>
						</Table>
						</TD>
						
						<%
						rs.next();
					
						name=rs.getString("DISHNAME");
						id=rs.getString("DISHID");
						//Integer value=rs.getInt("PRICE");
						pic="images/pics/"+id+".JPG";
						%>
					
						<TD>
						<Table>
						<tr><TD><IMG src="<%=pic%>" width=150 height=100></TD></tr>
						<tr><TD><input type="checkbox" name="<%=id %>" id="DISHNAME" value=<%=id%> autocomplete="off">
						<%=name%>&nbsp ($<%=price%> per plate)
						</input>
						</TD>
						</tr>
						</Table>
						</TD>
						</TR>
						<TR><TD><BR><BR></TD></TR><%
					}
					%>
					
					</Table></div><%
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
					out.println("Error " +ex.getMessage());
				}
				%>
			</div>
			
			
                	<br>
                	
                	<input type="submit" name="submit" value="Submit" bold></input>
                
		</form>
	</div>
	</div>
</div>

</body>
</html>