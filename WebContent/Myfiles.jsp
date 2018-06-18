<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.POC.*" %>
    <%@page import="java.sql.*" %>
    <head>
    <style>
    
   .column {
    float: left;
    width: 20%;
    padding: 10px;
    background-color: green; 
   
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;  
    
}
.row
{
margin-left: 400px;

}

    #s1
    {
    float: left;
      color: green;
      font-style: verdana;
      font-weight: bold;
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

   <% String fileid = rs1.getString(2);%>
  
	<div class="row">
	<h2>File ID : <%=rs1.getString(2)%></h2>
  <div class="column" style="background-color:#dd8;">
      <h2>Entity File: </h2>
     <h2><a href="uploadentity.jsp?id=${fileid}"><%=rs1.getString(3) %></a></h2>
    <p>File Not Loaded Into Database</p>
  </div>
  <div class="column" style="background-color:#dd9;">
  <h2>Security File: </h2>
     <h2><a href="uploadsecurity.jsp?id=${fileid}"><%=rs1.getString(4) %></a></h2>
    <p>File Not Loaded Into Database</p>
  </div>
  <div class="column" style="background-color:#ddb;">
  <h2>Price File: </h2>
    <h2><a href="uploadprice.jsp?id=${fileid}"><%=rs1.getString(5) %></a></h2>
    <p>File Not Loaded Into Database</p>
  </div>
</div>
	<span>   
	<br>
	</span>
	</div>
	
	
<%}
%>
</html>