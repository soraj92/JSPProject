package boardaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Action;
import basic.ActionForward;
import dao.BoardDAO;
import vo.BoardVO;

public class MoveAction implements Action {

	private String path;
	
	public MoveAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoard(2);//board_num
		
		request.setAttribute("vo", vo);
		
		return new ActionForward(path,false);
	}

}
