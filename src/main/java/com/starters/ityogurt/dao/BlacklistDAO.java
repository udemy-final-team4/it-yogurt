package com.starters.ityogurt.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.starters.ityogurt.dto.BlacklistDTO;
import com.starters.ityogurt.util.Criteria;


@Mapper
@Repository
public interface BlacklistDAO {
	
	void insertBlackUser (String email);
	
	int countBlackedEmail();
	
	List<BlacklistDTO> getAllBlackedUserList(Criteria cri);
	
	void deleteBlackedEmail(String email);

}
