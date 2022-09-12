package pid.qnaBoard.service;

import java.util.List;

public interface ReplyQnABoardDAO {
	
	List<ReplyQnABoardVO> replyQnABoardList(ReplyQnABoardVO replyQnABoardVo) throws Exception;
	
	ReplyQnABoardVO selectReplyQnABoard(ReplyQnABoardVO replyQnABoardVo) throws Exception;
	
	int maxReplyQnABoardNo(ReplyQnABoardVO replyQnABoardVo) throws Exception;
	
	int minReplyQnABoardNo(ReplyQnABoardVO replyQnABoardVo) throws Exception;
}
