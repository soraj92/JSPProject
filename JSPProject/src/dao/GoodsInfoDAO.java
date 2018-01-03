package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.GoodsInfoVO;

public class GoodsInfoDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	DataSource ds = null;

	public Connection getConnection() {// Connection -> dbcp (서버가 db와의 connection을 대신 해준다.)
		Context ctx;
		try {
			ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MySQL");
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println("DB 커넥션 실패 : " + e);
		}
		return con;
	}

	public void close(Connection con) {
		if (con != null)
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public void close(PreparedStatement pstmt) {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public void close(ResultSet rs) {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	//----------------------------------------------------------------------------------------------------------------

	// 글 등록하기 (사진 포함), 회원 정보 가져 와서 글에 넣어 줌 (작성자 이름) ------------------------------------
	public int board_insert(GoodsInfoVO vo) {
		int result = 0;
		con = getConnection();
		String sql = "insert into BoardTbl(username, board_subject, price, choice_way, product_type, purchasing_time, trade_area, goods_info,img,board_date, trade_state) "
				+ "values(?,?,?,?,?,?,?,?,?,now(),?);";
		// 글 등록시 넣을 정보들 board_num 과 날자를 제외한 모든 정보 
		try
		{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getUsername()); // 작성자
			pstmt.setString(2, vo.getBoard_subject()); // 글 제목
			pstmt.setInt(3, vo.getPrice()); // 가격
			pstmt.setInt(4, vo.getChoice_way()); // 거래유형 선택
			pstmt.setString(5, vo.getProduct_type()); // 상품 분류
			pstmt.setString(6, vo.getPurchasing_time());//구입한 시기
			pstmt.setString(7, vo.getTrade_area()); // 거래지역
			pstmt.setString(8, vo.getGoods_info());// 상품 정보 
			pstmt.setString(9, vo.getImg());// 첨부 사진 이름
			//pstmt.setString(10, vo.getImg_path()); // 첨부 사진 경로 
			pstmt.setInt(10, vo.getTrade_state());// 거래 현황 
			result = pstmt.executeUpdate();
				if(result > 0)
				{
					System.out.println("DAO입력 완료");
				}else {
					System.out.println("DAO입력 실패");
				}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			close(pstmt);
			close(con);
		}
		return result;
	}

	// 전체 게시물 수 알아 오기 [나중에 사용]----------------------------------------------------------
	public int total_rows() {
		int total_rows = 0;
		con = getConnection();
		String sql = "select count(*) from board"; // 전체 레코드의 개수를 세어 줌
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				total_rows = rs.getInt(1); // 가져온 값 담아주기
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return total_rows;
	}

	// main 리스트 가져오기---------------------------------------------------------------------------
	public Vector<GoodsInfoVO> getMainList() {
		Vector<GoodsInfoVO> list = new Vector<GoodsInfoVO>();
		GoodsInfoVO vo = null;
		con = getConnection();
		// 페이징처리는 나중에, 우선 뿌리는것 부터 
		// 무슨 기준으로 가져올 것인가? ? ? 우선은 [카테고리 상관없이] 최신글 기준으로
		String sql = "select board_num,board_subject,price,img,goods_info from boardtbl order by board_num desc";
		// 메인리스트에서  눈에 보이는 정보는  'board_subject(제목),price(가격),img(이미지)',goods_info(상품설명)
		try
		{
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				vo = new GoodsInfoVO();
				vo.setBoard_num(rs.getInt("board_num"));
				vo.setBoard_subject(rs.getString("board_subject"));
				vo.setPrice(rs.getInt("price"));
				vo.setImg(rs.getString("img"));
				//vo.setImg_path(rs.getString("img_path"));
				vo.setGoods_info(rs.getString("goods_info"));
				list.add(vo);
			}
			
		}catch(Exception e)
		{
		e.printStackTrace();	
		}finally
		{
			close(rs);
			close(pstmt);
			close(con);
		}
		return list;
	}
	
	// 카테고리 별 리스트 뿌려주기 , product_type을 기준으로 리스트를 뿌려준ㄷㅏ.
	public Vector<GoodsInfoVO> getCategoryList(String product_type)
	{
		Vector<GoodsInfoVO>  list = new Vector<GoodsInfoVO>();
		GoodsInfoVO vo = null;
		con = getConnection();
		String sql = "select board_num,board_subject,price,img,goods_info from boardtbl where product-type ="+product_type+"order by board_num desc";
		
		try
		{
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next())
		{
			vo = new GoodsInfoVO();
			vo.setBoard_num(rs.getInt("board_num"));
			vo.setBoard_subject(rs.getString("board_subject"));
			vo.setPrice(rs.getInt("price"));
			vo.setImg(rs.getString("img"));
			vo.setGoods_info(rs.getString("goods_info"));
			list.add(vo);
		}
		
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			close(rs);
			close(pstmt);
			close(con);
		}
		return list;
	}
	
	

}
