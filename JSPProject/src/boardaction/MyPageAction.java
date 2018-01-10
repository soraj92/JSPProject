package boardaction;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import basic.Action;
import basic.ActionForward;
import dao.GoodsInfoDAO;
import dao.UserDAO;
import vo.GoodsInfoVO;
import vo.UserVO;

public class MyPageAction implements Action{
	private String path;
	

	public MyPageAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) {
		
		// mypage 버튼의 경우에는 session 에 userID 정보가 있을 경우에만  보이도록 한다.
		
		// 회원정보를 가져오기 위해 , 해당 회원의 로그인 후 저장된  id  를  가져오기  
		
		HttpSession session = req.getSession();
		String userID = (String)session.getAttribute("isLogin");
		
		// 회원의 이름과, 포인트점수를 가져와야 함
		UserDAO udao = new UserDAO();
		UserVO vo = udao.getUser(userID);

		System.out.println("유저이름"+vo.getUserName());
		
		// dao 에 담아서 해당 회원의 게시글 정보 가져오기 
		GoodsInfoDAO dao = new GoodsInfoDAO();
		
		Vector<GoodsInfoVO> my_list = dao.getMyList(vo.getUserName());
		                                  // **boardtbl 의 username 이랑,  user테이블의 userName 이랑 같아야함
											// 글 작성시 닉네임을 직접 입력하는 것이 아닌.. 로그인 정보에서 가저온 후 입력하도록 
											// 해야 함 
		System.out.println("여기는 mypaA : "+ vo+"  "+my_list);
		if(vo != null) 
			req.setAttribute("userInfo", vo);
		if(my_list != null ) {
		req.setAttribute("my_list",my_list);
		}else
		{
			System.out.println("등록된 게시글이 없습니다.");
		}
		return new ActionForward(path,false); // 정보를 가져가서 보여줘야 함 
	}

}
