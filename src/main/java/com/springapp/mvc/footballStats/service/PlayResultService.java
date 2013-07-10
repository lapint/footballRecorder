package com.springapp.mvc.footballStats.service;


import com.springapp.mvc.footballStats.model.PlayResult;

import java.util.List;
/**
 * Used to add a play to the plays
 * @author luke pint
 *
 */
public interface PlayResultService {
	
	public void addPlayResult(PlayResult play);
	public void updatePlayResult(PlayResult play);
	public PlayResult getPlayResult(int id);
	public void deletePlayResult(int id);
	public List<PlayResult> getPlayResults(Integer game_Id);
}
