package boardaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.Action;
import basic.ActionForward;
import dao.UserDAO;
import vo.UserVO;

public class MemberUpdateAction implements Action {
	private String path;

	public MemberUpdateAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession session = req.getSession();
		
		
		String id = (String)session.getAttribute("isLogin");
		
		UserDAO dao = new UserDAO();
		UserVO	vo = null;
		
		vo = dao.getUser(id);
		System.out.println(vo);
		
		req.setAttribute("vo", vo);
		
		
		
		
		
		return new ActionForward(path, false); //현재페이지랑 다음보여질 페이지를 request 공유한다 이게 최상위면 다음도 최상위
	}
	
}
