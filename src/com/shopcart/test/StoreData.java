package com.shopcart.test;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class StoreData {
	public static void main(String[] args) {
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session = factory.openSession();

//		User user1 = new User("John", "John");
//		User user2 = new User("James", "James");
//		User user3 = new User("Smith", "Smith");
//		User user4 = new User("Admin", "Admin");
//		User user5 = new User("xuan", "xuan");

		Transaction transaction = session.beginTransaction();
//		session.persist(user1);
//		session.persist(user2);
//		session.persist(user3);
//		session.persist(user4);
//		session.persist(user5);
//		System.out.println("Saved!");
//		transaction.commit();

		session.close();
	}
}
