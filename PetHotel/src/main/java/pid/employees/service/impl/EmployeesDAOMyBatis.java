package pid.employees.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import pid.employees.service.EmployeesDAO;
import pid.employees.service.EmployeesVO;

@Repository("employeesDAOMyBatis")
public class EmployeesDAOMyBatis extends EgovAbstractMapper implements EmployeesDAO {
	
	@Override
	public int loginEmployee(EmployeesVO employeesVo) throws Exception {
		int result = selectOne("loginEmployee", employeesVo); 
		return result;
	}
	
	@Override
	public void insertEmployee(EmployeesVO employeesVo) throws Exception {
		insert("insertEmployee", employeesVo);
	}

	@Override
	public EmployeesVO selectEmployee(String employeeNo) throws Exception {
		return selectOne("selectEmployee", employeeNo);
	}

	@Override
	public String selectEmployeeNickname(String employeeNo) throws Exception {
		return selectOne("selectEmployeeNickname", employeeNo);
	}

	@Override
	public String selectEmployeeRole(String employeeNo) throws Exception {
		return selectOne("selectEmployeeRole", employeeNo);
	}


}
