<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.POC.*" %>
    <%@page import="java.sql.*" %>
    <head>
    <style>
    .myfiles
    {
     font-weight: bold;
     font-style: verdana;
   
     color: green;
    }
     .myfileschild
    {
    
     height: 120px;
     width: 150px;
     
     background-color: grey;
     color: white;
     
    }
    
    </style>
    </head>
<%
ResultSet rs1;
String email = (String)session.getAttribute("Email");
DB db1 = new DB();
rs1 = db1.getFiles(email);
while(rs1.next())
{%>
	<div class = "myfiles">
	Load Files into Database
	<div class = "myfileschild">
	 <a href="#"><%=rs1.getString(3) %></a>
	 <a href="#"><%=rs1.getString(4) %></a>
	<a href="#"><%=rs1.getString(5) %></a> <script></script>
	</div>
	<span>   
	<br>
	</span>
	</div>
	
	
<%}

%>
</html>