package member;

import java.sql.*;
public class member {
	public static Connection getConnection() {
		//JSP로 DB연결 방법 3/4

		//1. sql package import
		//2. jdbc driver loading
//				src -> webapp -> WEB-INF -> lib 이 위치에 드라이버 파일 넣기
		//

		String driverClass = "com.mysql.jdbc.Driver";
		
		try {
		Class.forName(driverClass); 
		} catch(ClassNotFoundException e) {
			System.out.println("JDBC Driver Err.");
		}

		//3. Connection Object
		Connection conn = null;

		String url = "jdbc:mysql://localhost:3306/webmarket";
		String id = "root";
		String pw = "0000";

		try {
		conn = DriverManager.getConnection(url, id, pw);
		} catch(SQLException e) {
			System.out.println("DB Connection Err.");
		}

		//4. Statement Object
		//PreparedStatement pstmt = null;  //구문객체 초기화
		
		return conn;
	}

	
}