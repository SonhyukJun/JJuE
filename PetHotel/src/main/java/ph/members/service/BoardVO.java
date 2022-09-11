package ph.members.service;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo;
	private String title;
	private String content;
	private String boardType;
	// review, free, notice
	private Date wdate;
	
	private String memberId;
	private String memberNickname;
	private String memberRole;
	
	// 리뷰게시판일시 사진 등록? 할만한 부분
}
