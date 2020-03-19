package service;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try { 	
				int num = Integer.parseInt(request.getParameter("num"));
				String pageNum = request.getParameter("pageNum");	
				BoardDao bd = BoardDao.getInstance();
				bd.readCount(num);
				Board board = bd.select(num);
				
				request.setAttribute("num", num);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("board", board);
		} catch(Exception e) { System.out.println(e.getMessage()); }
		return "content.jsp";
	}

}
