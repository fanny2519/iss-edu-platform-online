package com.iss.edu.model;

import lombok.Data;

import java.util.Date;

@Data
public class ClassPlan {
    private int id;
    private String context;
    private int classId;
    private Date lastUpdate;
}
