package invoice.generator.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "project_data")
public class Project_data {

	@Id
	@Column(name = "project_number")
	private int project_number;

	@Column(name = "client")
	private int client;

	@Column(name = "project_name")
	private String project_name;

	@Column(name = "state_date")
	private String state_date;

	@Column(name = "end_date")
	private String end_date;

	@Column(name = "status")
	private String status;

	@Column(name = "project_manager")
	private String project_manager;

	@Column(name = "client_contact")
	private String client_contact;

	@Column(name = "budget")
	private int budget;

	public int getProject_number() {
		return project_number;
	}

	public void setProject_number(int project_number) {
		this.project_number = project_number;
	}

	public int getClient() {
		return client;
	}

	public void setClient(int client) {
		this.client = client;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public String getState_date() {
		return state_date;
	}

	public void setState_date(String state_date) {
		this.state_date = state_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProject_manager() {
		return project_manager;
	}

	public void setProject_manager(String project_manager) {
		this.project_manager = project_manager;
	}

	public String getClient_contact() {
		return client_contact;
	}

	public void setClient_contact(String client_contact) {
		this.client_contact = client_contact;
	}

	public int getBudget() {
		return budget;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

}
