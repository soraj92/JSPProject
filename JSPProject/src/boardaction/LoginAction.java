package boardaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.Action;
import basic.ActionForward;
import dao.UserDAO;
import vo.UserVO;

public class LoginAction implements Action  {

	private String path;
	
	public LoginAction(String path) {
		super();
		this.path = path;
	}
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession session = req.getSession();
		
		String id = req.getParameter("userID");					// get id parameter
		String password = req.getParameter("userPassword");		// get pw parameter
		
		
		UserDAO dao = new UserDAO();
		int isLogin = dao.login(id, password);
		if (isLogin == 1) {
			System.out.println("로그인 ok");
			session.setAttribute("isLogin", id); //
			System.out.println(session.getAttribute("isLogin"));
		} else {
			System.out.println("로그인 ㄴㄴ");
			path = "./page/login.jsp";
		}
		
		return new ActionForward(path, true);
	}

}
