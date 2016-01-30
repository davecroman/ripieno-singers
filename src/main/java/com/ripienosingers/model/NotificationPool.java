package com.ripienosingers.model;

import java.util.ArrayList;
import java.util.List;

public class NotificationPool {

    private List<String> successMessages;
    private List<String> errorMessages;

    public NotificationPool() {
        this.successMessages = new ArrayList<>();
        this.errorMessages = new ArrayList<>();
    }

    public void pushSuccessMessage(String message) {
        successMessages.add(message);
    }

    public void pushErrorMessage(String message) {
        errorMessages.add(message);
    }

    public List<String> popSuccessMessages() {
        List<String> successMessages = this.successMessages;

        this.successMessages = new ArrayList<>();

        return successMessages;
    }

    public List<String> popErrorMessages() {
        List<String> errorMessages = this.errorMessages;

        this.errorMessages = new ArrayList<>();

        return errorMessages;
    }
}
