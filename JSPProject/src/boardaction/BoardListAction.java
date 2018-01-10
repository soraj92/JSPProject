package boardaction;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import basic.Action;
import basic.ActionForward;
import dao.BoardDAO;
import vo.BoardVO;

public class BoardListAction implements Action {

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
			list = dao.getList(product_type);

		request.setAttribute("list", list);
		return new ActionForward(path, false);
	}

}
