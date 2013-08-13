package com.love.dao;

import java.util.List;

import com.love.entity.Student;

public interface EntityDao {

	public void save(Student s);

	public List<Student> findAll();

	public void update(Student model);

	public void delete(Student model);
}
