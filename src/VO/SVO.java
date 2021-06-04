package VO;

public class SVO {
	private String id;
	private String name;
	private String brith;
	private int point;
	private String mname;
	private String renk;
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
	public String getBrith() {
		return brith;
	}
	public void setBrith(String brith) {
		this.brith = brith;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getRenk() {
		return renk;
	}
	public void setRenk(String renk) {
		this.renk = renk;
	}
	@Override
	public String toString() {
		return "SVO [id=" + id + ", name=" + name + ", brith=" + brith + ", point=" + point + ", mname=" + mname
				+ ", renk=" + renk + "]";
	}
	
	
}
