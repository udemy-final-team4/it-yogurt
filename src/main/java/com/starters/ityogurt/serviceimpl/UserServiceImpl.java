package com.starters.ityogurt.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Service;

import com.starters.ityogurt.dao.BoardDAO;
import com.starters.ityogurt.dao.CommentDAO;
import com.starters.ityogurt.dao.LearnRecordDAO;
import com.starters.ityogurt.dao.UserDAO;
import com.starters.ityogurt.dto.UserDTO;
import com.starters.ityogurt.service.UserService;
import com.starters.ityogurt.util.Criteria;
import com.starters.ityogurt.util.DateUtil;

import jakarta.servlet.http.HttpSession;

@Service("userservice")
public class UserServiceImpl implements UserService {

    @Autowired
    UserDAO dao;
    @Autowired
    CommentDAO commentDao;
    @Autowired
    BoardDAO boardDao;
    @Autowired
    LearnRecordDAO learnRecordDao;
  
	  @Autowired
	  EmailServiceImpl emailService;

 	  @Override
	  public List<UserDTO> getAllUserlist(){
		  return dao.getAllUserlist();
	  }
    
	  @Override
	  public List<UserDTO> getAllUserlistLimit(Criteria cri){
		  return dao.getAllUserlistLimit(cri);
	  }

	  @Override
	  public int countAllUser(){
		  return dao.countAllUser();
	  }

	  @Override
	  public void deleteUser(int userSeq) {
		  commentDao.deleteCommentByUserSeq(userSeq);//게시글에 달린 타인 댓글 삭제
		  commentDao.deleteComment(userSeq);//내가 쓴 코멘트 삭제
		  boardDao.deleteBoard(userSeq); //내 게시글 삭제
		  learnRecordDao.deleteLearnData(userSeq); //내 퀴즈 기록 삭제
		  dao.deleteUser(userSeq); //유저 정보 삭제
	  }

    @Override
    public int insertUser(UserDTO dto) {
        return dao.insertUser(dto);
    }

    @Override
    public UserDTO getUserByUserSeq(int userSeq) {
        return dao.getUserByUserSeq(userSeq);
    }

    @Override
    public UserDTO getUserByUserEmail(String email) {
        return dao.getUserByUserEmail(email);
    }

    @Override
    public int setIsPassByUserSeq(int userSeq) {
        return dao.setIsPassByUserSeq(userSeq);
    }

    @Override
    public int setLastLoginDateByUserSeq(int userSeq) {
        return dao.setLastLoginDateByUserSeq(userSeq);
    }

    @Override
    public void AfterLoginProcess(UserDTO result, HttpSession session) {
        setAttendanceByUserSeq(result);
        setLastLoginDateByUserSeq(result.getUserSeq());
        session.setAttribute("user_seq", result.getUserSeq());
    }

    @Override
    public int setAttendanceByUserSeq(UserDTO user) {
        DateUtil diff = new DateUtil();
        try {
            String afterDay = diff.afterOneDay(user.getLastloginDate(), 1);
            Boolean current = afterDay.split(" ")[0].equals(user.getLastloginDate().split(" ")[0]);
            int attendance = current ? user.getAttendance() + 1 : 0;

            return dao.setAttendanceByUserSeq(user.getUserSeq(), attendance);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateUserInfo(Map<Object, Object> map) {
        dao.updateUserInfo(map);

    }

    @Override
    public int setWeakCategoryByUser(UserDTO userDto) {

        return dao.setWeakCategoryByUser(userDto);
    }

    @Override
    public void updateUserDeclaration(int user_seq) {
        dao.updateUserDeclaration(user_seq);
    }

	@Override
	public List<UserDTO> getSearchUserList(String keyword) {
		return dao.getSearchUserList(keyword);
	}

}
