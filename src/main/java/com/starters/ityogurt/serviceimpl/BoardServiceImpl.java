package com.starters.ityogurt.serviceimpl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starters.ityogurt.dao.BoardDAO;
import com.starters.ityogurt.dto.BoardDTO;
import com.starters.ityogurt.service.BoardService;
import com.starters.ityogurt.util.Criteria;

@Service("boardservice")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO dao;

	@Override
	public List<Map<String,String>> getBoardJoinUser(Criteria cri) {
		return dao.getBoardJoinUser(cri);
	}

	@Override
	public Map<String, String> getOneBoardJoinUser(int boardSeq) {
		return dao.getOneBoardJoinUser(boardSeq);
	}

	@Override
	public int countAllBoard() {
		return dao.countAllBoard();
	}

	@Override
	public void deleteBoard(int userSeq) {
		dao.deleteBoard(userSeq);
	}

	@Override
	public void viewCntBoard(int boardSeq) {
		dao.viewCntBoard(boardSeq);
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		return dao.insertBoard(dto);
	}

	@Override
	public void updateBoard(BoardDTO dto) {
		dao.updateBoard(dto);
	}

	@Override
	public void deleteBoardByBoardSeq(int boardSeq) {
		dao.deleteBoardByBoardSeq(boardSeq);
	}

	
	
}
