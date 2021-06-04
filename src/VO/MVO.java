package VO;

public class MVO {
	private String no;
	private String name;
	private String birth;
	private String gender;
	private String talent;
	private String agency;
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTalent() {
		return talent;
	}
	public void setTalent(String talent) {
		this.talent = talent;
	}
	public String getAgency() {
		return agency;
	}
	public void setAgency(String agency) {
		this.agency = agency;
	}
	@Override
	public String toString() {
		return "MVO [no=" + no + ", name=" + name + ", birth=" + birth + ", gender=" + gender + ", talent=" + talent
				+ ", agency=" + agency + "]";
	}
	
	
}
