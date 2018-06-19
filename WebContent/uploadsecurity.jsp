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


String email4 = (String)session.getAttribute("Email");
String fname1 =(String)session.getAttribute("text9");
DB db3 = new DB();
String path1 = "E:\\apache-tomcat-8.0.33\\webapps\\data\\";
path1 = path1 + db3.getSecurity(email4,fname1);
BufferedReader reader1 = new BufferedReader(new FileReader(
path1));

// read file line by line
String line1 = null;
Scanner scanner1 = null;
int index1 = 0;
ArrayList<Security> secList = new ArrayList<>();

while ((line1 = reader1.readLine()) != null) {
Security sec = new Security();
scanner1 = new Scanner(line1);
scanner1.useDelimiter(",");
while (scanner1.hasNext()) {
String data = scanner1.next();
if (index1 == 0)
	sec.setSec_al(data);
else if (index1 == 1)
	sec.setPri_ast_id(Integer.parseInt(data.trim()));
else if (index1 == 2)
	sec.setTicker(data);
else if (index1 == 3)
	sec.setSrc_intfc_inst(data);
else if (index1 == 4)
	sec.setUpt_date(data);
else if (index1 == 5)
	sec.setUpt_src(data);
else if (index1 == 6)
	sec.setEid(data);
else
	System.out.println("invalid data::" + data);
index1++;
}
index1 = 0;
secList.add(sec);
}

//close reader
reader1.close();

System.out.println(secList);
Security s = new Security();
s.setList1(secList);

%>
<%
String email6 = (String)session.getAttribute("Email");
String id= request.getParameter("id");
DB db = new DB();
String fileid1 = db.getFileid1(id);
 if(db.uploadsecurity(secList,email6,fileid1))
  {
	out.println(" Successfully Uploaded Security into database");
  }
    
 
   




%>


</html>