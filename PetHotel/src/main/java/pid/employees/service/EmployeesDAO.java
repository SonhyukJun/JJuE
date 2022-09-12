package pid.employees.service;

public interface EmployeesDAO {
	
	int loginEmployee(EmployeesVO employeesVo) throws Exception;
	
	void insertEmployee(EmployeesVO employeesVo) throws Exception;
	
	EmployeesVO selectEmployee(String employeeNo) throws Exception;
	
	String selectEmployeeNickname(String employeeNo) throws Exception;
	
	String selectEmployeeRole(String employeeNo) throws Exception;
}
