package pid.employees.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import pid.employees.service.EmployeesDAO;
import pid.employees.service.EmployeesService;
import pid.employees.service.EmployeesVO;

@Service("employeesService")
public class EmployeesServiceImpl implements EmployeesService {
	
	@Resource(name = "employeesDAOMyBatis")
	private EmployeesDAO dao;
	
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	@Override
	public int loginEmployee(EmployeesVO employeesVo) throws Exception {
		int result = dao.loginEmployee(employeesVo);
		return result;
	}

	@Override
	public void insertEmployee(EmployeesVO employeesVo) throws Exception {
		String employeeNo = egovIdGnrService.getNextStringId();
		employeesVo.setEmployeeNo(employeeNo);
		dao.insertEmployee(employeesVo);		
	}

	@Override
	public EmployeesVO selectEmployee(String employeeNo) throws Exception {
		return dao.selectEmployee(employeeNo);
	}

	@Override
	public String selectEmployeeNickname(String employeeNo) throws Exception {
		return dao.selectEmployeeNickname(employeeNo);
	}

	@Override
	public String selectEmployeeRole(String employeeNo) throws Exception {		
		return dao.selectEmployeeRole(employeeNo);
	}
}
