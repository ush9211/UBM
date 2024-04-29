package ubmProgram.dto;

public class MDto {
       private int id;
       private String userid;
       private String username;
       private String userpass;
       private String usertel;
       private String role;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUsertel() {
		return usertel;
	}
	public void setUsertel(String usertel) {
		this.usertel = usertel;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "MDto [id=" + id + ", userid=" + userid + ", username=" + username + ", userpass=" + userpass
				+ ", usertel=" + usertel + ", role=" + role + "]";
	}
       
       
       
}
