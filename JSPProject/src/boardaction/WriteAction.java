package boardaction;

import basic.Action;
import basic.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dao.BoardDAO;
import tools.DateTime;
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
        BoardDAO dao = new BoardDAO();


        try {
            multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
            GoodsInfoVO vo = new GoodsInfoVO();

            vo.setBoard_subject(multi.getParameter("subject"));                              // 제목
            vo.setPrice(Integer.parseInt(multi.getParameter("productPrice")));              // 가격
            vo.setPurchasing_time(multi.getParameter("purchasing-time"));                                              // 구입 시기


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

            if (multi.getParameter("small-category").equals("empty")) {              // 소분류가 없는 메뉴 선택시
                vo.setProduct_type(multi.getParameter("main-category"));
            } else if (multi.getParameter("main-category").equals("auction")) {     // 대분류가 경매인 메뉴 선택시
                System.out.println("selected by auction###################################");
                System.out.println(multi.getParameter("small-category"));

                int auctionTime = Integer.parseInt(multi.getParameter("small-category"));
                vo.setAuctionEndTime(DateTime.Convert(auctionTime));

                vo.setProduct_type(multi.getParameter("main-category"));
                dao.insertAuction(vo);

                return new ActionForward(path, true);
            } else {                                                                        //
                vo.setProduct_type(multi.getParameter("main-category") + "-" + multi.getParameter("small-category"));
            }



            dao.insertArticle(vo);
        } catch (Exception e) {
            System.out.println("엥");
            e.printStackTrace();
        }

        return new ActionForward(path, true);

    }
}


