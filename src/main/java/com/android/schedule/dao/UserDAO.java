package com.android.schedule.dao;

public interface UserDAO {
    int login(String studentNumber, String password) throws Exception;
}
