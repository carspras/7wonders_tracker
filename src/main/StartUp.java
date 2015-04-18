package main;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import standings.Game;
import standings.Result;

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
		
		calculateStandings();
	}
	
	public static void calculateStandings() throws SQLException {
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
		ResultSet rs = stmt.executeQuery("SELECT MAX(id_games) as numberOfGames from games");
		rs.next();
		int numberOfGames = rs.getInt("numberOfGames");
		System.out.println("number of games: " + numberOfGames);
		
		for (int gameNumber = 0; gameNumber < numberOfGames; gameNumber++) {
			ResultSet gameQuery = stmt.executeQuery("SELECT number_of_players, name, overall from " +
					"results LEFT JOIN (games, players, points) " +
					"ON (results.game = games.id_games AND results.player = players.id_players AND results.id_results = points.id_points) " +
					"WHERE game = " + gameNumber);
			
			if (gameQuery.next()) {
				Game gameResults = new Game(gameQuery.getInt("number_of_players"));
				System.out.println("game number: " + gameNumber + ", number of players: " + gameResults.getNumberOfPlayers());
				
				gameQuery.beforeFirst();
				while (gameQuery.next()) {
					gameResults.addResult(new Result(gameQuery.getString("name"),gameQuery.getInt("overall")));
					System.out.println("player: " + gameQuery.getString("name") + ", points overall: " + gameQuery.getInt("overall"));
				}
			}
		}
				
		
		/*
		rs = stmt.executeQuery("SELECT * FROM players");
	
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
		*/
	}
}
