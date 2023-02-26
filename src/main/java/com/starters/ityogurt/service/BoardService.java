package com.starters.ityogurt.service;

import java.util.List;
import java.util.Map;

import com.starters.ityogurt.dto.BoardDTO;
import com.starters.ityogurt.util.Criteria;

public interface BoardService {
	
	List<Map<String,String>> getBoardJoinUser(Criteria cri);
	
	Map<String,String> getOneBoardJoinUser(int boardSeq);
	
	int countAllBoard();
	
	void deleteBoard(int userSeq);
	
	void viewCntBoard(int boardSeq);
	
	int insertBoard(BoardDTO dto);
	
	void updateBoard(BoardDTO dto);
	
	void deleteBoardByBoardSeq(int boardSeq);

}
