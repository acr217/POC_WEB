package com.POC;
import java.awt.List;
import java.sql.*;
import java.util.ArrayList;  
		public class DB{  
		private Connection con;
		private Statement stmt;
		private Statement stmt1;
		private Statement stmt2;
		private Statement stmt3;
		private Statement stmt4;
		private Statement stmt5;
		private Statement stmt6;
		private Statement stmt7;
		private Statement stmt8;
		private Statement stmt9;
		private Statement stmt10;
		private Statement stmt11;
		private Statement stmt12;
		private Statement stmt13;
		private Statement stmt14;
		public DB(){
			
		try{ 
			
		Class.forName("com.mysql.jdbc.Driver");  
		con = DriverManager.getConnection(  "jdbc:mysql://localhost:3306/poc_web","root","root");  
	 
		}
		catch(Exception e)
		{ 
			System.out.println(e);
			
		}
		  
		}  
		
		public boolean ifUserExists(String email,String pass ) throws SQLException
		{
			boolean check = false; 
			stmt=con.createStatement();  
			ResultSet rs=stmt.executeQuery(""
					+ "select Email,Password from credentials where Email='"+email+"' and Password='"+pass+"'");  
			if(rs.next()) { 
			check = true; 
			System.out.println("Correct");
			}
			con.close(); 
			return check;
		}
/*	public static void main(String args[]) throws Exception
		{
		     new DB().getfilestatus("aa");
		    
			/*new DB().ifUserExists("a@gmail.com", "a"); 
			//new DB().Insertdata("a@gmail.com","acr","qw","er","ty");
			//new DB().ajaxreq("acr","a@gmail.com");
			String id = new DB().getFileid2("ffprice.csv");
			String id1 = new DB().getFileid1("ffsecurity.csv");
			String id2 = new DB().getFileid("ffentity.csv");
			System.out.println(id);
			System.out.println(id1);
			System.out.println(id2);
		}
		*/
		public int Insertdata(String email,String fname,String entity,String price) throws SQLException
		{
			
			stmt1 = con.createStatement();  
			int i1 = stmt1.executeUpdate("insert into filenames(Email,Fname,entity,price) values('"+email+"','"+fname+"','"+entity+"','"+price+"')");
			
			System.out.println("Correct");
			
			con.close(); 
			return i1;
			
		
		
		
		}
		public boolean ajaxreq(String msg,String email8) throws SQLException
		{
			stmt2 = con.createStatement();  
			ResultSet rs = stmt2.executeQuery("select Fname from filenames where Fname='"+msg+"' and Email='"+email8+"' ");
			if(rs.next()){
				System.out.println("true");
				return true;
				
			}
			else 
				return false;
		}
		
		public String getEntitySecurity(String email,String fname) throws SQLException
		{
			stmt3 = con.createStatement(); 
			ResultSet rs = stmt3.executeQuery("select * from filenames where Fname='"+fname+"' and Email='"+email+"' ");
			if(rs.next())
			{
				return rs.getString(3);
			}
			else 
				return null;
		}
		
		
		public String getPrice(String email,String fname) throws SQLException
		{
			stmt3 = con.createStatement(); 
			ResultSet rs = stmt3.executeQuery("select * from filenames where Fname='"+fname+"' and Email='"+email+"' ");
			if(rs.next())
			{
				return rs.getString(4);
			}
			else 
				return null;
		}
		
		public ResultSet getFiles(String email) throws SQLException
		{
			stmt4 = con.createStatement(); 
			ResultSet rs = stmt4.executeQuery("select * from filenames where Email='"+email+"' ");
			return rs;
		}
		
		@SuppressWarnings("null")
		public boolean uploadentitysecurity(ArrayList<EntitySecurity> l1,String email,String fileid) throws Exception
		{
			DB dbb = new DB();
			
			
			stmt5 = con.createStatement(); 
			stmt6 = con.createStatement(); 
			int i1 =0 ;
			
				int i =0;	
			try{
				ResultSet ff = dbb.getfilestatus(fileid);
				System.out.println(ff.getString(5)+"ff");
				if(ff.getString(5).equals("0")){
			for(EntitySecurity ll1 : l1){
				Statement cStmt = null ;
				System.out.println(ll1.getInc_date());
				
				System.out.println(ll1.getEid());
				
				System.out.println(ll1.getEname());
			
				System.out.println(ll1.getPri_ast_id());
			
				System.out.println(ll1.getBank_br_code());
				
				System.out.println(ll1.getStatus());
			
				System.out.println(ll1.getTer_date());
			
				System.out.println(ll1.getSec_al());
				
				System.out.println(ll1.getTicker());
				String hello = null;
			            cStmt = con.createStatement();
						String query = "call Security_Ingestion('"+ll1.getInc_date()+"','"+ll1.getEid()+"','"+ll1.getEname()+"','"+ll1.getPri_ast_id()+"','"+ll1.getBank_br_code()+"','"+ll1.getStatus()+"','"+ll1.getTer_date()+"','"+ll1.getSec_al()+"','"+ll1.getTicker()+"','"+fileid+"','"+email+"')";
						cStmt.executeQuery(query);

			}
			
				}
				else
					return false;
		}
			catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("Exception caught");
				return false;
			}
				return true;
			
		}
		
	     public boolean filestatus(String id )
	     {
	    	 try
	    	 {
	    	 stmt14 = con.createStatement(); 
	    	 String df = "1";
				int gg = stmt14.executeUpdate("update filenames set entstatus = '"+df+"' where Fname = '"+id+"'");
				
	    	 }
	    	 catch(Exception e)
	    	 {
	    		 return false;
	    	 }
	    	 return true;
	     }
	     

	     public boolean prifilestatus(String id )
	     {
	    	 try
	    	 {
	    	 Statement stmt16 = con.createStatement(); 
	    	 String df = "1";
				int gg1 = stmt16.executeUpdate("update filenames set pristatus  = '"+df+"' where Fname = '"+id+"'");
				
	    	 }
	    	 catch(Exception e)
	    	 {
	    		 return false;
	    	 }
	    	 return true;
	     }
		  
	     public ResultSet getfilestatus(String id )
	     {
	    		ResultSet rs;
	    	 try
	    	 {
	    	 Statement stmt15 = con.createStatement(); 
				rs = stmt15.executeQuery("select * from filenames where Fname = '"+id+"' ");
				rs.absolute(1);
			     System.out.println(rs.getString(5));
			     System.out.println(rs.getString(6));
				
	    	 }
	    	 catch(Exception e)
	    	 {
	    		 e.printStackTrace();
	    		 return null;
	    	 }
	    	 return rs;
	     }
	     
	     
		public boolean uploadprice(ArrayList<Price> l1,String email,String fileid) throws Exception
		{
			
			
			stmt10 = con.createStatement(); 
			int i1 =0 ;
	            DB dbb1 = new DB();
		
			try{
				ResultSet ff1 = dbb1.getfilestatus(fileid);
				System.out.println(ff1.getString(6)+"ff");
				if(ff1.getString(6).equals("0")){
			
			for(Price pp1 : l1){
				Statement stmt9 = null;
				stmt9 = con.createStatement(); 
				
				String query1 = "call price_temp('"+pp1.getEff_date()+"','"+pp1.getSec_al()+"','"+pp1.getPr_val()+"','"+pp1.getPx_lval()+"','"+pp1.getCur_nav()+"','"+pp1.getSubs()+"','"+pp1.getReds()+"','"+pp1.getEx_subs()+"','"+pp1.getEx_reds()+"','"+pp1.getOut_sh()+"','"+fileid+"','"+email+"')";
				stmt9.executeQuery(query1);
			      
		}
		}
		else
			return false;
}
	catch(Exception e)
	{
		e.printStackTrace();
		System.out.println("Exception caught");
		return false;
	}
		return true;
	
}
		
		public String getFileid(String file)
		{
			try{
				
			stmt11 = con.createStatement(); 
			System.out.println(file);
			ResultSet rs2 = stmt11.executeQuery("select * from filenames where entity='"+file+"'");
			rs2.absolute(1);
			System.out.println("Hello "+rs2.getString(2));
				return rs2.getString(2);
				
		}
		
		catch(Exception e)
		{
			
		}
			return null;
		}
		public String getFileid1(String file)
		{
			try{	
			stmt12 = con.createStatement(); 
			System.out.println(file);
			ResultSet rs2 = stmt12.executeQuery("select * from filenames where security='"+file+"'");
			rs2.absolute(1);
			System.out.println("Hello "+rs2.getString(2));
				return rs2.getString(2);
			
		}
		catch(Exception e)
			{
			
			}
		return null;	
		}
		public String getFileid2(String file) 
		{
			try{
			stmt13 = con.createStatement(); 
			System.out.println(file);
			ResultSet rs2 = stmt13.executeQuery("select * from filenames where price='"+file+"'");
			rs2.absolute(1);
			//System.out.println(rs2.getString(2));
			
				return rs2.getString(2);
				
		}
			
		
		catch(Exception e)
		{
			
		}
			return null;
		}
		
		public ResultSet reportGen(String fileid) throws SQLException
		{
			ResultSet rs = null;
		try{
		Statement stmt10 = con.createStatement();
		String query ="call daily_perf1('"+fileid+"')";
		stmt10.executeQuery(query);
		Statement stmt11 = con.createStatement();
		String query1 = "select * from daily_perf_arun where Fileid = '"+fileid+"'";
		rs = stmt11.executeQuery(query1);
		}
		catch(Exception e)
		{
			return null;
		}
			return rs;
		}
		
		}	
	
 
		