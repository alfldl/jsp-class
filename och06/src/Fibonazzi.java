import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Fibonazzi")
public class Fibonazzi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BigInteger[] arr = new BigInteger[100];

	public void init() throws ServletException {
		arr[0] = new BigInteger("1");
		arr[1] = new BigInteger("1");
		for (int i = 2; i < arr.length; i++) {
			arr[i] = arr[i - 2].add(arr[i - 1]);
		} //서버 리소스 절약을 위해 init에 추가해 한번만 돌아가게 함
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		if (num > 100)
			num = 100;
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html><body><h2>피보나찌수열</h2>");
		for (int i = 0; i < num; i++) {
			out.println(arr[i] + "<br>");
		}
		out.println("</body></html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}
}