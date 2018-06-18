<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <%@page import="com.POC.*" %>
    <%@page import="java.sql.*" %>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Scanner"%>

<%
String email6 = (String)session.getAttribute("Email");
String id= request.getParameter("id");
DB db3 = new DB();
Entity e = new Entity();
ArrayList<Entity> aue = e.getEntList();
 if(db3.uploadentity(aue,email6,id))
  {
	out.println(" Successfully Uploaded into database");
  }
    
 
   




%>


</html>