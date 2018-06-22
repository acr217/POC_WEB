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
    <body>
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
  
  var i = 0;
  if(i!=0)
   i = k;
  var ele = document.createElement("div");
  ele.style.display = "block";
  ele.setAttribute("class","row");
  var h2 = document.createElement("h2");
  h2.innerHTML = "File ID: <%=rs1.getString(2)%>";
  ele.appendChild(h2);
 //document.body.appendChild(ele);
  i++;
  var ele1 = document.createElement("div");
  ele1.style.display="block";
  ele1.setAttribute("class","column");
  ele1.setAttribute("id","dive"+"<%=rs1.getString(2)%>");
  ele1.style.backgroundColor="#dd8";
  var hh2 = document.createElement("h2");
  hh2.innerHTML = "SecurityIngestion File:";
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
  p.setAttribute("id","pe"+"<%=rs1.getString(2)%>");
  p.innerHTML="File Not Loaded Into Database";
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
  p.innerHTML="File Not Loaded Into Database";
  ele3.appendChild(p);
  ele.appendChild(ele3);
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