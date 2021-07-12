	package edu.poly.dao;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class JpaUtils {
	public static EntityManager getEntityManager() {
		return Persistence.createEntityManagerFactory("PolyOE_Asg").createEntityManager();
	}
}
