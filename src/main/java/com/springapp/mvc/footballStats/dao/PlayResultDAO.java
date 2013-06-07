package com.springapp.mvc.footballStats.dao;


import com.springapp.mvc.footballStats.model.PlayResult;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface PlayResultDAO {

	public void addPlayResult(PlayResult playResult);
	public void updatePlayResult(PlayResult playResult);
	public PlayResult getPlayResult(int id);
	public void deletePlayResult(int id);
	public List<PlayResult> getPlayResults();
}
