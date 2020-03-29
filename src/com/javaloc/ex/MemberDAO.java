package com.javaloc.ex;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MemberDAO {
	public static final int MEMBER_NONEXISTS  = 0;
	public static final int MEMBER_EXISTS = 1;
	public static final int MEMBER_SIGNUP_FAIL = 0;
	public static final int MEMBER_SIGNUP_SUCCESS = 1;
	public static final int MEMBER_LOGIN_PW_INVALID = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_NONUSER = -1;
	
	private static MemberDAO instance = new MemberDAO();
	
	private MemberDAO() {
	}
	
	public static MemberDAO getInstance(){
		return instance;
	}
	
	public int insertMember(MemberDTO dto) {
		int result = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into members values (?,?,?,?,?,?)";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setTimestamp(5, dto.getRegisteredDate());
			pstmt.setString(6, dto.getAddress());
			pstmt.executeUpdate();
			result = MemberDAO.MEMBER_SIGNUP_SUCCESS;
			
		} catch (Exception e) {
			result = MemberDAO.MEMBER_SIGNUP_FAIL;
			e.printStackTrace();
			
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int confirmId(String id) {
		int result = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select id from members where id = ?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			if(set.next()){
				result = MemberDAO.MEMBER_EXISTS;
			} else {
				result = MemberDAO.MEMBER_NONEXISTS;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(set != null) set.close();
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}
	
	public int userCheck(String id, String password) {
		int result = 0;
		String userPassword;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select password from members where id = ?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				userPassword = set.getString("password");
				if(userPassword.equals(password)) {
					result = MemberDAO.MEMBER_LOGIN_SUCCESS;
				} else {
					result = MemberDAO.MEMBER_LOGIN_PW_INVALID;
				}
			} 
			else {
				result = MemberDAO.MEMBER_LOGIN_NONUSER;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(set != null) set.close();
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}
	
	public MemberDTO getMember(String id) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from members where id = ?";
		MemberDTO dto = null;
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dto = new MemberDTO();
				dto.setId(set.getString("id"));
				dto.setPassword(set.getString("password"));
				dto.setName(set.getString("name"));
				dto.setEmail(set.getString("email"));
				dto.setRegisteredDate(set.getTimestamp("registeredDate"));
				dto.setAddress(set.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
		
	}
	
	public int updateMember(MemberDTO dto) {
		int result = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "update members set password=?, email=?, address=? where id=?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getPassword());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}
	
	private Connection getConnection() {
		
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
}
