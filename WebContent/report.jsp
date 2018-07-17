   <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
    <%@ page import="com.google.gson.Gson"%><%@ page import="com.google.gson.JsonObject"%>
    <%@page import="com.POC.*" %>
    <%@page import="java.sql.*" %>
<%@ page import="java.util.*,java.sql.*" %>
<%
String fileid = request.getParameter("idd");
System.out.println(fileid+"FILEID");
DB dbb = new DB();
ResultSet rss = dbb.getfilestatus(fileid);
if(rss.getString(5).equals("0") && rss.getString(6).equals("0"))
{
	
}

else
{
ResultSet resultSet = dbb.reportGen(fileid);

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 String xVal;
 String yVal;
try{

	
	while(resultSet.next()){
		xVal = resultSet.getString(4);
	 yVal = resultSet.getString(10);
		map = new HashMap<Object,Object>(); map.put("x", Integer.parseInt(xVal)); map.put("y", Integer.parseInt(yVal)); list.add(map);
		dataPoints = gsonObj.toJson(list);
	}

}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	exportEnabled: true,
	title: {
		text: "JSP Column Chart from Database"
	},
	data: [{
		type: "line", //change type to bar, line, area, pie, etc
		dataPoints: [{<%out.print(dataPoints);
		%>}],
		
	}]
});
chart.render();

}
</script>


</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>  
<%
}%>     