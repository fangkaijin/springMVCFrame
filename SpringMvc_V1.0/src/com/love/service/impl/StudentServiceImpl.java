package com.love.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.love.dao.EntityDao;
import com.love.entity.Student;
import com.love.service.StudentService;


@Service("studentServiceImpl")
@Transactional(rollbackFor=Exception.class)
public class StudentServiceImpl implements StudentService {
	@Autowired
	public EntityDao entityDao;

	@Transactional(propagation=Propagation.REQUIRED)
	public void save(Student st) {
		entityDao.save(st);
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public void delete(Student obj) {
		entityDao.delete(obj);
	}

	public List<Student> findAll() {
		return entityDao.findAll();
	}

	@Transactional(propagation=Propagation.REQUIRED)
	public void update(Student model) {
		entityDao.update(model);
	}
}
