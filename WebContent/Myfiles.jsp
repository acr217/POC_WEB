<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.POC.*" %>
    <%@page import="java.sql.*" %>
    <head>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
      color: red;
      font-style: verdana;
      font-weight: bold;
    }
    
    </style>
    </head>
    <body>
      <input type="hidden" id="z" name="z" value=""></input>
<%
ResultSet rs1;
String email = (String)session.getAttribute("Email");
int i = 0;
int j =0;
DB db1 = new DB();
rs1 = db1.getFiles(email);
while(rs1.next())
{%>

  <script>
 <% DB db = new DB(); 
 ResultSet rs = db.getfilestatus(rs1.getString(2));
 String ab = rs.getString(5);
 String cd = rs.getString(6);
 %>
  
  
  var i = 0;
  if(i!=0)
   i = k;
  var ele = document.createElement("div");
  ele.style.display = "block";
  ele.setAttribute("class","row");
  var h2 = document.createElement("h2");
  h2.innerHTML = "FileSet ID: <%=rs1.getString(2)%>";
  ele.appendChild(h2);
 //document.body.appendChild(ele);
  i++;
  //alert(i);
  var ele1 = document.createElement("div");
  ele1.style.display="block";
  ele1.setAttribute("class","column");
  ele1.setAttribute("id","dive"+"<%=rs1.getString(2)%>");
  ele1.style.backgroundColor="#dd8";
  var hh2 = document.createElement("h2");
  hh2.innerHTML = "SECENT File:";
  ele1.appendChild(hh2);
  ele.appendChild(ele1);
  
  var a = document.createElement("a");
  var ss = '<%=rs1.getString(2)%>';
  //alert(ss);
  var ih = document.createElement("input");
  ih.setAttribute("type","hidden");
  ih.setAttribute("id",'<%=rs1.getString(2)%>');
  ih.setAttribute("value","<%=rs1.getString(2)%>");
  document.body.appendChild(ih);
  var b = document.getElementById('<%=rs1.getString(2)%>').value;
  a.setAttribute("href","uploadentity.jsp?id="+b+"");
  a.innerHTML = "<%=rs1.getString(3)%>";
 
  

  //alert(b);
  ele1.appendChild(a);
  
  var p = document.createElement("p");
  p.setAttribute("id","pe"+<%=rs1.getString(2)%>);
 
  
  if(<%=ab%> == '1')
  {
   a.style.display = "none";
   p.innerHTML = "File Already Loaded";
 }
  else
  {
  a.style.display = "block";
p.innerHTML="File Not Loaded Into Database";
  }
  ele1.appendChild(p);
  ele.appendChild(ele1);
  document.body.appendChild(ele);
  
 
  
  var ele3 = document.createElement("div");
  ele3.style.display="block";
  ele3.setAttribute("class","column");
  ele3.setAttribute("id","divp"+"<%=rs1.getString(2)%>");
  ele3.style.backgroundColor="#dd8";
  var hh2 = document.createElement("h2");
  hh2.innerHTML = "Price File:";
  ele3.appendChild(hh2);
  
  var a = document.createElement("a");
  a.setAttribute("id","ap"+"<%=rs1.getString(2)%>");
  a.setAttribute("name","<%=rs1.getString(2)%>");
  a.setAttribute("href","uploadprice.jsp?id="+b+"");
  a.innerHTML = "<%=rs1.getString(4)%>";
  ele3.appendChild(a);
  
  var p = document.createElement("p");
  p.setAttribute("id","pap"+"<%=rs1.getString(2)%>");
  
 if(<%=cd%> == '1')
  {
   a.style.display = "none";
   p.innerHTML = "File Already Loaded";
 }
  else
	  {
	  a.style.display = "block";
  p.innerHTML="File Not Loaded Into Database";
	 }
  ele3.appendChild(p);
  ele.appendChild(ele3);
  document.body.appendChild(ele);
  
  var ele5 = document.createElement("form");
  ele5.setAttribute("name","formm1")
  var inp = document.createElement("input");
  inp.setAttribute("name","idd");
  inp.setAttribute("value","<%=rs1.getString(2)%>");
  inp.setAttribute("type","hidden");
  ele5.appendChild(inp);
  var bb = document.createElement("button");
  bb.setAttribute("class","btn btn-primary btn-lg");
  bb.setAttribute("id","bu"+<%=rs1.getString(2)%>);
  bb.innerHTML = "Generate Daily Report";
  ele5.appendChild(bb);
  bb.setAttribute("formaction","report.jsp");
  ele.appendChild(ele5);
  document.body.appendChild(ele);
 
  
            </script>
       
    
	<span>   
	<br>
	</span>
	</div>
<%}
%>

</body>
</html>