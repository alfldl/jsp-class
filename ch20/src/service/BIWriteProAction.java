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
public class BIWriteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
	        request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
			BookIn bookIn = new BookIn();
			bookIn.setBook_kind(request.getParameter("book_kind"));
			bookIn.setBookno(request.getParameter("bookno"));
			bookIn.setBookseq(Integer.parseInt(request.getParameter("bookseq")));
			bookIn.setBookname(request.getParameter("bookname"));
			bookIn.setWrite(request.getParameter("write"));
			bookIn.setBookcredate(request.getParameter("bookcredate"));
			bookIn.setBookstate(request.getParameter("bookstate"));
			bookIn.setBooklent_yn(request.getParameter("booklent_yn"));
			
	    	BookMemberDao bmd = BookMemberDao.getInstance();
	        int result = bmd.biInsert(bookIn);
//	        request.setAttribute("num", bookMember.getNum());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
        return "biWritePro.jsp";
	}
}