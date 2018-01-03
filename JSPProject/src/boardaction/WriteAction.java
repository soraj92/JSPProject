package boardaction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import basic.Action;
import basic.ActionForward;
import dao.GoodsInfoDAO;
import vo.GoodsInfoVO;

public class WriteAction implements Action {
	private String path;
	
	public WriteAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		// 정보를 입력해주는 작업 해주기 
		// 입력한 정보 받아오기 
		// 현재 프로젝트 경로에 'imgupload' 폴더 생성해서 추가해주기!
		String saveDir ="/imgupload";
		String uploadPath =  req.getServletContext().getRealPath(saveDir);
		System.out.println("uploadPath :"+uploadPath);
		int size = 5 * 1024 * 1024;
		MultipartRequest multi;
		try
		{
			multi = new MultipartRequest(req, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
			GoodsInfoVO vo = new GoodsInfoVO();
			
			vo.setImg(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			//vo.setImg_path(uploadPath+"\\"+multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			vo.setUsername(multi.getParameter("username"));
			vo.setBoard_subject(multi.getParameter("board_subject"));
			vo.setPrice(Integer.parseInt(multi.getParameter("price")));
			vo.setChoice_way(Integer.parseInt(multi.getParameter("choice_way")));
			vo.setProduct_type(multi.getParameter("product_type"));
			vo.setPurchasing_time(multi.getParameter("purchasing_time"));
			vo.setTrade_area(multi.getParameter("trade_area"));
			vo.setGoods_info(multi.getParameter("goods_info"));
			vo.setTrade_state(Integer.parseInt(multi.getParameter("trade_state"))); // 거래 현황 
			
			System.out.println("여기는 WA :"+multi.getParameter("username"));
			System.out.println("요기는 WA : "+multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
			
			GoodsInfoDAO dao = new GoodsInfoDAO();
			int result = dao.board_insert(vo);
			if(result > 0)
			{
				System.out.println("WA : 입력 성공");
			}else
			{
				System.out.println("WA : 입력 실패");
			}
		
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return new ActionForward(path,true);
	}

}
