<%@page
	import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException"%>

<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.POC.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Scanner"%>

<input type ="hidden" id = "ip1" value=""/>

<%
String email3 = (String)session.getAttribute("Email");
String id= request.getParameter("id");
DB db2 = new DB();
String path = "E:\\apache-tomcat-8.0.33\\webapps\\data\\";
path = path + db2.getEntitySecurity(email3,id);
		BufferedReader reader = new BufferedReader(new FileReader(
				path));

		// read file line by line
		String line = null;
		Scanner scanner = null;
		int index = 0;
		ArrayList<EntitySecurity> entList = new ArrayList<>();

		while ((line = reader.readLine()) != null) {
			EntitySecurity ent = new EntitySecurity();
			scanner = new Scanner(line);
			scanner.useDelimiter(",");
			while (scanner.hasNext()) {
				String data = scanner.next();
				//System.out.println("Entity"+data);
				if (index == 0)
					ent.setInc_date(data);
				else if (index == 1)
					ent.setEid(data);
				else if (index == 2)
					ent.setEname(data);
				else if (index == 3)
					ent.setPri_ast_id(Integer.parseInt(data));
				else if (index == 4)
					ent.setBank_br_code(Integer.parseInt(data));
				else if (index == 5)
					ent.setStatus(data);
				else if (index == 6)
					ent.setTer_date(data);
				else if (index == 7)
					ent.setSec_al(data);
				else if (index == 8)
					ent.setTicker(data);
				
				else
					System.out.println("Invalid Data::" + data);
				index++;
			}
			index = 0;
			
			entList.add(ent);
		}
		
		//close reader
		reader.close();
		
		System.out.println(entList.toString());
		
		
	    %>

<%
String email6 = (String)session.getAttribute("Email");

DB db = new DB();
//String fileid1 = db.getFileid(id);
//out.println(fileid1);
try{
	 ResultSet rs = db.getfilestatus(id);
	 String ab = rs.getString(5);
	 System.out.println(ab+"hello");
	 String cd = rs.getString(6);
		
 if(db.uploadentitysecurity(entList,email6,id))
  {
	 
	
	//out.println(" Successfully Uploaded into database");
	
	db.filestatus(id);
	%>
	<jsp:forward page="/Myfiles.jsp"/>
	<%}
	
 else
 {
	 //out.println(entList.toString());
	 //out.println("Some error Occurred");%>
	 <jsp:forward page="/Myfiles.jsp"/>
 <%}
 

	
	
}
catch(MySQLIntegrityConstraintViolationException e1)
{
	out.println("File Already Uploaded ");
}
  %> 


</html>