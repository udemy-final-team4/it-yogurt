package com.starters.ityogurt.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class LearnRecordQuizDTO {
	int learnSeq, isRight, userChoice, userSeq, CategorySeq;
	int quizSeq,answer,deleted, knowSeq;
	String question, commentary, insertDate;
	String choice1, choice2, choice3, choice4;
}
