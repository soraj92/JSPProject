package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	DataSource ds = null;
	
	
	
	public int login(String userID, String userPassword) {
		con = getConnection();
//		String SQL = "SELECT userPassword FROM user WHERE userID = ? and userPassword";
		String sql = "SELECT * FROM user WHERE userID = ? and userPassword = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, userID);
			ps.setString(2, userPassword);
			rs = ps.executeQuery();
			if(rs.next()) {
				return 1; //로그인성공
			}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //실패
	}
	
	public int registerCheck(String userID) { //유저 아이디를 받아서 결과로 반환
		con = getConnection();
		String SQL = "SELECT * FROM USER WHERE userID = ?";
		try {
			ps = con.prepareStatement(SQL);
			ps.setString(1,  userID);
			rs = ps.executeQuery();
			if(rs.next()) {
				return 0; // 이미 존재하는 회원
			}else {
				return 1; // 가입 가능한 회원 아이디
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(ps != null)ps.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //데이터베이스오류
	}
	
	
	//회원가입
	
	public int register(String userID , String userPassword , String userName , String userAge , String userGender , String userEmail , String userPhone) {
		con = getConnection();
		String SQL = "INSERT INTO USER(userID,userPassword,userName,userAge,userGender,userEmail,userPhone) VALUES (?, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		System.out.println(userID + userPassword + userName + userAge + userGender + userEmail + userPhone);
		try {
			System.out.println("회원가입테스트");
			ps = con.prepareStatement(SQL);
			ps.setString(1, userID);
			ps.setString(2, userPassword);
			ps.setString(3, userName);
			ps.setInt(4, Integer.parseInt(userAge));
			ps.setString(5, userGender);
			ps.setString(6, userEmail);
			ps.setString(7, userPhone);
			result = ps.executeUpdate();	//결과를 추출하는게 아니라 단순히 실행을 목적으로 하기에 executeUpdate 사용
											//sql 문을 성공적으로 받아오면 return이 1값을 받아온다
			if(result>0)
				System.out.println("입력");
			else
				result = -1;
				System.out.println("실패");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(ps != null)ps.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result; //데이터베이스 오류
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
	public void close(PreparedStatement ps)
	{
		if(ps != null)
			try {
				ps.close();
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