package com.ripienosingers.utils;

import com.ripienosingers.model.NotificationPool;
import retrofit.Call;
import retrofit.Response;

import javax.annotation.Nullable;

public class RequestExecutor {

    public <T> T execute(Call<T> call, NotificationPool notifPool, @Nullable String successMessage) {

        try {
            Response<?> result = call.execute();
            if (!result.isSuccess()) {
                throw new Exception(result.message());
            }
            if (successMessage != null) {
                notifPool.pushSuccessMessage(successMessage);
            }

            return (T) result.body();
        } catch (Exception e) {
            notifPool.pushErrorMessage("Oops! A problem occurred. ERROR: " + e.getMessage() + ". Please try again.");
            e.printStackTrace();
            return null;
        }

    }

    public <T> T execute(Call<T> call, NotificationPool notifPool) {
        return execute(call, notifPool, null);
    }
}
