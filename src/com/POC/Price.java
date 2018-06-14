package com.POC;

public class Price {

	private String eff_date;
	private String sec_al;
	private String src_intfc_inst;
	private String upt_date;
	private String upt_src;
	private int pr_val;
	private int px_lval;
	private int cur_nav;
	private int subs;
	private int reds;
	private int ex_subs;
	private int ex_reds;
	private int out_sh;
	public String getEff_date() {
		return eff_date;
	}
	public void setEff_date(String eff_date) {
		this.eff_date = eff_date;
	}
	public String getSec_al() {
		return sec_al;
	}
	public void setSec_al(String sec_al) {
		this.sec_al = sec_al;
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
	public int getPr_val() {
		return pr_val;
	}
	public void setPr_val(int pr_val) {
		this.pr_val = pr_val;
	}
	public int getPx_lval() {
		return px_lval;
	}
	public void setPx_lval(int px_lval) {
		this.px_lval = px_lval;
	}
	public int getCur_nav() {
		return cur_nav;
	}
	public void setCur_nav(int cur_nav) {
		this.cur_nav = cur_nav;
	}
	public int getSubs() {
		return subs;
	}
	public void setSubs(int subs) {
		this.subs = subs;
	}
	public int getReds() {
		return reds;
	}
	public void setReds(int reds) {
		this.reds = reds;
	}
	public int getEx_subs() {
		return ex_subs;
	}
	public void setEx_subs(int ex_subs) {
		this.ex_subs = ex_subs;
	}
	public int getEx_reds() {
		return ex_reds;
	}
	public void setEx_reds(int ex_reds) {
		this.ex_reds = ex_reds;
	}
	public int getOut_sh() {
		return out_sh;
	}
	public void setOut_sh(int out_sh) {
		this.out_sh = out_sh;
	}
	@Override
	public String toString() {
		return "Price [eff_date=" + eff_date + ", sec_al=" + sec_al + ", src_intfc_inst=" + src_intfc_inst
				+ ", upt_date=" + upt_date + ", upt_src=" + upt_src + ", pr_val=" + pr_val + ", px_lval=" + px_lval
				+ ", cur_nav=" + cur_nav + ", subs=" + subs + ", reds=" + reds + ", ex_subs=" + ex_subs + ", ex_reds="
				+ ex_reds + ", out_sh=" + out_sh + "]";
	}
	
}
