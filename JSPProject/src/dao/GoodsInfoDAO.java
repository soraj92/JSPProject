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
	
	public int insert()  // 작성시 글 입력 
	{
	int result = 0;
	
	return result;
	}
	
	
	public Vector<GoodsInfoVO> getMainList() // 메인 리스트 가져오기
	{
		Vector<GoodsInfoVO> list = new Vector<>();
		GoodsInfoVO vo = null;
		con = getConnection();
		
	
		pstmt = con.prepareStatement("select max(board_num) from boardtbl");

		con.setAutoCommit(false); // 커밋을 수동으로 바꿔 놓는다. 

		rs = pstmt.executeQuery();
		
		
		// 뿌리기 위해 가져와야 할 것 : 글번호, 상품명, 희망 가격 
		String sql = "select * from boardtbl where board_num=?";  // board_num 에 random_num 을 넣어서(최신글 중에) 무작위로 가져온다. 
		// for문돌려서.. list_num 을 랜덤으로 준담에..가져오면 안되남..
		// 카테고리별 각각 몇개 이렇게 돌려야하나?
		
		int random_num = 0; // 수정중
		try
		{
			pstmt = con.prepareStatement(sql);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally
		{
			close(rs);
			close(pstmt);
			close(con);
		}
		
		
		
		
		return list;
	}
	
	
	
	
	
	public Vector<GoodsInfoVO> getCTList(String product_type) // 카테고리별 리스트 가져오기
	{
		Vector<GoodsInfoVO> list = new Vector<>();
		GoodsInfoVO vo = new GoodsInfoVO();
		
		
		return list;
	}
	
	
}
