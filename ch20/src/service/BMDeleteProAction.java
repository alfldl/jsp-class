package service;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.BookMemberDao;
public class BMDeleteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			int bmno = Integer.parseInt(request.getParameter("bmno"));
			String passwd = request.getParameter("passwd");
			String pageNum = request.getParameter("pageNum");
	    	BookMemberDao bmd = BookMemberDao.getInstance();
			int result = bmd.bmDelete(bmno, passwd);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("bmno", bmno);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "bmDeletePro.jsp";
	}
}