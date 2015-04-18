package standings;

public class Result {
	private String name;
	private int points_overall;
	
	public Result(String n, int overall) {
		name = n;
		points_overall = overall;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String newName) {
		name = newName;
	}
	
	public int getPointsOverall() {
		return points_overall;
	}
	
	public void setPointsOverall(int newPointsOverall) {
		points_overall = newPointsOverall;
	}
}
