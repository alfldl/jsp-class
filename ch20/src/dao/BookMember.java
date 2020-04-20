package dao;

import java.util.Date;

public class BookMember {
	private int      bmno;
	private String passwd;
	private String bmname;
	private String bmaddr;
	private String bmtel;
	private String bmloc;
	private String bmgrade;
	private int      noretcnt;
	private String lent_yn;
	private Date reg_date;
	public int getBmno() {
		return bmno;
	}
	public void setBmno(int bmno) {
		this.bmno = bmno;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getBmname() {
		return bmname;
	}
	public void setBmname(String bmname) {
		this.bmname = bmname;
	}
	public String getBmaddr() {
		return bmaddr;
	}
	public void setBmaddr(String bmaddr) {
		this.bmaddr = bmaddr;
	}
	public String getBmtel() {
		return bmtel;
	}
	public void setBmtel(String bmtel) {
		this.bmtel = bmtel;
	}
	public String getBmloc() {
		return bmloc;
	}
	public void setBmloc(String bmloc) {
		this.bmloc = bmloc;
	}
	public String getBmgrade() {
		return bmgrade;
	}
	public void setBmgrade(String bmgrade) {
		this.bmgrade = bmgrade;
	}
	public int getNoretcnt() {
		return noretcnt;
	}
	public void setNoretcnt(int noretcnt) {
		this.noretcnt = noretcnt;
	}
	public String getLent_yn() {
		return lent_yn;
	}
	public void setLent_yn(String lent_yn) {
		this.lent_yn = lent_yn;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
	
	
}
