package com.springapp.mvc.footballStats.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created with IntelliJ IDEA.
 * User: lukepint
 * Date: 7/3/13
 * Time: 11:00 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name="Users")
public class User {

    @Id
    @GeneratedValue
    private Integer Id;

    private String username;
    private String password;
    private Integer Type;

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getType() {
        return 1;
    }

    public void setType(Integer type) {
        Type = type;
    }


}
