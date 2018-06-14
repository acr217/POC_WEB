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
path = path + db2.getPrice(email3,fname);
		BufferedReader reader = new BufferedReader(new FileReader(
				path));
		// read file line by line
		String line = null;
		Scanner scanner = null;
		int index = 0;
		List<Price> priList = new ArrayList<>();

		while ((line = reader.readLine()) != null) {
			Price pri = new Price();
			scanner = new Scanner(line);
			scanner.useDelimiter(",");
			while (scanner.hasNext()) {
				String data = scanner.next();
				if (index == 0)
					pri.setEff_date(data);
				else if (index == 1)
					pri.setSec_al(data);
				else if (index == 2)
					pri.setSrc_intfc_inst(data);
				else if (index == 3)
					pri.setUpt_date(data);
				else if (index == 4)
					pri.setUpt_src(data);
				else if (index == 5)
					pri.setPr_val(Integer.parseInt(data));
				else if (index == 6)
					pri.setPx_lval(Integer.parseInt(data));
				else if (index == 7)
					pri.setCur_nav(Integer.parseInt(data));
				else if (index == 8)
					pri.setSubs(Integer.parseInt(data));
				else if (index == 9)
					pri.setReds(Integer.parseInt(data));
				else if (index == 10)
					pri.setEx_subs(Integer.parseInt(data));
				else if (index == 11)
					pri.setEx_reds(Integer.parseInt(data));
				else if (index == 12)
					pri.setOut_sh(Integer.parseInt(data));
				else
					System.out.println("invalid data::" + data);
				index++;
			}
			index = 0;
			priList.add(pri);
		}
		
		//close reader
		reader.close();
		
		System.out.println(priList);
		
	
%>
</html>
