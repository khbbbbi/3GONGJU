package bread;
import java.sql.*;

public class breadDAO {

	public void insert(String userIdx, String breadID, String surrang) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("Insert into cart (userIdx, breadID, count) values('"+userIdx+"','"+breadID+"','"+surrang+"')");
			
			//stmt.executeUpdate(
			//		"INSERT INTO cart (userIdx, breadID, count) SELECT '2','"+breadID+"','"+surrang+"'"
			//				+ "FROM DUAL WHERE NOT EXISTS(SELECT * FROM cart WHERE userIdx = '2' AND breadID = '"+breadID+"');"
			//		);	//breadID + userIdx가 존재하지 않으면 insert

			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
