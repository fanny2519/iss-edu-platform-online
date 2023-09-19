package com.iss.edu.model.vo;

import com.iss.edu.model.ClassPlan;
import lombok.Data;

import java.util.List;

@Data
public class ClassPlanVO {

    private int id;
    private String className;
    private String planDate;
    private List<ClassPlan> plans;

}
