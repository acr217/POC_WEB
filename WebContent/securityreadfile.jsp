<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="com.POC.*" %>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Scanner"%>

<%
String email3 = (String)session.getAttribute("Email");
String fname =(String)session.getAttribute("text9");
DB db2 = new DB();
String path = "E:\\apache-tomcat-8.0.33\\webapps\\data\\";
path = path + db2.getSecurity(email3,fname);
		BufferedReader reader = new BufferedReader(new FileReader(
				path));

		// read file line by line
		String line = null;
		Scanner scanner = null;
		int index = 0;
		List<Security> secList = new ArrayList<>();

		while ((line = reader.readLine()) != null) {
			Security sec = new Security();
			scanner = new Scanner(line);
			scanner.useDelimiter(",");
			while (scanner.hasNext()) {
				String data = scanner.next();
				if (index == 0)
					sec.setSec_al(data);
				else if (index == 1)
					sec.setPri_ast_id(Integer.parseInt(data));
				else if (index == 2)
					sec.setTicker(data);
				else if (index == 3)
					sec.setSrc_intfc_inst(data);
				else if (index == 4)
					sec.setUpt_date(data);
				else if (index == 5)
					sec.setUpt_src(data);
				else if (index == 6)
					sec.setEid(data);
				else
					System.out.println("invalid data::" + data);
				index++;
			}
			index = 0;
			secList.add(sec);
		}
		
		//close reader
		reader.close();
		
		System.out.println(secList);
		
	
%>
</html>
