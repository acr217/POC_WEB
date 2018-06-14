<%@ page import="com.POC.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.*"%>
  <%@page import="javax.servlet.http.*"%>
<%


String email6 = (String)request.getParameter("email");
String pass6 = (String)request.getParameter("pass");
System.out.println(email6);
System.out.println(pass6);
   DB obj = new DB();
  boolean check =  obj.ifUserExists(email6, pass6);
  System.out.println(check);
  if(check == true){
     
     out.println("User Exists ");
     %>
	  <jsp:forward page="/Home.jsp" />  
	  
     <%}
     else%>
      <jsp:forward page="/index.jsp?error=1" />  
  