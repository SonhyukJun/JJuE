package pid.qnaBoard.service;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@AllArgsConstructor
@NoArgsConstructor
public class BoardVO {
	private int boardNo;
	private String title;
	private String content;
	private Date wdate;
	private String boardType;
	private String memberId;
	private String memberNickname;
	private String employeeId;
	private String employeeNickname;
	private String employeeRole;
	private String reviewPicturePath;
	// 리뷰게시판일시 사진 등록? 할만한 부분
}
