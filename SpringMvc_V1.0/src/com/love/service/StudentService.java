package com.love.service;

import java.util.List;

import com.love.entity.Student;

public interface StudentService {

	public void save(Student st);

	public void delete(Student obj);

	public List<Student> findAll();

	public void update(Student model);
}
