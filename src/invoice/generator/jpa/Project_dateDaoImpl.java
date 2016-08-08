package invoice.generator.jpa;

import java.util.List;

import invoice.generator.pojo.Project_data;

public class Project_dateDaoImpl extends
		GenericDaoJpaImpl<Project_data, Integer> {

	public List findWithName(String name) {
		
		return entityManager
				.createQuery(
						"SELECT c FROM Project_data c WHERE c.project_name = :project_name")
				.setParameter("project_name", name).getResultList();
	}
}
