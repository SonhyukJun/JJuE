package pid.employees.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pid.employees.service.EmployeesDAO;
import pid.employees.service.EmployeesService;

@Service("EmployeesService")
public class EmployeesServiceImpl implements EmployeesService {
	
	@Resource(name = "EmployeesDAOMyBatis")
	private EmployeesDAO employeesDAO;

}
