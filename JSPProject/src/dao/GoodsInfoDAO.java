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
	public int board_insert(String username) {
		int result = 0;
		con = getConnection();
		String sql = "insert into BoardTbl(username, board_subject, price, choice_way, product_type, purchasing_time, trade_area, goods_info, img, board_date, trade_state) values(?,?,?,?,?,?,?,?,now(),?);";

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
		String sql = "select board_num,board_subject,price,img from shopdb order by board_num desc";
		// 메인리스트에서  눈에 보이는 정보는  'board_subject(제목),price(가격),img(이미지)' 
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
