package ph.service;

import java.util.Date;

import lombok.Data;

@Data
public class ReserveVO {
	
	private int reserveNum;
	
	private String roomNumber;
	private Date reserveDate;
	private int count;
	private int totalKg;
	
	private String memberId;
	private String memberNickname;
	private String memberTelNumber;
	private String memberGrade;
	private String memberRole;
	
	private int price;	
	private String reqContent;
	
}
