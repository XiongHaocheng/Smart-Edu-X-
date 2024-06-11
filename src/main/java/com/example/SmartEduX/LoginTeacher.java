package com.example.SmartEduX;

public class LoginTeacher {
    private static int visitCount = 0;
    public static void addVisitCount() {
        LoginTeacher.visitCount++;
    }

    public static int getVisitCount() {
        return LoginTeacher.visitCount;
    }
}
