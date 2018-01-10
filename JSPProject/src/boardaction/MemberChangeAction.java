package boardaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Action;
import basic.ActionForward;
import dao.UserDAO;

public class MemberChangeAction implements Action  {
	private String path;

	public MemberChangeAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		String id = req.getParameter("userID");
		String passwd = req.getParameter("userPassword");
		String email = req.getParameter("userEmail");
		String phone = req.getParameter("userPhone");
		
		
		UserDAO dao = new UserDAO();
		int result = dao.change(passwd, email, phone, id);
		
		
		
		return new ActionForward(path, true);
		
	}
	
}
