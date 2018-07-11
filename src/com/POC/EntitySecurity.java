package com.POC;


import java.util.ArrayList;

public class EntitySecurity {
	

		private String inc_date;
		private String eid;
		private String ename;
		private int pri_ast_id ;
		private int bank_br_code;
		private String status;
		private String ter_date;
		private String sec_al;
		private String ticker;
		public ArrayList<EntitySecurity> list1;
		private String Fileid;
		
		
		public String getSec_al() {
			return sec_al;
		}
		public void setSec_al(String sec_al) {
			this.sec_al = sec_al;
		}
		public String getTicker() {
			return ticker;
		}
		public void setTicker(String ticker) {
			this.ticker = ticker;
		}

		public ArrayList<EntitySecurity> getList1() {
			return list1;
		}
		public void setList1(ArrayList<EntitySecurity> list1) {
			this.list1 = list1;
		}
		public String getFileid() {
			return Fileid;
		}
		public void setFileid(String fileid) {
			Fileid = fileid;
		}
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
		@Override
		public String toString() {
			return "EntitySecurity [inc_date=" + inc_date + ", eid=" + eid + ", ename=" + ename + ", pri_ast_id="
					+ pri_ast_id + ", bank_br_code=" + bank_br_code + ", status=" + status + ", ter_date=" + ter_date
					+ ", sec_al=" + sec_al + ", ticker=" + ticker + ", list1=" + list1 + ", Fileid=" + Fileid
					+ ", getSec_al()=" + getSec_al() + ", getTicker()=" + getTicker() + ", getList1()=" + getList1()
					+ ", getFileid()=" + getFileid() + ", getInc_date()=" + getInc_date() + ", getEid()=" + getEid()
					+ ", getEname()=" + getEname() + ", getPri_ast_id()=" + getPri_ast_id() + ", getBank_br_code()="
					+ getBank_br_code() + ", getStatus()=" + getStatus() + ", getTer_date()=" + getTer_date() + "]";
		}
		
		
		
		
		
		
}


