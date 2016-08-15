package invoice.generator.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "timesheet_data")
public class TimeSheet_data {

	@Id
	@Column(name = "id")
	private int id;

	@Column(name = "userid")
	private int userid;

	@Column(name = "hours")
	private int hours;

	@Column(name = "date")
	private String date;

	@Column(name = "projectnumber")
	private int projectnumber;
	
	@Column(name = "accepted")
	private int accepted=0;
	
	

	public int getAccepted() {
		return accepted;
	}

	public void setAccepted(int accepted) {
		this.accepted = accepted;
	}

	public int getProjectnumber() {
		return projectnumber;
	}

	public void setProjectnumber(int projectnumber) {
		this.projectnumber = projectnumber;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getHours() {
		return hours;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
