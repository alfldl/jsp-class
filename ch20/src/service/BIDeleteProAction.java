package service;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.BookIn;
import dao.BookMemberDao;
public class BIDeleteProAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8"); 
			
			System.out.println("BIDeleteProAction Start...");
			String   zero        = "1";
			String[] checks     = request.getParameterValues("check1");
			String[] book_kind  = request.getParameterValues("book_kind");
			String[] bookno  = request.getParameterValues("bookno");
			String[] bookseq  = request.getParameterValues("bookseq");
			String[] bookname  = request.getParameterValues("bookname");
			String pageNum = request.getParameter("pageNum");
			int result = 0;
			int totDel = 0;
			BookMemberDao bmd = BookMemberDao.getInstance();
			 for(int i=0;i<bookno.length;i++){

			      System.out.println("i -> "+ i );
			      System.out.println("checks[i]->"+ checks[i]);
			      if(checks[i].equals(zero)) {
				        System.out.println("checks-> "+  checks[i]);
				        System.out.println("book_kind-> "+  book_kind[i]);
				        System.out.println("bookno-> "+  bookno[i]);
					    System.out.println("bookseq-> "+ bookseq[i]);
					    System.out.println("bookname ->"+ bookname[i]);
						BookIn bookIn = new BookIn();
						bookIn.setBook_kind( book_kind[i]);
						bookIn.setBookno(bookno[i]);
						bookIn.setBookseq(Integer.parseInt( bookseq[i]));
		//				result = bmd.biDelete(bookIn);
		//				totDel +=  result;
			      }
			 }
	//    	BookMemberDao bmd = BookMemberDao.getInstance();
	//		int result = bmd.bmDelete(bmno, passwd);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return "biDeletePro.jsp";
	}
}