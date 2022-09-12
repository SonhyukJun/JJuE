package pid.qnaBoard.service;

import java.util.List;

public interface QnABoardService {
	
	void QnABoardInsert(BoardVO boardVO) throws Exception;
	
	List<BoardVO> qnABoardList(BoardVO boardVo) throws Exception;
	
	BoardVO selectQnABoard(BoardVO boardNo) throws Exception;
	
	void updateQnABoard(BoardVO boardVo) throws Exception;
	
	void deleteQnABoard(BoardVO boardVo) throws Exception;
	
	BoardVO backQnABoard(BoardVO boardVo) throws Exception;
	
	BoardVO nextQnABoard(BoardVO boardVo) throws Exception;
}
