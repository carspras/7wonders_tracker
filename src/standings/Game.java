package standings;

import java.util.Vector;

public class Game {
	private int numberOfPlayers;
	private Vector<Result> results;
	
	public Game(int players) {
		numberOfPlayers = players;
		results = new Vector<Result>();
	}
	
	public int getNumberOfPlayers() {
		return numberOfPlayers;
	}
	
	public void setNumberOfPlayers(int players) {
		numberOfPlayers = players;
	}
	
	public void addResult(Result newResult) {
		results.add(newResult);
	}
}
