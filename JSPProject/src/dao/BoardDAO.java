package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.BoardVO;

public class BoardDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	DataSource ds = null;
	
	public int UpdateAuctionPrice(int board_num,int price)
	{
		int result = 0;
		con = getConnection();
		String sql = "update boardtbl set price = ? where board_num = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, price);
			pstmt.setInt(2, board_num);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	public Vector<BoardVO> getAuctionList(String product)
	{
		Vector<BoardVO> list = new Vector<BoardVO>();
		BoardVO vo = null;
		
		con = getConnection();
		String sql = "select * from boardtbl where product_type = ? order by board_num desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				int board_num = rs.getInt("board_num");
				String board_subject = rs.getString("board_subject");
				int price = rs.getInt("price");
				String goods_info = rs.getString("goods_info");
				String img = rs.getString("img");
				String endTime = rs.getString("endTime");
				vo = new BoardVO(board_num, board_subject, price, goods_info, img, endTime);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	public Vector<BoardVO> getList(String product)
	{
		Vector<BoardVO> list = new Vector<BoardVO>();
		BoardVO vo = null;
		
		con = getConnection();
		String sql = "select * from boardtbl where product_type = ? order by board_num desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				int board_num = rs.getInt("board_num");
				String board_subject = rs.getString("board_subject");
				int price = rs.getInt("price");
				String goods_info = rs.getString("goods_info");
				String img = rs.getString("img");
				vo = new BoardVO(board_num, board_subject, price, goods_info, img);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	public BoardVO getBoard(int board_num)
	{
		BoardVO vo = null;
		
		con = getConnection();
		String sql = "select * from boardtbl where board_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				String board_subject = rs.getString("board_subject");
				int price  = rs.getInt("price");
				int choice_way  = rs.getInt("choice_way");
				String username = rs.getString("username"); // 작성자
				String product_type = rs.getString("product_type"); // 카테고리별 상품 분류
				String purchasing_time = rs.getString("purchasing_time"); // 구입한 시기
				String trade_area = rs.getString("trade_area"); // 거래지역
				String goods_info = rs.getString("goods_info");// 상품 설명
				String img = rs.getString("img"); // 첨부사진
				String board_date = rs.getString("board_date");// 글작성날짜
				int trade_state  = rs.getInt("trade_state"); // 거래 현황
				
				
				vo = new BoardVO(board_num, username, board_subject, price, choice_way,product_type,
						purchasing_time, trade_area, goods_info, img, board_date, trade_state);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {close(con); close(pstmt); close(rs);}
		
		return vo; 
	}
	
	
	
	public Connection getConnection()
	{//Connection  -> dbcp (서버가 db와의 connection을 대신 해준다.)		
		Context ctx;
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MySQL");
			con = ds.getConnection();
		} catch (Exception e) {
			System.out.println("DB 커넥션 실패 : " + e);
		}
		return con;
	}
	
	public void close(Connection con)
	{
		if(con != null)
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	public void close(PreparedStatement pstmt)
	{
		if(pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	public void close(ResultSet rs)
	{
		if(rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}
