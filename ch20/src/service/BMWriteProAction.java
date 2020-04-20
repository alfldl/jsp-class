package service;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.BookMember;
import dao.BookMemberDao;
public class BMWriteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
	        request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        BookMember bookMember = new BookMember();
	        bookMember.setPasswd(request.getParameter("passwd"));
	        bookMember.setBmname(request.getParameter("bmname"));
	        bookMember.setBmaddr(request.getParameter("bmaddr"));
	        bookMember.setBmtel(request.getParameter("bmtel"));
	        bookMember.setBmloc(request.getParameter("bmloc"));
	        bookMember.setBmgrade(request.getParameter("bmgrade"));
			
	    	BookMemberDao bmd = BookMemberDao.getInstance();
	        int result = bmd.bmInsert(bookMember);
//	        request.setAttribute("num", bookMember.getNum());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
        return "bmWritePro.jsp";
	}


}