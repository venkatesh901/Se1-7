package invoice.generator.jpa;

import java.util.List;

import invoice.generator.pojo.People_data;

public class Test_dataDaoImpl extends GenericDaoJpaImpl<People_data, Integer> {

	public int employeecount(int currentstate) {

		return entityManager
				.createQuery(
						"SELECT c FROM People_data c where c.currentstate=:currentstate").setParameter("currentstate", currentstate)
				.getResultList().size();
		
		
	}
	
	public int projectcount(String currentstate) {

		return entityManager
				.createQuery(
						"SELECT c FROM Project_data c where c.status=:currentstate").setParameter("currentstate", currentstate)
				.getResultList().size();
		
		
	}
	
	public int clientcount(int currentstate) {

		return entityManager
				.createQuery(
						"SELECT c FROM Client_data c where c.currentstate=:currentstate").setParameter("currentstate", currentstate)
				.getResultList().size();
		
		
	}
}
