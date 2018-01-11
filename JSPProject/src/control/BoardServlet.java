package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.Action;
import basic.ActionForward;
import dao.UserDAO;


@WebServlet("*.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("z");
		request.setCharacterEncoding("UTF-8");
		String requestURI = request.getRequestURI();// /Board/qwrite.do
		String contextPath = request.getContextPath();// /Board
		String cmd = requestURI.substring(contextPath.length());// /qwrite.do

		if(cmd.equals("/login.do"))
		{
			String id = request.getParameter("userID");					// get id parameter
			String password = request.getParameter("userPassword");		// get pw parameter
			
			
			UserDAO dao = new UserDAO();
			int result = dao.login(id, password);
			HttpSession session = request.getSession();
			
			if(result == 1)
				session.setAttribute("isLogin", id);
			
			response.getWriter().print(result);
			return;
			
		}
		else
		{
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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("인ㅇ");
		doGet(request, response);
	}

}
