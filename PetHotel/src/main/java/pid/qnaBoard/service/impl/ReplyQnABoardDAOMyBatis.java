package pid.qnaBoard.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import pid.qnaBoard.service.ReplyQnABoardDAO;
import pid.qnaBoard.service.ReplyQnABoardVO;

@Repository("ReplyQnABoardDAOMyBatis")
public class ReplyQnABoardDAOMyBatis extends EgovAbstractMapper implements ReplyQnABoardDAO{

	@Override
	public List<ReplyQnABoardVO> replyQnABoardList(ReplyQnABoardVO replyQnABoardVo) throws Exception {
		return selectList("replyQnABoardList",replyQnABoardVo);
	}

	@Override
	public ReplyQnABoardVO selectReplyQnABoard(ReplyQnABoardVO replyQnABoardVo) throws Exception {
		return selectOne("selectReplyQnABoard", replyQnABoardVo);
	}

	@Override
	public int maxReplyQnABoardNo(ReplyQnABoardVO replyQnABoardVo) throws Exception {
		return selectOne("maxReplyQnABoardNo",replyQnABoardVo);
	}

	@Override
	public int minReplyQnABoardNo(ReplyQnABoardVO replyQnABoardVo) throws Exception {
		return selectOne("minReplyQnABoardNo",replyQnABoardVo);
	}

}
