package com.love.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.love.entity.Student;
import com.love.service.StudentService;

@Controller
@RequestMapping("/student.do")
public class StudentController {
	protected final transient Log log = LogFactory
			.getLog(StudentController.class);
	@Autowired
	public StudentService studentService;

	public StudentController() {
	}

	@RequestMapping
	public String load(ModelMap modelMap) {
		List<Student> list = studentService.findAll();
		modelMap.put("list", list);
		return "student";
	}

	@RequestMapping(params = "method=add")
	public String add(HttpServletRequest request, ModelMap modelMap)
			throws Exception {
		return "student_add";
	}

	@RequestMapping(params = "method=save")
	public String save(HttpServletRequest request, ModelMap modelMap) {
		Student st = new Student();
		String name = request.getParameter("name");
		String psw = request.getParameter("psw");
		st.setName(name);
		st.setPsw(psw);
		try {
			studentService.save(st);
			modelMap.put("addstate", "添加成功");
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
			modelMap.put("addstate", "添加失败b");
		}
		return "student_add";
	}

	@RequestMapping(params = "method=del")
	public void del(@RequestParam("id") String id, HttpServletResponse response) {
		try {
			Student st = new Student();
			st.setId(Integer.valueOf(id));
			studentService.delete(st);
			response.getWriter().print("{\"del\":\"true\"}");
		} catch (Exception e) {
			log.error(e.getMessage());
			e.printStackTrace();
		}
	}
}
