package com.starters.ityogurt.dto;


import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class CommentDTO { 
	
	int commentSeq, isPrivate, userSeq, boardSeq;
	String content, insertDate;
	
	
	
	
}
