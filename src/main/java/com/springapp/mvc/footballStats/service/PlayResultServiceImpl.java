package com.springapp.mvc.footballStats.service;


import com.springapp.mvc.footballStats.dao.PlayResultDAO;
import com.springapp.mvc.footballStats.model.PlayResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;



@Service
@Transactional
public class PlayResultServiceImpl implements PlayResultService{

	@Autowired
	private PlayResultDAO playResultDAO;
	
	public void addPlayResult(PlayResult playResult) {
		playResultDAO.addPlayResult(playResult);
	}

	public void updatePlayResult(PlayResult playResult) {
		playResultDAO.updatePlayResult(playResult);
	}

	public PlayResult getPlayResult(int id) {
		return playResultDAO.getPlayResult(id);
	}

	public void deletePlayResult(int id) {
		playResultDAO.deletePlayResult(id);
	}

	public List<PlayResult> getPlayResults(Integer game_Id) {
		return playResultDAO.getPlayResults(game_Id);
	}

}
