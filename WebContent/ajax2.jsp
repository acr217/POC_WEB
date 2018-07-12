
<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.POC.*" %>
    <%@page import="java.sql.*" %>
    <head>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>


</head>
<body>
 <%
 String ajaid = request.getParameter("ajaid");
 DB db = new DB(); 
 ResultSet rs = db.getfilestatus(ajaid);
 String ab = rs.getString(5);
 String cd = rs.getString(6);
 if(ab == "1")
 {
 %>
<input type="hidden" id="ajaxvar1" name="ajaxvar1" value="1"></input>
<%}
 if(cd == "1")
 {%>
	 <input type="hidden" id="ajaxvar1" name="ajaxvar1" value="2"></input>
 <% }
  if(ab == "0")
 {
 %>
<input type="hidden" id="ajaxvar1" name="ajaxvar1" value="3"></input>
<%}
  if(cd == "0")
  {
  %>
 <input type="hidden" id="ajaxvar1" name="ajaxvar1" value="4"></input>
 <%}%>
 


</body>
</html>