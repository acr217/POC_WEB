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
	public static void main(String args[]) throws Exception
		{
			//new DB().ifUserExists("a@gmail.com", "a"); 
			//new DB().Insertdata("a@gmail.com","acr","qw","er","ty");
			//new DB().ajaxreq("acr","a@gmail.com");
			String id = new DB().getFileid2("ffprice.csv");
			String id1 = new DB().getFileid1("ffsecurity.csv");
			String id2 = new DB().getFileid("ffentity.csv");
			System.out.println(id);
			System.out.println(id1);
			System.out.println(id2);
		}
		
		public int Insertdata(String email,String fname,String entity,String price) throws SQLException
		{
			
			stmt1 = con.createStatement();  
			int i1 = stmt1.executeUpdate("insert into filenames values('"+email+"','"+fname+"','"+entity+"','"+price+"')");
			
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
		
		public boolean uploadentitysecurity(ArrayList<EntitySecurity> l1,String email,String fileid) throws Exception
		{
			
			stmt5 = con.createStatement(); 
			stmt6 = con.createStatement(); 
			int i1 =0 ;
			CallableStatement cStmt = con.prepareCall("{call Security_Ingestion(?,?,?,?,?,?,?,?,?)}");
			for(int i=0;i < l1.size();i++){
				
				cStmt.setString(1, l1.get(i).getInc_date());
				cStmt.setString(2, l1.get(i).getEid());
				cStmt.setString(3, l1.get(i).getEname());
				cStmt.setInt(4, l1.get(i).getPri_ast_id());
				cStmt.setInt(5, l1.get(i).getBank_br_code());
				cStmt.setString(6, l1.get(i).getStatus());
				cStmt.setString(7, l1.get(i).getTer_date());
				cStmt.setString(8, l1.get(i).getSec_al());
				cStmt.setString(9, l1.get(i).getTicker());
				stmt5.executeUpdate("insert into entity_temp_arun(Fileid,Email) values('"+fileid+"','"+email+"')");
		         stmt6.executeUpdate("insert into securitydata(Fileid,Email) values('"+fileid+"','"+email+"')");
				cStmt.execute();
		}
			
				return true;
			
		}
		
	
		
		public boolean uploadprice(ArrayList<Price> l1,String email,String fileid) throws Exception
		{
			
			stmt9 = con.createStatement(); 
			stmt10 = con.createStatement(); 
			int i1 =0 ;
			CallableStatement cStmt = con.prepareCall("{call price_temp(?, ?,?,?,?,?,?,?,?,?)}");
			
			for(int i=0;i<l1.size();i++){
				
				cStmt.setString(1, l1.get(i).getEff_date());
				cStmt.setString(2, l1.get(i).getSec_al());
				cStmt.setInt(3, l1.get(i).getPr_val());
				cStmt.setInt(4, l1.get(i).getPx_lval());
				cStmt.setInt(5, l1.get(i).getCur_nav());
				cStmt.setInt(6, l1.get(i).getSubs());
				cStmt.setInt(7, l1.get(i).getReds());
				cStmt.setInt(8, l1.get(i).getEx_reds());
				cStmt.setInt(9, l1.get(i).getEx_subs());
				cStmt.setInt(10, l1.get(i).getOut_sh());
				int i2 = stmt9.executeUpdate("insert into price_temp_arun(Fileid,Email) values('"+fileid+"','"+email+"')");
				
			    cStmt.execute();
			      
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
		}	
	
 
		