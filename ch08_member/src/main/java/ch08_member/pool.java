package ch08_member;

import java.sql.*;

import ch08_member.DBConnectionMgr;

public class pool {
	private DBConnectionMgr pool;
	
	public pool() {
		pool = DBConnectionMgr.getInstance();
	}
	
	// login 메소드
	public boolean loginMethod(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			String query = "select count(*) from test where userid=? and userpw=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next() && rs.getInt(1) > 0)
				flag = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
}
