package dao;

import java.util.Date;

public class BookIn {
	private String book_kind;
	private String bookno;
	private int      bookseq;
	private String bookname;
	private String write;
	private String bookcredate;
	private String bookstate;
	private String booklent_yn;
	private Date   reg_date;
	private String check;
	private String check1;
	
	public String getCheck1() {
		return check1;
	}
	public void setCheck1(String check1) {
		this.check1 = check1;
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
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
	}
	public String getBookcredate() {
		return bookcredate;
	}
	public void setBookcredate(String bookcredate) {
		this.bookcredate = bookcredate;
	}
	public String getBookstate() {
		return bookstate;
	}
	public void setBookstate(String bookstate) {
		this.bookstate = bookstate;
	}
	public String getBooklent_yn() {
		return booklent_yn;
	}
	public void setBooklent_yn(String booklent_yn) {
		this.booklent_yn = booklent_yn;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}


}
