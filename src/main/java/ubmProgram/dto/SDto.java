package ubmProgram.dto;

import java.sql.Timestamp;

public class SDto {
	
	
	////////////// 학생 Dto
	
	

	// 필드
	private int s_id;
	private String s_name;
	private String s_pass;
	private String s_email;
	private String s_tel;
	private String s_addr;
	private int d_id;
	private Timestamp wdate;

	

	// getter, setter
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_pass() {
		return s_pass;
	}
	public void setS_pass(String s_pass) {
		this.s_pass = s_pass;
	}
	public String getS_email() {
		return s_email;
	}
	public void setS_email(String s_email) {
		this.s_email = s_email;
	}
	public String getS_tel() {
		return s_tel;
	}
	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}
	public String getS_addr() {
		return s_addr;
	}
	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int d_id) {
		this.d_id = d_id;
	}
	public Timestamp getWdate() {
		return wdate;
	}
	public void setWdate(Timestamp wdate) {
		this.wdate = wdate;
	}
	
	
	
	
	
	
	@Override
	public String toString() {
		return "SDto [s_id=" + s_id + ", s_name=" + s_name + ", s_pass=" + s_pass + ", s_email=" + s_email + ", s_tel="
				+ s_tel + ", s_addr=" + s_addr + ", d_id=" + d_id + ", wdate=" + wdate + "]";
	}
	
	
	
	
	
}
