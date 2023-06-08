package com.jsp.cloth_show_room.dao;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.jsp.cloth_show_room.dto.Admin;

/**
 * 
 * @author asus
 *
 */
public class AdminDao {

	EntityManager entityManager = Persistence.createEntityManagerFactory("showroom").createEntityManager();
	
	
	/*
	 * login with admin
	 */
	public Admin loginAdmin(String adminEmail) {
		
		String selectadminEmail = "SELECT * FROM admin WHERE adminemail=:name";
		
		Query query = entityManager.createNativeQuery(selectadminEmail);
		
		Admin admin=(Admin) query.getSingleResult();
		
		return admin;
	}
}
