package boardaction;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;

import basic.Action;
import basic.ActionForward;
import dao.GoodsInfoDAO;
import vo.GoodsInfoVO;

public class MainListAction implements Action {
	private String path;
	
	public MainListAction(String path) {
		super();
		this.path = path;
	}
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {

		// 최신글 가져오기  내림차순으로 
		GoodsInfoDAO dao = new GoodsInfoDAO();
		Vector<GoodsInfoVO> list = dao.getMainList();
		System.out.println("list" +list);
		if(list != null) {
			req.setAttribute("list", list);
		}else
		{
			System.out.println("list에 아무것도 안담김");
		}
		return new ActionForward(path,false); // 리스트 정보를 끌고가야하기 떄문에 forward해줌? ㄴ
	}



}
