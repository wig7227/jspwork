package ch06_oracleJDBC;

import java.sql.*;
import java.util.ArrayList;

public class UseBeanDB4_Job {
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "tjoeun";
	private final String PASS = "1234";
	
	public UseBeanDB4_Job() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BeanJob> getList() {
		ArrayList<BeanJob> alist = new ArrayList<BeanJob>();
		
	try {
		Connection con = DriverManager.getConnection(JDBC_URL, USER, PASS);
		Statement st = con.createStatement();
		String query = "select * from Job";
		ResultSet rs = st.executeQuery(query);
		while(rs.next()) {
			BeanJob bean = new BeanJob();
			bean.setJob_code(rs.getString("job_code"));
			bean.setJob_name(rs.getString("job_name"));
			alist.add(bean);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return alist;
	}
	
	
	
}
