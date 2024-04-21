package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//DB에 접속 하고 끊기 만들어 두고 사용할 때마다 불러쓰자

public class Conn {
	
	private Connection con;	//접속객체 con 선언
	
	//getConnection() 메소드	: 반환타입은 Connection
	public Connection getConnection() {
		return con;	//접속객체 return
	}
	
	//생성자
	public Conn() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 메모리로딩 선언
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
		
	}
	
	
}

