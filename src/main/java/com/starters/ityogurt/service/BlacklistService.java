package com.starters.ityogurt.service;

import java.util.List;

import com.starters.ityogurt.dto.BlacklistDTO;
import com.starters.ityogurt.util.Criteria;

public interface BlacklistService {
	
	void insertBlackUser (String email);
	
	int countBlackedEmail();
	
	List<BlacklistDTO> getAllBlackedUserList(Criteria cri);
	
	void deleteBlackedEmail(String email);

}
