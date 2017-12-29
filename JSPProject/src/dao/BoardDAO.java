package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.BoardVO;

public class BoardDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	DataSource ds = null;
	
	
	public BoardVO getBoard(int board_num)
	{
		BoardVO vo = null;
		
		con = getConnection();
		String sql = "select * from testTable where board_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				String board_subject = rs.getString("board_subject");
				int price  = rs.getInt("price");
				int choice_way  = rs.getInt("choice_way");
				String buyday = rs.getString("buyday");
				String space = rs.getString("space");
				String information = rs.getString("information");
				String file = rs.getString("file");
				vo = new BoardVO(board_num, board_subject, price, choice_way, buyday, space, information, file);
				System.out.println(vo.getBoard_subject());
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
