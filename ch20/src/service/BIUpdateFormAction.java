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
public class BIUpdateFormAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			BookIn bookIn1 = new BookIn();
			bookIn1.setBook_kind(request.getParameter("book_kind"));
			bookIn1.setBookno(request.getParameter("bookno"));
			bookIn1.setBookseq(Integer.parseInt(request.getParameter("bookseq")));

			String pageNum = request.getParameter("pageNum");
			BookMemberDao bmd = BookMemberDao.getInstance();
			BookIn  bookIn = bmd.biSelect(bookIn1);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("bookIn", bookIn);
		}catch(Exception e) {	System.out.println(e.getMessage());	}
		return "biUpdateForm.jsp";
	}
}