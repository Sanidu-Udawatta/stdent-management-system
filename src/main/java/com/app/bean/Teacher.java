package com.app.bean;

import java.io.Serializable;

public class Teacher implements Serializable {
   private double id;
   private String firstName;
   private String lastName;

    public double getId() {
        return id;
    }

    public void setId(double id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Teacher() {
    }
}
