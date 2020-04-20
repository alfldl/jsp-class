package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookMemberDao;

public class LoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		BookMemberDao bm = BookMemberDao.getInstance();
		try { 	
					String bmno = request.getParameter("bmno");	
					String passwd = request.getParameter("passwd");	
					int result = bm.check(bmno, passwd);
					request.setAttribute("bmno", bmno);
					request.setAttribute("passwd", passwd);
					request.setAttribute("result",   result);
					System.out.println("LoginProAction result->"+result);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "mainMenu.jsp";
	}
}
