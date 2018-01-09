package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

@WebServlet("*.login")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest req, HttpServletResponse rs) throws ServletException, IOException{
		//사용자의 회원가입요청 처리
		//파라미터 값 받아오기
		req.setCharacterEncoding("UTF-8");
		rs.setContentType("text/html;charset=UTF-8");
		String userID = req.getParameter("userID");
		String userPassword1 = req.getParameter("userPassword1");
		String userPassword2 = req.getParameter("userPassword2");
		String userName = req.getParameter("userName");
		String userAge = req.getParameter("userAge");
		String userPhone = req.getParameter("userPhone");
		String userEmail = req.getParameter("userEmail");
		String userGender = req.getParameter("userGender");
		System.out.println(userID+userPassword1+userPassword2+userName+userAge+userPhone+userEmail+userGender);
		//파라미터를 못받아 왔을때 오류 전송
		if(userID == null || userID.equals("") || userPassword1 == null || userPassword1.equals("") ||
			userPassword2 == null || userPassword2.equals("") || userName == null || userName.equals("") || userAge == null || userAge.equals("") ||
			userEmail == null || userEmail.equals("") || userGender == null || userGender.equals("") || userPhone == null || userPhone.equals("")) {
			req.getSession().setAttribute("messageType", "오류메세지");
			req.getSession().setAttribute("messageContent", "모든 내용을 입력하세요ㅡㅡ");
			rs.getWriter().write("no");
			//rs.sendRedirect("index.jsp");
			return;
		}
		if(!userPassword1.equals(userPassword2)) {
			System.out.println("확인");
				req.getSession().setAttribute("messageType", "오류메세지");
				req.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다.");
				rs.sendRedirect("index.jsp");
				return;
		}
		int result = new UserDAO().register(userID, userPassword1, userName, userAge, userGender, userEmail, userPhone);
		if(result!=0) {
			System.out.println("회원가입완료");
			req.getSession().setAttribute("messageType", "성공 메세지");
			req.getSession().setAttribute("messageContent", "회원가입 완료");
			rs.getWriter().write(result+"");
		}else {
			req.getSession().setAttribute("messageType", "오류메세지");
			req.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
			rs.sendRedirect("index.jsp");
			return;
		}
	} 
}
