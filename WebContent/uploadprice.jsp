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

String email5 = (String)session.getAttribute("Email");
String fname2 =(String)session.getAttribute("text9");
DB db4 = new DB();
String path2 = "E:\\apache-tomcat-8.0.33\\webapps\\data\\";
path2 = path2 + db4.getPrice(email5,fname2);
		BufferedReader reader2 = new BufferedReader(new FileReader(
				path2));
		// read file line by line
		String line2 = null;
		Scanner scanner2 = null;
		int index2 = 0;
		ArrayList<Price> priList = new ArrayList<>();

		while ((line2 = reader2.readLine()) != null) {
			Price pri = new Price();
			scanner2 = new Scanner(line2);
			scanner2.useDelimiter(",");
			while (scanner2.hasNext()) {
				String data = scanner2.next();
				if (index2 == 0)
					pri.setEff_date(data);
				else if (index2 == 1)
					pri.setSec_al(data);
				else if (index2 == 2)
					pri.setSrc_intfc_inst(data);
				else if (index2 == 3)
					pri.setUpt_date(data);
				else if (index2 == 4)
					pri.setUpt_src(data);
				else if (index2 == 5)
					pri.setPr_val(Integer.parseInt(data));
				else if (index2 == 6)
					pri.setPx_lval(Integer.parseInt(data));
				else if (index2 == 7)
					pri.setCur_nav(Integer.parseInt(data));
				else if (index2 == 8)
					pri.setSubs(Integer.parseInt(data));
				else if (index2 == 9)
					pri.setReds(Integer.parseInt(data));
				else if (index2 == 10)
					pri.setEx_subs(Integer.parseInt(data));
				else if (index2 == 11)
					pri.setEx_reds(Integer.parseInt(data));
				else if (index2 == 12)
					pri.setOut_sh(Integer.parseInt(data));
				else
					System.out.println("invalid data::" + data);
				index2++;
			}
			index2 = 0;
			priList.add(pri);
		}
		
		//close reader
		reader2.close();
		
		System.out.println(priList);
		
		Price p = new Price();
		p.setPriList(priList);
	
%>
<%
String email6 = (String)session.getAttribute("Email");
String id= request.getParameter("id");
DB db3 = new DB();
Price p1 = new Price();
ArrayList<Price> aue2 = p1.getPriList();
 if(db3.uploadprice(aue2,email6,id))
  {
	out.println(" Successfully Uploaded Price into database");
  }
    
%>


</html>