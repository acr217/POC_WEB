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
	 List<EntitySecurity> Entlist = null;
	 List<Price> Prilist = null;
 String email2 = (String)session.getAttribute("Email");
 String text5 = (String)session.getAttribute("text9");

   File file ;
   String text = text5;
   int j = 0;
   int k = 0;
   String fileName1[] = new String[2];
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
               j++;
               //out.println(fileName);
               // Write the file
              /* 
                if( fileName1[k].lastIndexOf("\\") >= 0 ) {
                   file = new File( filePath + 
                   fileName1[k].substring( fileName1[k].lastIndexOf("\\"))) ;
                } else {
                   file = new File( filePath + 
                   fileName1[k].substring(fileName1[k].lastIndexOf("\\")+1)) ;
                }
                fi.write( file ) ;
                System.out.println("Uploaded Filename: " + filePath + 
                fileName1[k] + "<br>");
                   
               k++; */
                    }
           
         }
            
         
            out.println(fileName1[0].equals(fileName1[1]));
               if(fileName1[0].equals(fileName1[1]))
               {
            	   response.sendRedirect("Home.jsp?FileFormError=2&email="+email2+"");
               }
               
              if(fileName1[0].equals(email2) || fileName1[1].equals(email2))
              {
            	   response.sendRedirect("Home.jsp?FileFormError=1&email="+email2+"");
            	  
               }
             
  
         //out.println(fileName1[0]);
         //out.println(fileName1[1]);
        // out.println(fileName1[2]);
         
        	 DB db = new DB();
        	 int d=0;
        	 try{
        			d = db.Insertdata(email2,text5,fileName1[0],fileName1[1]);
        	 }
        	 catch(Exception e){}
        	if(d < 1)
        	{
        		response.sendRedirect("Home.jsp?dberror1=1&email="+email2+"");
        		
        	
        	}
        

               // Process the uploaded file items
              

             

         // Process the uploaded file items
         Iterator<FileItem> i1 = fileItems.iterator();
              
          FileItem fi1 = null;
               while ( i1.hasNext () ) {
                   fi1 = (FileItem)i1.next();
                  if ( !fi1.isFormField () ) {
        	 if( fileName1[k].lastIndexOf("\\") >= 0 ) {
                 file = new File( filePath + 
                 fileName1[k].substring( fileName1[k].lastIndexOf("\\"))) ;
              } else {
                 file = new File( filePath + 
                 fileName1[k].substring(fileName1[k].lastIndexOf("\\")+1)) ;
              }
              fi1.write( file ) ;
              System.out.println("Uploaded Filename: " + filePath + 
              fileName1[k] + "<br>");
              k++;
                  }
               }
        	
        	
      }
  
        	catch(Exception e)
      {
      }
   
      }
      }
   
	catch(Exception e)
    {
    }

 %>
 </body>
 </html>

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</html>