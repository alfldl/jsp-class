package service;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.BookMember;
import dao.BookMemberDao;
public class BMUpdateProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try { 
			request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        BookMember bookMember = new BookMember();
	        bookMember.setBmno(Integer.parseInt(request.getParameter("bmno")));
	        bookMember.setPasswd(request.getParameter("passwd"));
	        bookMember.setBmname(request.getParameter("bmname"));
	        bookMember.setBmaddr(request.getParameter("bmaddr"));
	        bookMember.setBmtel(request.getParameter("bmtel"));
	        bookMember.setBmloc(request.getParameter("bmloc"));
	        bookMember.setBmgrade(request.getParameter("bmgrade"));
	        bookMember.setNoretcnt(Integer.parseInt(request.getParameter("noretcnt")));
	        System.out.println("BMUpdateProAction passwd->"+request.getParameter("passwd"));
	        System.out.println("BMUpdateProAction bmaddr->"+request.getParameter("bmaddr"));
	        System.out.println("BMUpdateProAction bmgrade->"+request.getParameter("bmgrade"));
	    	BookMemberDao bmd = BookMemberDao.getInstance();
			int result = bmd.bmUpdate(bookMember);
			
			request.setAttribute("result", result);
			request.setAttribute("bmno", bookMember.getBmno());
			request.setAttribute("pageNum", pageNum);
		} catch(Exception e) { 
			System.out.println(e.getMessage()); 
		}
		return "bmUpdatePro.jsp";
	}
}