package service;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import dao.BookIn;
import dao.BookMember;
import dao.BookMemberDao;
public class BOConfirmBmnoAction implements CommandProcess {
	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		BookMemberDao bmd = BookMemberDao.getInstance();
		try {
			   int totCnt  = bmd.getTotalCnt();			
				String pageNum = request.getParameter("pageNum");	
				if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
				int currentPage = Integer.parseInt(pageNum);	
				int pageSize  = 10, blockSize = 10;
				int startRow = (currentPage - 1) * pageSize + 1;
				int endRow   = startRow + pageSize - 1;
				int startNum = totCnt - startRow + 1;
				List<BookMember> list = bmd.bmlist(startRow, endRow);	
				int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
				int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
				int endPage = startPage + blockSize -1;	
				if (endPage > pageCnt) endPage = pageCnt;	
			
				request.setAttribute("totCnt", totCnt);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("startNum", startNum);
				request.setAttribute("list", list);
				request.setAttribute("blockSize", blockSize);
				request.setAttribute("pageCnt", pageCnt);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				 
				System.out.println("-----------------------------------------------");  // /ch20/bmlist.do
				System.out.println("startNum-->" + startNum);  // /ch20/bmlist.do
				System.out.println("totCnt-->" + totCnt);  // /ch20/bmlist.do
				System.out.println("currentPage-->" + currentPage);  // /ch20/bmlist.do
				System.out.println("blockSize-->" + blockSize);  // /ch20/bmlist.do
				System.out.println("pageSize-->" + pageSize);  // /ch20/bmlist.do
				System.out.println("pageCnt-->" + pageCnt);  // /ch20/bmlist.do
				System.out.println("startPage-->" + startPage);  // /ch20/bmlist.do
				System.out.println("endPage-->" + endPage);  // /ch20/bmlist.do
		   } catch(Exception e) { System.out.println(e.getMessage()); }
		   return "confirmBmno.jsp";
  }
}