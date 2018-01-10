package boardaction;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Action;
import basic.ActionForward;
import dao.BoardDAO;
import dao.GoodsInfoDAO;
import vo.BoardVO;
import vo.ListPageVO;

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
		Vector<Integer> time = new Vector<>();
		java.util.Date endTime;
		long diff;
		long cur = System.currentTimeMillis();
		int sec;
		String product_type = request.getParameter("product_type");
		
		
		GoodsInfoDAO rows = new GoodsInfoDAO();
		int page=1;
		int total_rows = rows.total_Crows(product_type);
		int limit = 9; // 9 페이지씩
		int total_page =(int)((double)total_rows/limit+0.95);
		int start_page =((int)((double)page/9+0.9)-1)*9+1;
		int end_page = start_page + 9 -1;
		
		
		if(request.getParameter("page")!= null)
			page =Integer.parseInt(request.getParameter("page"));
		
		// 전체 게시물 수 가져오기

		if (product_type.equals("auction")) {
			list = dao.getAuctionList(product_type);
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
			for(int i = 0; i < list.size(); i++)
			{
				try {
					endTime = f.parse(list.elementAt(i).getEndTime());
					System.out.println(System.currentTimeMillis());
					diff = endTime.getTime() - cur;
					sec = (int) (diff / 1000);
					time.add(sec);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			path = "page/BoardAuction.jsp";
			request.setAttribute("time", time);
		} else
			list = dao.getList(product_type,page,limit);
		
		if(end_page >total_page)
			end_page = total_page;
		ListPageVO page_info = new ListPageVO();
		page_info.setPage(page);
		page_info.setStart_page(start_page);
		page_info.setEnd_page(end_page);
		page_info.setTotal_page(total_page);
		page_info.setTotal_rows(total_rows);
		
		request.setAttribute("list", list);
		request.setAttribute("Mpage_info", page_info);
		
		return new ActionForward(path, false);
	}

}
