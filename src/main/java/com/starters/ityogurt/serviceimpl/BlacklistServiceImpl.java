package com.starters.ityogurt.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starters.ityogurt.dao.BlacklistDAO;
import com.starters.ityogurt.dao.UserDAO;
import com.starters.ityogurt.dto.BlacklistDTO;
import com.starters.ityogurt.dto.UserDTO;
import com.starters.ityogurt.service.BlacklistService;
import com.starters.ityogurt.service.UserService;
import com.starters.ityogurt.util.Criteria;

@Service("blacklistservice")
public class BlacklistServiceImpl implements BlacklistService {
	
	@Autowired
	BlacklistDAO dao;
	
	@Override
	public void insertBlackUser (String email) {
		dao.insertBlackUser(email);
	}

	@Override
	public int countBlackedEmail() {
		return dao.countBlackedEmail();
	}

	@Override
	public List<BlacklistDTO> getAllBlackedUserList(Criteria cri) {
		return dao.getAllBlackedUserList(cri);
	}

	@Override
	public void deleteBlackedEmail(String email) {
		dao.deleteBlackedEmail(email);
	}
	
}
