package com.POC;


import java.util.ArrayList;

public class Entity {
	

		private String inc_date;
		private String eid;
		private String ename;
		private int pri_ast_id ;
		private int bank_br_code;
		private String status;
		private String ter_date;
		private String upt_date;
		private String upt_src;
		public ArrayList<Entity> list1;
		public String getInc_date() {
			return inc_date;
		}
		public void setInc_date(String inc_date) {
			this.inc_date = inc_date;
		}
		public String getEid() {
			return eid;
		}
		public void setEid(String eid) {
			this.eid = eid;
		}
		public String getEname() {
			return ename;
		}
		public void setEname(String ename) {
			this.ename = ename;
		}
		public int getPri_ast_id() {
			return pri_ast_id;
		}
		public void setPri_ast_id(int pri_ast_id) {
			this.pri_ast_id = pri_ast_id;
		}
		public int getBank_br_code() {
			return bank_br_code;
		}
		public void setBank_br_code(int bank_br_code) {
			this.bank_br_code = bank_br_code;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getTer_date() {
			return ter_date;
		}
		public void setTer_date(String ter_date) {
			this.ter_date = ter_date;
		}
		public String getUpt_date() {
			return upt_date;
		}
		public void setUpt_date(String upt_date) {
			this.upt_date = upt_date;
		}
		public String getUpt_src() {
			return upt_src;
		}
		public void setUpt_src(String upt_src) {
			this.upt_src = upt_src;
		}
		
		public ArrayList<Entity> getEntList()
  	    {
  	    	
  	    	return list1;
  	    }
		
		public ArrayList<Entity> setEntList(ArrayList<Entity> list1 )
  	    {
  	    	
  	    	this.list1 = list1;
  	    	return list1;
  	    }
		
		@Override
		public String toString() {
			return "Entity [inc_date=" + inc_date + ", eid=" + eid + ", ename=" + ename + ", pri_ast_id=" + pri_ast_id
					+ ", bank_br_code=" + bank_br_code + ", status=" + status + ", ter_date=" + ter_date + ", upt_date="
					+ upt_date + ", upt_src=" + upt_src + "]";
		}
		
		
}


