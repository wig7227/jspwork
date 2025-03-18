package ajaxReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ajax01.DBConnectionMgr;
import ajaxReply.Reply;

import org.json.simple.JSONObject;


public class ReplyDao {
	DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	// 전체 reply데이터 가져오기
	public ArrayList<Reply> getAllReply(int ref) {
		ArrayList<Reply> alist = new ArrayList<Reply>();
		try {
			con = pool.getConnection();
			sql = "select * from reply where ref=? order by no desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Reply bean = new Reply();
				bean.setNo(rs.getInt("no"));	//primary키는 항상 가져오기
				bean.setContent(rs.getString("content"));
				/* bean.setRef(rs.getInt("ref")); */
				bean.setName(rs.getString("name"));
				bean.setRdate(rs.getString("rdate"));
				alist.add(bean);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	public int insertReply(Reply bean) {
		int result = 0;
		try {
			con = pool.getConnection();
			sql = "insert into reply values(seq_reply.nextval, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getContent());
			pstmt.setInt(2, bean.getRef());
			pstmt.setString(3, bean.getName());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return result;
	}
	
}
	

