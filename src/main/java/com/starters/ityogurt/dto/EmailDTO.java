package com.starters.ityogurt.dto;

import java.util.Collection;
import java.util.List;

import com.amazonaws.services.simpleemail.model.Body;
import com.amazonaws.services.simpleemail.model.Content;
import com.amazonaws.services.simpleemail.model.Destination;
import com.amazonaws.services.simpleemail.model.Message;
import com.amazonaws.services.simpleemail.model.SendEmailRequest;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class EmailDTO {
    //AWS SES에 등록된 도메인명과 일치해야함
    static final String FROM_EMAIL = "ityogurt213@gmail.com";//"SES에 등록된 이메일"; // 보내는 사람
    private List<String> receiver; // 받는 사람
    private String subject; // 제목
    private String content; // 본문

    //SendEmailRequest 객체형태로 맞춰주기
    public SendEmailRequest toSendRequestDto() {
        //목적지 설정
        Destination destination = new Destination()
                // .withToAddresses(this.receiver)
                .withBccAddresses(this.receiver);

        //제목, 본문 설정
        Message message = new Message().withSubject(createContent(this.subject))
                .withBody(new Body().withHtml(createContent(this.content)));

        return new SendEmailRequest().withSource(FROM_EMAIL).withDestination(destination)
                .withMessage(message);
    }

    //본문 형식 설정
    private Content createContent(String text) {
        return new Content().withCharset("UTF-8").withData(text);
    }
}