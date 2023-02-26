package com.starters.ityogurt.dao;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface BlacklistDAO {
	
	void insertBlackUser (String email);
	
	int countBoard();

}
