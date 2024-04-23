package ubmProgram.dto;

public class CDto {
	
	
	////////////// 강의 Dto
	
	

	// 필드
	private int c_id;
	private String c_name;
	private int grade;
	private String when;
	private String where;
	private int p_id;
	private int d_id;
	
	
	
	
	// getter, setter
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getWhen() {
		return when;
	}
	public void setWhen(String when) {
		this.when = when;
	}
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	
	
	
	@Override
	public String toString() {
		return "CDto [c_id=" + c_id + ", c_name=" + c_name + ", grade=" + grade + ", when=" + when + ", where=" + where
				+ ", p_id=" + p_id + ", d_id=" + d_id + "]";
	}
	
	
	
}
