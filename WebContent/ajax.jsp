<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.POC.*" %>
 <%@page import="javax.servlet.*"%>
  <%@page import="javax.servlet.http.*"%>
    
    <style>
    #msg
    {
    color: red;
    
    }
    
    </style>
    </head>
    <body>
    <%
  
String msg = request.getParameter("msg");
   session.setAttribute("text9",msg);
String email5 = (String)session.getAttribute("Email");
	DB db1 = new DB();
 boolean var = db1.ajaxreq(msg,email5);
 if(var == true){%>
 <input type="hidden" id="ajaxvar" name="ajaxvar" value="1"></input>
 <div style="{color: black;}">File Set Identifier Already Exists</div>
 <%}
 else{%>
 <input type="hidden" id="ajaxvar" name="ajaxvar" value="0"></input>

 <%} %>
</body>
</html>