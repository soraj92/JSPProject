package boardaction;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSpinnerUI;

import basic.Action;
import basic.ActionForward;
import dao.GoodsInfoDAO;
import vo.GoodsInfoVO;
import vo.ListPageVO;

public class MainListAction implements Action {
	private String path;
	
	public MainListAction(String path) {
		super();
		this.path = path;
	}
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {

		 
		//페이징 처리 
		//1) 사용자가 서택한 페이지 번호 가져오기
		int page =1; 
		// -> 1페이지 이상 넘어가지 않는다면, 버튼이 생기지 않으므로 그냥 '1'을 넣어준다. 목록보기를 하면 맨처음 페이지를 보여줌
		
		if(req.getParameter("page")!= null)
			page = Integer.parseInt(req.getParameter("page"));
			System.out.println("page:"+page);
		// 여러 페이지 중 하나의 페이지를 선택한다면  선택한 페이지의 번호 받아오기
		
		//2) 전체 게시물 수 가져오기
		GoodsInfoDAO dao = new GoodsInfoDAO();
		int total_rows = dao.total_rows();
		//3) 한 페이지에 보여줄 목록 갯수 정하기 (한줄에 3개일 때 기준으로 9개)
		int limit = 9; 
		//4) list페이지 하단에 total_page 결정
		int total_page =(int)((double)total_rows/limit+0.95); 
		// 몇 페이지가 나오는가 , 전체에서 가져오는 페이지 수 결정 
		
		//5) 현재 화면에서 보여줄 start 페이지 구하기
		// 1~16인 상황에서 [다음] 눌렀을 때 16~32, [이전] 눌렀을 떄는 다시 1~16 으로 돌아간다
		int start_page =((int)((double)page/9+0.9)-1)*9+1;
		int end_page =start_page+9-1;
		
		if(end_page> total_page)
			end_page =total_page; 
		// 전체 페이지보다 끝나는 페이지가 더 클경우에 엔드페이지를 토탈페이지 수로 맞춰준다. 
			ListPageVO page_info = new ListPageVO();
			page_info.setPage(page);
			page_info.setStart_page(start_page);
			page_info.setEnd_page(end_page);
			page_info.setTotal_page(total_page);
			page_info.setTotal_rows(total_rows);
		
			// 페이지 변수 값에 따라 목록 가져오기 
		Vector<GoodsInfoVO> list = dao.getMainList(page,limit);
		System.out.println("list" +list);
		if(list != null) {
			req.setAttribute("list", list);
			req.setAttribute("page_info", page_info);
		}else
		{
			System.out.println("list에 아무것도 안담김");
			System.out.println("또는 페이징처리 실패");
		}
		return new ActionForward(path,false); // 리스트 정보를 끌고가야하기 떄문에 forward해줌? ㄴ
	}



}
