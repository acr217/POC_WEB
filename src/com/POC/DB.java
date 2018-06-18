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
		/*public static void main(String args[]) throws SQLException
		{
			new DB().ifUserExists("a@gmail.com", "a"); 
			new DB().Insertdata("a@gmail.com","acr","qw","er","ty");
			new DB().ajaxreq("acr","a@gmail.com");
		}*/
		
		public int Insertdata(String email,String fname,String entity,String security,String price) throws SQLException
		{
			
			stmt1 = con.createStatement();  
			int i1 = stmt1.executeUpdate("insert into filenames values('"+email+"','"+fname+"','"+entity+"','"+security+"','"+price+"')");
			
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
		
		public String getEntity(String email,String fname) throws SQLException
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
		
		public String getSecurity(String email,String fname) throws SQLException
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
		
		public String getPrice(String email,String fname) throws SQLException
		{
			stmt3 = con.createStatement(); 
			ResultSet rs = stmt3.executeQuery("select * from filenames where Fname='"+fname+"' and Email='"+email+"' ");
			if(rs.next())
			{
				return rs.getString(5);
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
		
		public boolean uploadentity(ArrayList<Entity> l1,String email,String fileid) throws Exception
		{
			
			stmt5 = con.createStatement(); 
			stmt6 = con.createStatement(); 
			int i1 =0 ;
			for(int i=0;i < l1.size();i++){
				
			
			i1 = stmt5.executeUpdate("insert into entity_temp_arun values('"+l1.get(i).getInc_date()+"','"+l1.get(i).getEid()+"','"+l1.get(i).getEname()+"','"+l1.get(i).getPri_ast_id()+"','"+l1.get(i).getBank_br_code()+"','"+l1.get(i).getStatus()+"','"+l1.get(i).getTer_date()+"','"+l1.get(i).getUpt_date()+"','"+l1.get(i).getUpt_src()+"')");
			
				int i2 = stmt6.executeUpdate("insert into entitydata values('"+email+"','"+fileid+"','"+l1.get(i).getEid()+"')");
			
		}
			
				return true;
			
		}
		
		public boolean uploadsecurity(ArrayList<Security> l1,String email,String fileid) throws Exception
		{
			
			stmt7 = con.createStatement(); 
			stmt8 = con.createStatement(); 
			int i1 =0 ;
			for(int i=0;i < l1.size();i++){
				
			
			i1 = stmt7.executeUpdate("insert into securitydata values('"+l1.get(i).getSec_al()+"','"+l1.get(i).getPri_ast_id()+"','"+l1.get(i).getTicker()+"','"+l1.get(i).getSrc_intfc_inst()+"','"+l1.get(i).getUpt_date()+"','"+l1.get(i).getUpt_src()+"','"+l1.get(i).getEid()+"')");
			
				int i2 = stmt8.executeUpdate("insert into securitydata1 values('"+email+"','"+fileid+"','"+l1.get(i).getSec_al()+"','"+l1.get(i).getEid()+"')");
			
		}
			
				return true;
			
		}
		
		public boolean uploadprice(ArrayList<Price> l1,String email,String fileid) throws Exception
		{
			
			stmt9 = con.createStatement(); 
			stmt10 = con.createStatement(); 
			int i1 =0 ;
			for(int i=0;i<l1.size();i++){
				
			
			i1 = stmt9.executeUpdate("insert into price_temp_arun values('"+l1.get(i).getEff_date()+"','"+l1.get(i).getSec_al()+"','"+l1.get(i).getSrc_intfc_inst()+"','"+l1.get(i).getUpt_date()+"','"+l1.get(i).getUpt_src()+"','"+l1.get(i).getPr_val()+"','"+l1.get(i).getPx_lval()+"','"+l1.get(i).getCur_nav()+"','"+l1.get(i).getSubs()+"','"+l1.get(i).getReds()+"','"+l1.get(i).getEx_subs()+"','"+l1.get(i).getEx_reds()+"','"+l1.get(i).getOut_sh()+"')");
			
				int i2 = stmt10.executeUpdate("insert into pricedata values('"+email+"','"+fileid+"','"+l1.get(i).getSec_al()+"')");
			
		}
			
				return true;
			
		}
		
		
		}	
	

		