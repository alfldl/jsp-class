package dao;

import java.util.Date;

public class BookOut {
	private int       bmno;
	private String book_kind;
	private String bookno;
	private int      bookseq;
	private String bookLentDate;
	private String bookRetDate;
	private int      bookLentDay;
	private String write;
	private String bookRet_yn;
	private Date   reg_date;
	
	private String bmname;

	public int getBmno() {
		return bmno;
	}
	public void setBmno(int bmno) {
		this.bmno = bmno;
	}
		
	public String getBmname() {
		return bmname;
	}
	public void setBmname(String bmname) {
		this.bmname = bmname;
	}
	public String getBook_kind() {
		return book_kind;
	}
	public void setBook_kind(String book_kind) {
		this.book_kind = book_kind;
	}
	public String getBookno() {
		return bookno;
	}
	public void setBookno(String bookno) {
		this.bookno = bookno;
	}
	public int getBookseq() {
		return bookseq;
	}
	public void setBookseq(int bookseq) {
		this.bookseq = bookseq;
	}
	public String getBookLentDate() {
		return bookLentDate;
	}
	public void setBookLentDate(String bookLentDate) {
		this.bookLentDate = bookLentDate;
	}
	public String getBookRetDate() {
		return bookRetDate;
	}
	public void setBookRetDate(String bookRetDate) {
		this.bookRetDate = bookRetDate;
	}
	public int getBookLentDay() {
		return bookLentDay;
	}
	public void setBookLentDay(int bookLentDay) {
		this.bookLentDay = bookLentDay;
	}
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
	}
	public String getBookRet_yn() {
		return bookRet_yn;
	}
	public void setBookRet_yn(String bookRet_yn) {
		this.bookRet_yn = bookRet_yn;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
	

}
