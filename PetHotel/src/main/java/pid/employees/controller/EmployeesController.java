package pid.employees.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pid.employees.service.EmployeesService;
import pid.employees.service.EmployeesVO;

@Controller
public class EmployeesController {
	
	@Resource(name = "employeesService")
	private EmployeesService service;
	
	@ResponseBody
	@RequestMapping(value = "loginEmployee.do", method = RequestMethod.POST)
	public int loginEmployee(@RequestParam(name = "employeeNo") String employeeNo,
			@RequestParam(name = "employeePassword") String employeePassword,
			EmployeesVO employeesVo, HttpSession session) throws Exception {
		System.out.println(employeeNo);
		System.out.println(employeePassword);
		int result = service.loginEmployee(employeesVo);
		if(result == 1) {
			String employeeNickname = service.selectEmployeeNickname(employeeNo);
			String employeeRole = service.selectEmployeeRole(employeeNo);
			EmployeesVO employeeSession = service.selectEmployee(employeeNo);
			session.setAttribute("SessionEmployeeNo", employeesVo.getEmployeeNo());
			session.setAttribute("SessionEmployeeNickname", employeeNickname);
			session.setAttribute("SessionEmployeeRole", employeeRole);
			session.setAttribute("SessionEmployee", employeeSession);
		}
		return result;
	}
}
