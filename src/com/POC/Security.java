package com.POC;

import java.util.ArrayList;

public class Security {
	
     private String sec_al;
     private int pri_ast_id;
     private String ticker;
     private String src_intfc_inst;
     private String upt_date;
     private String upt_src;
     private String eid;
     public ArrayList<Security> list1;
     private String Fileid;
	public ArrayList<Security> getList1() {
		return list1;
	}
	public void setList1(ArrayList<Security> list1) {
		this.list1 = list1;
	}
	public String getFileid() {
		return Fileid;
	}
	public void setFileid(String fileid) {
		Fileid = fileid;
	}
	public String getSec_al() {
		return sec_al;
	}
	public void setSec_al(String sec_al) {
		this.sec_al = sec_al;
	}
	public int getPri_ast_id() {
		return pri_ast_id;
	}
	public void setPri_ast_id(int pri_ast_id) {
		this.pri_ast_id = pri_ast_id;
	}
	public String getTicker() {
		return ticker;
	}
	public void setTicker(String ticker) {
		this.ticker = ticker;
	}
	public String getSrc_intfc_inst() {
		return src_intfc_inst;
	}
	public void setSrc_intfc_inst(String src_intfc_inst) {
		this.src_intfc_inst = src_intfc_inst;
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
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	
	
	@Override
	public String toString() {
		return "Security [sec_al=" + sec_al + ", pri_ast_id=" + pri_ast_id + ", ticker=" + ticker + ", src_intfc_inst="
				+ src_intfc_inst + ", upt_date=" + upt_date + ", upt_src=" + upt_src + ", eid=" + eid + "]";
	}
     
}
