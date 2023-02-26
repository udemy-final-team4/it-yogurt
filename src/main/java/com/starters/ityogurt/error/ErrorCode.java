package com.starters.ityogurt.error;

public enum ErrorCode {
    INTERNAL_SERVER_ERROR(500,"C001","INTERNAL_SERVER_ERROR"),
    
    // 로그인 & 회원가입
    SIGNUP_INVALID_EMAIL(500, "S001", "중복된 이메일 입니다. 다른 이메일을 입력해주세요"),
    SIGNIN_INVALID_EMAIL(500, "S010", "가입되지 않은 사용자입니다."),
    SIGNIN_INVALID_PASSWORD(500, "S011", "회원정보가 틀립니다. 회원정보를 다시 확인해주세요."),
    SIGNIN_INVALID_OAUTHUSER(500, "S011", "간편 로그인 사용자입니다. 간편 로그인으로 로그인 해주세요."),
    
    // 오답노트
    WRONGQUIZ_INVALID_ANSWER (500, "W001", "퀴즈 정보가 갱신되지 않았습니다.");
    
    private final String code;
    private final String message;
    private final int status;

    public String getCode()
    {
        return code;
    }

    public String getMessage()
    {
        return message;
    }
    public int getStatus()
    {
        return status;
    }

    ErrorCode(final int status, final String code, final String message)
    {
        this.status = status;
        this.message = message;
        this.code = code;
    }
}