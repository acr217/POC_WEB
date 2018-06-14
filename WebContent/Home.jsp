<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.POC.*" %>
 <%@page import="javax.servlet.*"%>
 <%@page import="java.lang.String" %>
  <%@page import="javax.servlet.http.*"%>

<%

String ss = request.getParameter("email");
session.setAttribute("Email",ss);

if(request.getParameter("email") == null)
	{%>
	<jsp:forward page="/index.jsp?error=2" /> 
	<%}%>
	 <h3 style="color: magenta;margin-left: 200px;"><%out.println(ss);%></h3>
<head>
<script src="js/check.js"></script>
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/main.css">
  
<style>
body {
    font-size: 28px;
    background-color: white;
}


ul {
margin-left: 200px;
margin-right: 200px;
    list-style-type: none;
    
    padding: 0;
    overflow: hidden;
    background-color: grey;
    position: -webkit-fixed; /* Safari */
    position: sticky;
    top: 1;
    left: 600;
}
ul li #but1{
align: bottom;
}
#but1
{

margin-right: 0px;
color: white;
float: right;
align: right;
font-size: 35px;
}
#but1:hover
{
 background-color: green;
}
li {
  }
p
{
margin-left: 200px;
margin-right: 200px;
}
li a {
float: left;
font-size: 35px;
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover {
    background-color: #111;
}

.active {
    background-color: #4CAF50;
}
#dform1
{
margin-left: 600px;
margin-right: 450px;
background-color: white;
}
.dform
{
align: center;

}
h3
{
text-align: center;
color: black;
font-size: 50px;
}
#text1{
border-style: groove;
border-color: green;
color: black;
}
input:focus{
border-style: groove;
border-color: green;
}
#entity{
border-style: groove;
border-color: green;
color: black;
}
#security{
border-style: groove;
border-color: green;
color: black;
}
#price{
border-style: groove;
border-color: green;
color: black;
}
.dform
{
color: green;
}
#error
{
margin-left: 600px;
margin-right: 450px;
color: red;
}
#error1
{
margin-left: 600px;
margin-right: 450px;
color: red;
}
#dsubmit
{
margin-left: 375px;
margin-right: 450px;
color: green;
}
</style>
<script>
function Myfunc()
{
	
var val = document.getElementById("text1").value;
var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
  if (this.readyState == 4 && this.status == 200) {
   document.getElementById("msg").innerHTML = this.responseText;
   var a = document.getElementById("ajaxvar").value;
   if(a == "1")
	   {
	   document.getElementById("submit").style.cursor = "not-allowed";
	   document.getElementById("submit").disabled = true;
	 
	   }
   else
	   {
	   document.getElementById("submit").disabled = false;
	   document.getElementById("submit").style.cursor = "pointer";
	   
	   }
  // alert(this.responseText);
 
  }
};
xhttp.open("POST", "/POC/ajax.jsp?msg="+val+"", true);
xhttp.send(); 
 
}
function Myfunc1()
{
	
	var val1 = document.getElementById("text1").value;
	
	//alert(val1);
	//alert(val1);
	//alert(val2);
	//alert(val3);
	if(val1 == "" )
		{
		 document.getElementById("submit").style.cursor = "not-allowed";
		   document.getElementById("submit").disabled = true;
		}
	else
		{
		document.getElementById("submit").disabled = false;
		   document.getElementById("submit").style.cursor = "pointer";
		}
	
	
}

</script>
</head>
<body >



  


<ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="Myfiles.jsp">My Files</a></li>
  <li><a href="#contact">My Reports</a></li>
  <li><a href="#contact" id="but1">Log out</a></li>
 
  
</ul>
<form id="Fileform1" action="/POC/FileForm.jsp" method="post" enctype="multipart/form-data">

<div id="dform1">
<h3><b>Upload Files</b></h3><br>

<div id="dtext1" class="dform">
Enter File Set Identifier : <input type="text" name="text6" id="text1" onkeyup="Myfunc()"/><br><br>
</div>

<div id="msg"></div>
<div id="dentity" class="dform">
Select Entity file : <input type="file"  name="entity" id="entity"/><br><br>
</div>
<div id="dsecurity" class="dform">
Select Security file : <input type="file" accept=".csv" name="security" id="security"/><br><br>
</div>

<div id="dprice" class="dform">
Select Price File : <input type="file" accept=".csv" name="price" id="price"/><br><br>
</div>
<div id="dsubmit" class="dform">
<input type="submit" id="submit" class="btn btn-primary btn-lg" value="Submit to Server" onmouseover="Myfunc1()"/><br><br>
</div>
</div>
</form>
<%

String a = request.getParameter("FileFormError");
String b = request.getParameter("dberror1");
if(a != null)
{%>
<div id ="error">
Please check FileNames<br>
   1. File Names cannot be empty<br>
   2 .File Names cannot be same</div>
<%}
if(b!= null)
{%>
<div id="error1">
Oops! Database Error Occurred!
</div>
<%}%>

</body>
</html>
