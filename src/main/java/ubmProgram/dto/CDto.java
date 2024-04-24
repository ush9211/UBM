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
	private String p_name;
	private int d_id;
	private int s_id;
	private String d_name;
	private int max;
	
	
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	
	@Override
	public String toString() {
		return "CDto [c_id=" + c_id + ", c_name=" + c_name + ", grade=" + grade + ", when=" + when + ", where=" + where
				+ ", p_id=" + p_id + ", p_name=" + p_name + ", d_id=" + d_id + ", s_id=" + s_id + "]";
	}
	
	
	
}
