package bread;
import java.sql.*;

public class breadDAO {

	//장바구니에 삽입 cart_insert.jsp에서 사용
	public void cartinsert(String userId, String breadID, String surrang) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("Insert into cart (userId, breadID, count) values('"+userId+"','"+breadID+"','"+surrang+"')");
			
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
	
	public void userinsert(String name, String id, String pw) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("Insert into user (userName, userId, userPassword) values('"+name+"','"+id+"','"+pw+"')");
			
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
	
	public void checkeddelete(String state, String[] checked) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
			Statement stmt = conn.createStatement();
			for(int i = 0; i < checked.length; i++){
				//stmt.executeUpdate("Delete from cart where cartID = '"+checked[i]+"' and userIDx ");
				stmt.executeUpdate("DELETE cart	FROM cart INNER JOIN user ON cart.userIdx = user.userIdx where cart.cartID = "+checked[i]+" and user.userId = "+state+"");
			}
			
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	public void pluscount(String pluscartID) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
			Statement stmt = conn.createStatement();
			
			int i = 1;
			stmt.executeUpdate("Update cart set count = count+1 where cartID = "+pluscartID+"" );
			
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void minuscount(String minuscartID) {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/teampj","root","1234");
			Statement stmt = conn.createStatement();
			
			int i = 1;
			stmt.executeUpdate("Update cart set count = count-1 where cartID = "+minuscartID+" and count>1" );
			
			stmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
}
