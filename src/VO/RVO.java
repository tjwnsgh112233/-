package VO;

public class RVO {
	private String id;
	private String name;
	private int sum;
	private double avg;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public double getAvg() {
		return avg;
	}
	public void setAvg(double avg) {
		this.avg = avg;
	}
	@Override
	public String toString() {
		return "RVO [id=" + id + ", name=" + name + ", sum=" + sum + ", avg=" + avg + "]";
	}
	
	
}
