package com.starters.ityogurt.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class LearnRecordDTO {
	int learnSeq, isRight, userSeq, quizSeq;
	String userChoice;

	public int getLearnSeq() {
		return learnSeq;
	}

	public void setLearnSeq(int learnSeq) {
		this.learnSeq = learnSeq;
	}

	public int getIsRight() {
		return isRight;
	}

	public void setIsRight(int isRight) {
		this.isRight = isRight;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public int getQuizSeq() {
		return quizSeq;
	}

	public void setQuizSeq(int quizSeq) {
		this.quizSeq = quizSeq;
	}

	public String getUserChoice() {
		return userChoice;
	}

	public void setUserChoice(String userChoice) {
		this.userChoice = userChoice;
	}
}
