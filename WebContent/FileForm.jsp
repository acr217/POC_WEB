<html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.POC.*" %>
 <%@page import="javax.servlet.*"%>
  <%@page import="javax.servlet.http.*"%>
      <%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>


 <%

 try{
	 List<Entity> Entlist = null;
	 List<Security> Seclist = null;
	 List<Price> Prilist = null;
 String email2 = (String)session.getAttribute("Email");
 String text5 = (String)session.getAttribute("text9");

   File file ;
   String text = text5;
   int j = 0;
   String fileName1[] = new String[3];
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List<FileItem> fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator<FileItem> i = fileItems.iterator();

         out.println("<html>");
         out.println("<head>");
         out.println("<title>JSP File upload</title>");  
         out.println(text5);
         out.println("</head>");
         out.println("<body>");
         String fileName = null;
         FileItem fi = null;
         while ( i.hasNext () ) {
             fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
            	
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
              
                fileName = text + fi.getName();
                fileName1[j] = fileName;
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
               //out.println(fileName);
               // Write the file
               
               j++;
            }
         }
            out.println(fileName1[0].equals(fileName1[1]));
               if(fileName1[0].equals(fileName1[1]) || fileName1[1].equals(fileName1[2]) || fileName1[0].equals(fileName1[2]))
               {
            	   response.sendRedirect("Home.jsp?FileFormError=2&email="+email2+"");
               }
               
              if(fileName1[0].equals(email2) || fileName1[1].equals(email2) || fileName1[2].equals(email2))
              {
            	   response.sendRedirect("Home.jsp?FileFormError=1&email="+email2+"");
            	  
               }
             
  
         //out.println(fileName1[0]);
         //out.println(fileName1[1]);
        // out.println(fileName1[2]);
         
        	 DB db = new DB();
        	 int d=0;
        	 try{
        	d = db.Insertdata(email2,text5,fileName1[0],fileName1[1],fileName1[2]);
        	 }
        	 catch(Exception e){}
        	if(d < 1)
        	{
        		response.sendRedirect("Home.jsp?dberror1=1&email="+email2+"");
        		
        	
        	}
         
        	  
        		  for(int k=0;k<3;k++){
                  if( fileName1[k].lastIndexOf("\\") >= 0 ) {
                     file = new File( filePath + 
                     fileName1[k].substring( fileName1[k].lastIndexOf("\\"))) ;
                  } else {
                     file = new File( filePath + 
                     fileName1[k].substring(fileName1[k].lastIndexOf("\\")+1)) ;
                  }
                  fi.write( file ) ;
                  out.println("Uploaded Filename: " + filePath + 
                  fileName1[k] + "<br>");
        	  }
               %>
        	  
           
        		  <%
        		  String email3 = (String)session.getAttribute("Email");
        		  String fname =(String)session.getAttribute("text9");
        		  DB db2 = new DB();
        		  String path = "E:\\apache-tomcat-8.0.33\\webapps\\data\\";
        		  path = path + db2.getEntity(email3,fname);
        		  		BufferedReader reader = new BufferedReader(new FileReader(
        		  				path));

        		  		// read file line by line
        		  		String line = null;
        		  		Scanner scanner = null;
        		  		int index = 0;
        		  		ArrayList<Entity> entList = new ArrayList<>();

        		  		while ((line = reader.readLine()) != null) {
        		  			Entity ent = new Entity();
        		  			scanner = new Scanner(line);
        		  			scanner.useDelimiter(",");
        		  			while (scanner.hasNext()) {
        		  				String data = scanner.next();
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
        		  					ent.setUpt_date(data);
        		  				else if (index == 8)
        		  					ent.setUpt_src(data);
        		  				
        		  				else
        		  					System.out.println("Invalid Data::" + data);
        		  				index++;
        		  			}
        		  			index = 0;
        		  			entList.add(ent);
        		  		}
        		  		
        		  		//close reader
        		  		reader.close();
        		  		
        		  		System.out.println(entList);
        		  		Entlist = entList;
        		  		
        		  	   Entity e = new Entity();
        		  	   e.setEntList(entList);
        		  	    %>
        		   
        		  
        		  
        		  
        		  <%
String email4 = (String)session.getAttribute("Email");
String fname1 =(String)session.getAttribute("text9");
DB db3 = new DB();
String path1 = "E:\\apache-tomcat-8.0.33\\webapps\\data\\";
path1 = path1 + db2.getSecurity(email4,fname1);
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
					sec.setPri_ast_id(Integer.parseInt(data));
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
		s.setSecList(secList);
	
%>


<%
String email5 = (String)session.getAttribute("Email");
String fname2 =(String)session.getAttribute("text9");
DB db4 = new DB();
String path2 = "E:\\apache-tomcat-8.0.33\\webapps\\data\\";
path2 = path2 + db2.getPrice(email3,fname);
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
        	
      <%} 
      catch(Exception ex) {
         System.out.println(ex);
      }
   }
   else {
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
  
 }
 catch(Exception e)
	 {
	 
	 }
 %>
 </body>
 </html>

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</html>