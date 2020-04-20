package service;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.BookIn;
import dao.BookMember;
import dao.BookMemberDao;
public class BIUpdateProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try { 
			request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        String book_kind = request.getParameter("book_kind");
	        String bookno = request.getParameter("bookno");
	        int      bookseq =Integer.parseInt(request.getParameter("bookseq"));
			BookIn bookIn = new BookIn();
			bookIn.setBook_kind(request.getParameter("book_kind"));
			bookIn.setBookno(request.getParameter("bookno"));
			bookIn.setBookseq(Integer.parseInt(request.getParameter("bookseq")));
			bookIn.setBookname(request.getParameter("bookname"));
			bookIn.setWrite(request.getParameter("write"));
			bookIn.setBookcredate(request.getParameter("bookcredate"));
			bookIn.setBookstate(request.getParameter("bookstate"));
			bookIn.setBooklent_yn(request.getParameter("booklent_yn"));
	        System.out.println("BIUpdateProAction bookno->"+request.getParameter("bookno"));
	        System.out.println("BIUpdateProAction bookname->"+request.getParameter("bookname"));
	        System.out.println("BIUpdateProAction write->"+request.getParameter("write"));
	    	BookMemberDao bmd = BookMemberDao.getInstance();
			int result = bmd.biUpdate(bookIn);
			
			request.setAttribute("result", result);
			request.setAttribute("bookIn",bookIn);
	//		request.setAttribute("bookno", bookIn.getBookno());
	//		request.setAttribute("bookseq", bookIn.getBookseq());
			request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "biUpdatePro.jsp";
	}
}