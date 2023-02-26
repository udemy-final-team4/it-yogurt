package com.starters.ityogurt.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starters.ityogurt.dao.BlacklistDAO;
import com.starters.ityogurt.dao.UserDAO;
import com.starters.ityogurt.dto.UserDTO;
import com.starters.ityogurt.service.BlacklistService;
import com.starters.ityogurt.service.UserService;

@Service("blacklistservice")
public class BlacklistServiceImpl implements BlacklistService {
	
	@Autowired
	BlacklistDAO dao;
	
	@Override
	public void insertBlackUser (String email) {
		dao.insertBlackUser(email);
	}
	
}
