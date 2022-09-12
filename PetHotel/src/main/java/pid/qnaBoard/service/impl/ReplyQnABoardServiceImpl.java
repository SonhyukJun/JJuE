package pid.qnaBoard.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pid.qnaBoard.service.ReplyQnABoardDAO;
import pid.qnaBoard.service.ReplyQnABoardService;
import pid.qnaBoard.service.ReplyQnABoardVO;

@Service("ReplyQnABoardService")
public class ReplyQnABoardServiceImpl implements ReplyQnABoardService {
	
	@Resource(name= "ReplyQnABoardDAOMyBatis")
	private ReplyQnABoardDAO replyQnABoardDAO;

	@Override
	public List<ReplyQnABoardVO> replyQnABoardList(ReplyQnABoardVO replyQnABoardVo) throws Exception {
		return replyQnABoardDAO.replyQnABoardList(replyQnABoardVo);
	}

	@Override
	public ReplyQnABoardVO selectReplyQnABoard(ReplyQnABoardVO replyQnABoardVo) throws Exception {
		return replyQnABoardDAO.selectReplyQnABoard(replyQnABoardVo);
	}

	@Override
	public int maxReplyQnABoardNo(ReplyQnABoardVO replyQnABoardVo) throws Exception {
		return replyQnABoardDAO.maxReplyQnABoardNo(replyQnABoardVo);
	}

	@Override
	public int minReplyQnABoardNo(ReplyQnABoardVO replyQnABoardVo) throws Exception {
		return replyQnABoardDAO.minReplyQnABoardNo(replyQnABoardVo);
	}

}
