package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Action;
import basic.ActionForward;


@WebServlet("*.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();// /Board/qwrite.do
		String contextPath = request.getContextPath();// /Board
		String cmd = requestURI.substring(contextPath.length());// /qwrite.do
		
		//필수 기본 작업
		BoardFactory acinit = BoardFactory.getInstance();
		Action action = acinit.formInit(cmd);
		
		ActionForward ff = null;
		ff = action.execute(request, response);
		
		if(ff.isRedirect())
			response.sendRedirect(ff.getPath());
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher(ff.getPath());
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("인ㅇ");
		doGet(request, response);
	}

}
