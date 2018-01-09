package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

@WebServlet("/UserRegisterCheckServlet")
public class UserRegisterCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse rs) throws ServletException, IOException{
		//사용자의 회원가입요청 처리하기
		//파라미터 값 받아오기
		req.setCharacterEncoding("UTF-8");
		rs.setContentType("text/html;charset=UTF-8");
		String userID = req.getParameter("userID");
		rs.getWriter().write(new UserDAO().registerCheck(userID)+"");
	} 
}
