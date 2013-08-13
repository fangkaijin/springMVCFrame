package com.love.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.love.dao.EntityDao;
import com.love.entity.Student;


@Repository("entityDaoImpl")
public class EntityDaoImpl implements EntityDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public void save(Student s) {
		hibernateTemplate.save(s);
	}

	@SuppressWarnings("unchecked")
	public List<Student> findAll() {
		return hibernateTemplate.find("from Student");
	}

	public void update(Student model) {
		hibernateTemplate.update(model);
	}

	public void delete(Student model) {
		hibernateTemplate.delete(model);
	}
}
