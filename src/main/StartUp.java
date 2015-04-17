package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StartUp {

	/**
	 * @param args
	 * @throws SQLException
	 */
	public static void main(String[] args) throws SQLException {
		try {
			System.out.println("Loading driver...");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded!");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(
					"Cannot find the driver in the classpath!", e);
		}

		String url = "jdbc:mysql://localhost:3306/7wonders_tracker";
		String username = "CarstenPrassni";
		String password = "1234";
		Connection connection = null;

		try {
			System.out.println("Connecting database...");
			connection = DriverManager.getConnection(url, username, password);
			System.out.println("Database connected!");
		} catch (SQLException e) {
			throw new RuntimeException("Cannot connect to database!", e);
		} finally {

		}
		
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM players");
	
		while (rs.next()) {
			System.out.println(rs.getInt("id_players") + " "
					+ rs.getString("name"));
		}

		if (connection != null) {
			System.out.println("Closing the connection!");
			try {
				connection.close();
			} catch (SQLException ignore) {
			}
		}

	}
}
