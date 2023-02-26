package com.starters.ityogurt.error;

public class ApiException extends RuntimeException {

    private ErrorCode error;

    public ApiException(ErrorCode e) {
        super(e.getMessage());
        this.error = e;
    }
}