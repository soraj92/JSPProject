package boardaction;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Action;
import basic.ActionForward;
import dao.BoardDAO;
import vo.BoardVO;

public class BoardListAction implements Action{

	private String path;
	
	
	public BoardListAction(String path) {
		super();
		this.path = path;
	}


	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = new BoardDAO();
		Vector<BoardVO> list = new Vector<BoardVO>();
		
		String produt_type = request.getParameter("product_type");
		list = dao.getList(produt_type);
		
		request.setAttribute("list", list);
		
		return new ActionForward(path, false);
	}

}
