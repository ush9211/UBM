package ubmProgram.dto;

public class PDto {

	
	////////////// 교수 Dto
	
	

	// 필드
	private int p_id;
	private String p_pass;
	private String p_name;
	private String p_email;
	private String p_tel;
	private int d_id;

	

	// getter, setter
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_pass() {
		return p_pass;
	}
	public void setP_pass(String p_pass) {
		this.p_pass = p_pass;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_email() {
		return p_email;
	}
	public void setP_email(String p_email) {
		this.p_email = p_email;
	}
	public String getP_tel() {
		return p_tel;
	}
	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	
	
	
	
	
	
	@Override
	public String toString() {
		return "PDto [p_id=" + p_id + ", p_pass=" + p_pass + ", p_name=" + p_name + ", p_email=" + p_email + ", p_tel="
				+ p_tel + ", d_id=" + d_id + "]";
	}
	
	
	
	
	
	
}
