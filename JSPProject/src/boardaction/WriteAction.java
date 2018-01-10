package boardaction;

import basic.Action;
import basic.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dao.BoardDAO;
import vo.BoardVO;
import vo.GoodsInfoVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WriteAction implements Action {
	private String path;

	public WriteAction(String path) {
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String saveDir ="/imgupload";
		String uploadPath =  request.getServletContext().getRealPath(saveDir);
		//파일 업로드 사이즈 제한
		int size = 5 * 1024 * 1024;

		MultipartRequest multi;


		try {
			multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
			GoodsInfoVO vo = new GoodsInfoVO();

			vo.setBoard_subject(multi.getParameter("subject"));                              // 제목
			vo.setPrice(Integer.parseInt(multi.getParameter("productPrice")));              // 가격
			vo.setPurchasing_time(multi.getParameter("purchasing-time"));                                              // 구입 시기

			if (multi.getParameter("small-category").equals("empty")) {
				vo.setProduct_type(multi.getParameter("main-category"));
			} else {
				vo.setProduct_type(multi.getParameter("main-category") + "-" + multi.getParameter("small-category"));
			}

			vo.setImg(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));     // 이미지
			vo.setGoods_info(multi.getParameter("productComment"));                         // 상품 코멘트
			if (multi.getParameter("apply").equals("직거래")) {                               // 0 == 직거래 1 == 택배거래
				vo.setChoice_way(0);
				vo.setTrade_area("");
			} else if (multi.getParameter("apply").equals("택배거래")) {
				vo.setChoice_way(1);
			}

			vo.setTrade_area(multi.getParameter("input-place"));


			HttpSession session = request.getSession();
			vo.setUsername((String) session.getAttribute("isLogin"));

			System.out.println("제목 : " + vo.getBoard_subject());
			System.out.println("가격 : " + vo.getPrice());
			System.out.println("구입시기 : " + vo.getPurchasing_time());
			System.out.println("타입? : " + vo.getProduct_type());
			System.out.println("코멘트 : " + vo.getGoods_info());
			System.out.println("거래장소 : " + vo.getChoice_way());
			System.out.println("거래장소 : " + vo.getTrade_area());
			System.out.println("이미지 : " + vo.getImg());

			BoardDAO dao = new BoardDAO();
			dao.insertArticle(vo);
		} catch (Exception e) {
			System.out.println("엥");
			e.printStackTrace();
		}

		return new ActionForward(path, true);

	}
}


