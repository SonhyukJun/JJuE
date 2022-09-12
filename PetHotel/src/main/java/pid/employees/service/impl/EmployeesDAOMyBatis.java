package pid.employees.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import pid.employees.service.EmployeesDAO;

@Repository("EmployeesDAOMyBatis")
public class EmployeesDAOMyBatis extends EgovAbstractMapper implements EmployeesDAO {

}
