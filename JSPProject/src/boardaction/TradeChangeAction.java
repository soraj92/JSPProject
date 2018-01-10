package boardaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Action;
import basic.ActionForward;
import dao.GoodsInfoDAO;

public class TradeChangeAction implements Action {
	private String path;
	
	public TradeChangeAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		// board_num 가져오기
		int board_num = Integer.parseInt(req.getParameter("board_num"));// 선택한 글번호
		int trade_state = Integer.parseInt(req.getParameter("trade_state")); // 선택된 옵션
		System.out.println("여기는 tca "+board_num+trade_state);
		GoodsInfoDAO dao =new GoodsInfoDAO();
		int result = dao.trade_change(board_num, trade_state);
		// 받아온 게시글의 번호의 판매 상황을 바꿔줌 
		if(result == 0)
			System.out.println("수정 실패");
	
		return new ActionForward(path,true);
	}

}
