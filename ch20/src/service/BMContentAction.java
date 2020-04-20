package service;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.BookMember;
import dao.BookMemberDao;
public class BMContentAction implements CommandProcess{
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			try {
				int bmno = Integer.parseInt(request.getParameter("bmno"));
				String pageNum = request.getParameter("pageNum");
				BookMemberDao bmd = BookMemberDao.getInstance();
				BookMember  bookMember = bmd.bmSelect(bmno);
				
				request.setAttribute("bmno", bmno);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("bookMember", bookMember);
			} catch(Exception e) { 
				System.out.println(e.getMessage()); 
			}
			return "bmContent.jsp";
	}
}