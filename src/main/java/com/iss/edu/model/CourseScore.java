package com.iss.edu.model;

/**
 * 课程评分表
 */
public class CourseScore {

    // pk
    private int id;
    // 评分
    private int score;
    // 所属课程
    private Course course;
    // 评论者
    private User user;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
