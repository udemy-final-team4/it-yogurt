package com.starters.ityogurt.dto;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
public class BoardDTO { 
	
	int boardSeq, viewcount, userSeq, categorySeq;
	String title, content, img;
	String insertDate;
	
	

}
