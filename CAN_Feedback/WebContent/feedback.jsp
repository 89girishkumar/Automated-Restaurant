<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<meta charset="ISO-8859-1">
<title>Give your feedback here!!</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- jQuery library -->
<script src="js/jquery.js"></script>

<!-- Latest compiled JavaScript -->
<script src="js/bootstrap.min.js"></script>
<link href="css/templatemo_style.css" REL="stylesheet"> 
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

</head>
<body style="overflow: auto">
<script type="text/javascript" language="javascript">


var test=0;
var flag=0;
function func(test){

	flag=test;	
	
}
function validation_phone(){
	var Phone = document.getElementById('Phone').value;
	if (Phone == "")
	{
		document.getElementById('phoneno').innerHTML = "**Phone no cannot be blank";
		//alert(document.getElementById('Name').value);
		return false;
	}
else
	{
		document.getElementById('phoneno').innerHTML = "";
	}
if(Phone.length!=10)
	{
		document.getElementById('phoneno').innerHTML = "**Please enter 10 digit phone no";
		//alert(document.getElementById('Name').value);
		return false;
	}
else
	{
		document.getElementById('phoneno').innerHTML = "";
	}
}
function validation_dish(){
	var Dish = document.getElementById('DISHNAME').value;
	
	if (Dish == "")
	{
	document.getElementById('dishname1' ).innerHTML = "**Please enter a valid dishname";
	//alert(document.getElementById('Name').value);
	return false;
	}
else{
	document.getElementById('dishname1').innerHTML = "";
	}
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
	function validation()
	{
		var check=0;
		var Name = document.getElementById('Name').value;
		var Email = document.getElementById('Email').value;
		var Phone = document.getElementById('Phone').value;
		var Dish = document.getElementById('DISHNAME').value;
		var Comments = document.getElementById('Comments').value;
				
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
		if (Phone == "")
			{
				document.getElementById('phoneno').innerHTML = "**Phone no cannot be blank";
				//alert(document.getElementById('Name').value);
				check=1;
			}
		else if(Phone.length!=10)
			{
				document.getElementById('phoneno').innerHTML = "**Please enter 10 digit phone no";
				//alert(document.getElementById('Name').value);
				check=1;
			}
		else
			{
				document.getElementById('phoneno').innerHTML = "";
			}
		if (Dish == "")
			{
			document.getElementById('dishname1' ).innerHTML = "**Please enter a valid dishname";
			//alert(document.getElementById('Name').value);
			check=1;
			}
		else{
			document.getElementById('dishname1').innerHTML = "";
		}
		if (flag==0)
		{
		alert("Enter Rating");
		check=1;
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
      <TD><IMG src="images/feedback Header1.jpg"  width="100%" height=170   usemap="#Map">
	</TD> 
  </TR> 
  <TR>
    <TD bgColor=#39CCCC height="2"></td></tr> 
</TBODY></TABLE><br>
<div class ="container">
	<div class="col-lg-8 m-auto d-block">
		<form name="Test" method="post" action="feedbackAction.jsp" onsubmit="return validation()">
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
			<div class="form-group">
				<label>Phone No: </label>
				<input type="text" name="Phone" size="10" maxlength="10" class="form-control" id="Phone"  autocomplete="off" onchange="return validation_phone()"></input>
				<span id="phoneno" class="text-danger" font-weight-bold></span>
			</div>
			<div class="form-group">
				<label>Dish Name: </label>
				<select name="Dish" class="form-control" id="DISHNAME"  autocomplete="off" onchange="return validation_dish()">
				<option>Select the Dish you had</option>
				<%
				try{
					String Query="Select dishname from DISH order by dishname";
					Class.forName("com.mysql.cj.jdbc.Driver");  
					Connection con=DriverManager.getConnection("jdbc:mysql://cloudinstance.c4fdeflgqelg.us-east-2.rds.amazonaws.com:3306/cumuloautonation?allowPublicKeyRetrieval=true&useSSL=false","dileep","dileep123"); 
					//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?allowPublicKeyRetrieval=true&useSSL=false","root","Dontforget@1"); 
					Statement stmt=con.createStatement();  
					ResultSet rs=stmt.executeQuery(Query); 
					while(rs.next())
					{
						%>
						<option>
						<%=rs.getString("DISHNAME")%>
						</option>
						<%
					}
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
					out.println("Error " +ex.getMessage());
				}
				%>
				</select>
				<span id="dishname1" class="text-danger" font-weight-bold></span>
			</div>
			<div class="form-group">
				<label>Comment: </label>
				<input type="text" name="Comments" class="form-control" id="Comments" autocomplete="off"></input>
			</div>
			<div class="form-group"><label>Rating: </label>
			<div class="rating">
						<input size="1" type="radio" name="star" id="star1" value="5" onclick="func(this.value)" required><label for="star1"></label>
                        <input size="1" type="radio" name="star" id="star2" value="4" onclick="func(this.value)" required><label for="star2"></label>
                        <input size="1" type="radio" name="star" id="star3" value="3" onclick="func(this.value)" required><label for="star3"></label>
                        <input size="1" type="radio" name="star" id="star4" value="2" onclick="func(this.value)" required><label for="star4"></label>
                        <input size="1" type="radio" name="star" id="star5" value="1" onclick="func(this.value)" required></input><label for="star5"></label>
                        <span name="putstar" id="rate" class="text-danger" font-weight-bold></span>
                        </div></div>
                        
                	<br>
                	
                	<input type="submit" name="submit" value="Submit" bold></input>
                
		</form>
	</div>
	</div>
</div>

</body>
</html>