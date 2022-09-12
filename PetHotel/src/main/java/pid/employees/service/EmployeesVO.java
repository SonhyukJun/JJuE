package pid.employees.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmployeesVO {
	private Integer employeeNo;
	private String employeeId;
	private String employeePassword;
	private String employeeName;
	private String employeeNickname;
	private String employeeResident;
	private String employeeTelNumber;
	private String employeeAddress;
	private String employeeRole;

}
