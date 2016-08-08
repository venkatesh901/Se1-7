package invoice.generator.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "project_person_data")
public class ProjectPerson_data {

	@Id
	@Column(name = "id")
	private int id;

	@Column(name = "project_number")
	private int project_number;

	@Column(name = "project_name")
	private String project_name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProject_number() {
		return project_number;
	}

	public void setProject_number(int project_number) {
		this.project_number = project_number;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

}
