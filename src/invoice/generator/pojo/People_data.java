package invoice.generator.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "people_data")
public class People_data {

	@Id
	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "title")
	private String title;

	@Column(name = "bill_rate")
	private int bill_rate;

	@Column(name = "role")
	private String role;

	@Column(name = "currentstate")
	private int currentstate;

	public int getCurrentstate() {
		return currentstate;
	}

	public void setCurrentstate(int currentstate) {
		this.currentstate = currentstate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getBill_rate() {
		return bill_rate;
	}

	public void setBill_rate(int bill_rate) {
		this.bill_rate = bill_rate;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
