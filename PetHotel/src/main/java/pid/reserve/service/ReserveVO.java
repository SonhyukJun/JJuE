package pid.reserve.service;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	
	private int reserveNumber;
	
	private String roomNumber;
	private Date reserveStartDate;
	private Date reserveEndDate;
	private int count;
	
	private String memberId;
	
	private int price;	
	private String reqContent;
	
}
