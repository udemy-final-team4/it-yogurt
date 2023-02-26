package com.starters.ityogurt.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.starters.ityogurt.dto.BoardDTO;
import com.starters.ityogurt.util.Criteria;

@Mapper
@Repository
public interface BoardDAO {
	
	List<Map<String,String>> getBoardJoinUser(Criteria cri);
	
	Map<String,String> getOneBoardJoinUser(int boardSeq);

	int countAllBoard();
	
	void deleteBoard(int userSeq);
	
	void viewCntBoard(int boardSeq);
	
	int insertBoard(BoardDTO dto);
	
	void updateBoard(BoardDTO dto);
	
	void deleteBoardByBoardSeq(int boardSeq);
}
