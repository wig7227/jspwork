package ch06_oracleJDBC;

import java.util.ArrayList;
import java.sql.*;

public class UseDBPool6 {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	
	public ArrayList<BeanLocation> getList() {
		ArrayList<BeanLocation> alist = new ArrayList<BeanLocation>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from location");
			while(rs.next()) {
				BeanLocation bean = new BeanLocation();
				bean.setLocal_code(rs.getString(1));
				bean.setNational_code(rs.getString(2));
				bean.setLocal_name(rs.getString(3));
				alist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}