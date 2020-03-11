

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Person
 */
@WebServlet("/Person")
public class Person extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Person() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String[] notice = request.getParameterValues("notice");
//		여러값을 복수로 받아 올때 배열로 설정 values로 get
		String job = request.getParameter("job");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><h1>개인정보</h1><body>");
		out.println("이름: " + name + "<p> 아이디: " + id + "<p>");
		out.println("암호: " + password + "<p>성별: " + gender +"<p>");
		out.println("수신메일: ");
		if (notice != null) {
//			for (int i = 0; i < notice.length; i++) {
//					out.println(notice[i] + " ");
//			}
			for (String not : notice) {
					out.println(not + "<br>");
			}
		} else {
			out.println("no");
		}
		out.println("직업: " + job);
		out.close();
		
		
		out.println("</body></html>");
	}

}
