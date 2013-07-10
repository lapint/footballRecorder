package com.springapp.mvc.footballStats.dao;


import com.springapp.mvc.footballStats.model.PlayResult;
import com.springapp.mvc.footballStats.model.User;
import com.springapp.mvc.footballStats.model.UserRole;

import java.util.List;

public interface RegisterDAO {

	public void addUser(User user);
    public void addUserRole(UserRole userRole);
//	public void updatePlayResult(PlayResult playResult);
//	public PlayResult getPlayResult(int id);
//	public void deletePlayResult(int id);
//	public List<PlayResult> getPlayResults();
}
