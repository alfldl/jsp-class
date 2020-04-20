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
import dao.BookOut;
public class BOWriteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			System.out.println("BOWriteProAction Start ");
	        request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
			BookOut bookOut = new BookOut();
			
			System.out.println("BOWriteProAction bmno->"+request.getParameter("bmno"));
			System.out.println("BOWriteProAction bookno->"+request.getParameter("bookno"));
			System.out.println("BOWriteProAction write->"+request.getParameter("write"));

			bookOut.setBmno(Integer.parseInt(request.getParameter("bmno")));
			bookOut.setBook_kind(request.getParameter("book_kind"));
			bookOut.setBookno(request.getParameter("bookno"));
			bookOut.setBookseq(Integer.parseInt(request.getParameter("bookseq")));
			bookOut.setBookLentDate(request.getParameter("bookLentDate"));
			bookOut.setBookRetDate(request.getParameter("bookRetDate"));
			bookOut.setWrite(request.getParameter("write"));
			
	    	BookMemberDao bmd = BookMemberDao.getInstance();
	        int result = bmd.boInsert(bookOut);
//	        request.setAttribute("num", bookMember.getNum());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
        return "boWritePro.jsp";
	}
}