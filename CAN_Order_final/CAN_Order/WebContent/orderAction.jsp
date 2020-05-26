<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.io.*" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@ page import= "java.util.Properties"%>
<%@ page import = "javax.mail.*"%>
<%@ page import = "javax.mail.Session"%>
<%@ page import = "javax.mail.Transport" %>
<%@ page import = "javax.mail.internet.InternetAddress" %>
<%@ page import = "javax.mail.internet.MimeMessage" %>
<%!
public void sendEmail(String body, String Name,int n,int sum) throws Exception {

	// Replace sender@example.com with your "From" address.
    // This address must be verified.
     final String FROM = "dileepdail@csu.fullerton.edu";
     final String FROMNAME = "AWS";
	
    // Replace recipient@example.com with a "To" address. If your account 
    // is still in the sandbox, this address must be verified.
     final String TO = "rohitsaha91@csu.fullerton.edu";
     //Username:  AKIAIUQY2M6U6RUVHJ2Q
     //pwd: AkYXvUNITbTJIjJlpJhLbLpmLvAx4HNs13C2ANy1KJtO
     //host name end point:  email-smtp.us-east-1.amazonaws.com
    
    // Replace smtp_username with your Amazon SES SMTP user name.AKIAIVXMLQZMPW6QFUDA
     final String SMTP_USERNAME = "AKIAIUQY2M6U6RUVHJ2Q";
    
    // Replace smtp_password with your Amazon SES SMTP password.Asm/U6GJDiKwViYIciBjZu37/TiUPwMmWP1Bxb2Eohdc
     final String SMTP_PASSWORD = "AkYXvUNITbTJIjJlpJhLbLpmLvAx4HNs13C2ANy1KJtO";
   
    // The name of the Configuration Set to use for this message.
    // If you comment out or remove this variable, you will also need to
    // comment out or remove the header below.
  //static final String CONFIGSET = "ConfigSet";
    
    // Amazon SES SMTP host name. This example uses the US West (Oregon) region.
    // See https://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html#region-endpoints
    // for more information.
     final String HOST = "email-smtp.us-east-1.amazonaws.com";
    
    // The port you will connect to on the Amazon SES SMTP endpoint. 
     final Object PORT = "587";
    
     final String SUBJECT = "Your Order Details is mentioned below";
    
     final String BODY = "<h1>Name : "+Name+"<br></h1>Order Number "+n+"<br>"+body+"<br>Order Total = $"+sum;


    // Create a Properties object to contain connection configuration information.
	Properties props = System.getProperties();
	props.put("mail.transport.protocol", "smtp");
	props.put("mail.smtp.port", PORT); 
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.auth", "true");

    // Create a Session object to represent a mail session with the specified properties. 
	Session session = Session.getDefaultInstance(props);

    // Create a message with the specified information. 
    MimeMessage msg = new MimeMessage(session);
    msg.setFrom(new InternetAddress(FROM,FROMNAME));
    msg.setRecipient(Message.RecipientType.TO, new InternetAddress(TO));
    msg.setSubject(SUBJECT);
    msg.setContent(BODY,"text/html");
    
    // Add a configuration set header. Comment or delete the 
    // next line if you are not using a configuration set
 //Parijat   msg.setHeader("X-SES-CONFIGURATION-SET", CONFIGSET);
        
    // Create a transport.
    Transport transport = session.getTransport();
                
    // Send the message.
    try
    {
        System.out.println("Sending...");
        
        // Connect to Amazon SES using the SMTP username and password you specified above.
        transport.connect(HOST, SMTP_USERNAME, SMTP_PASSWORD);
    	
        // Send the email.
        transport.sendMessage(msg, msg.getAllRecipients());
        System.out.println("Email sent!");
    }
    catch (Exception ex) {
        System.out.println("The email was not sent.");
        System.out.println("Error message: " + ex.getMessage());
    }
    finally
    {
        // Close and terminate the connection.
        transport.close();
    }

}

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Order summary</h1>
        <%
            String Name=request.getParameter("Name");
            String Email=request.getParameter("Email");
            //String Phone=request.getParameter("Phone");
            String Dishid1=request.getParameter("1");
            String Dishid2=request.getParameter("2");
            String Dishid3=request.getParameter("3");
            String Dishid4=request.getParameter("4");
            String Dishid5=request.getParameter("5");
            String Dishid6=request.getParameter("6");
            String Dishid7=request.getParameter("7");
            String Dishid8=request.getParameter("8");
            String body="";
            int sum=0;
            //String Comments=request.getParameter("Comments");
            //String star=request.getParameter("star");
            //String Date=request.getParameter("date");
            
				try{
					String Query="Select DISHNAME,PRICE from dishprice where DISHID IN ("+Dishid1+","+Dishid2+","+Dishid3+","+Dishid4+","+Dishid5+","+Dishid6+","+Dishid7+","+Dishid8+")";
					Class.forName("com.mysql.cj.jdbc.Driver");  
					Connection con=DriverManager.getConnection("jdbc:mysql://cloudinstance.c4fdeflgqelg.us-east-2.rds.amazonaws.com:3306/cumuloautonation?allowPublicKeyRetrieval=true&useSSL=false","dileep","dileep123"); 
					//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?allowPublicKeyRetrieval=true&useSSL=false","root","Dontforget@1"); 
					Statement stmt=con.createStatement();  
					ResultSet rs=stmt.executeQuery(Query); 
					Random rand = new Random();
					int n = rand.nextInt(90000) + 10000;
					%>
					<h1><%=Name %></h1><br>
					<h2>Order number: <%=n %></h2>
					
					<Table>
					<tr>
					<td>Dishname</td><td>Price</td></tr><%
					
					
					while(rs.next())
					{
						String Dishname=rs.getString("DISHNAME");
						int a=rs.getInt("PRICE");
						body+="<br>"+Dishname+":  $"+a;
						sum+=a;
						%><tr><td><%=Dishname%></td><%
						%><td><%=a%></td></tr><%
						Dishname=null;
					}
					%><tr><Td>Total cost :</Td><td>$<%=sum %></td></tr></Table>
					<%
					sendEmail(body,Name,n,sum);
					int i=stmt.executeUpdate("insert into order_details(NAME,ORDER_NO,ORDER_SUMMARY)values('"+Name+"','"+n+"','"+sum+"')");
					
				}catch(Exception ex)
				{
					ex.printStackTrace();
					out.println("Error " +ex.getMessage());
				}
				%>
</font>
<font size="+3" color="red"></b>
</body>
</html>


