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
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardVO vo = dao.getBoard(board_num);//board_num
		
		request.setAttribute("vo", vo);
		System.out.println(vo);
		return new ActionForward(path,false);
	}

}
