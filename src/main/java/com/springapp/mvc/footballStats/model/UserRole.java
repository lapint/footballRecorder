package com.springapp.mvc.footballStats.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: lukepint
 * Date: 7/3/13
 * Time: 11:01 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name="User_Roles")
public class UserRole {

    @Id
    private Integer User_Role_Id;

    public Integer getUser_Role_Id() {
        return User_Role_Id;
    }

    public void setUser_Role_Id(Integer user_Role_Id) {
        User_Role_Id = user_Role_Id;
    }

    public Integer getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(Integer user_Id) {
        User_Id = user_Id;
    }

    public String getAuthority() {
        return Authority;
    }

    public void setAuthority(String authority) {
        Authority = authority;
    }

    private Integer User_Id;
    private String Authority;
}
