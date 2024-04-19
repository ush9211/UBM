package ubmProgram.dto;

public class PDto {

	
	////////////// 援먯닔 Dto
	
	

	// �븘�뱶
	private int p_id;
	private String p_pass;
	private String p_name;
	private String p_email;
	private String p_tel;


	

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

	
	
	
	
	
	
	@Override
	public String toString() {
		return "PDto [p_id=" + p_id + ", p_pass=" + p_pass + ", p_name=" + p_name + ", p_email=" + p_email + ", p_tel="
				+ p_tel + "]";
	}
	
	
	
	
	
	
}
