package com.springapp.mvc.footballStats.service;

import com.springapp.mvc.footballStats.model.User;
import com.springapp.mvc.footballStats.model.UserRole;

/**
 * Created with IntelliJ IDEA.
 * User: lukepint
 * Date: 7/3/13
 * Time: 10:59 PM
 * To change this template use File | Settings | File Templates.
 */
public interface RegisterService {
    public void addUser(User user);
    public void addUserRole(UserRole userRole);
//    public void updatePlayResult(PlayResult play);
//    public PlayResult getPlayResult(int id);
//    public void deletePlayResult(int id);
//    public List<PlayResult> getPlayResults();
}
