package com.springapp.mvc.footballStats.service;

import com.springapp.mvc.footballStats.dao.PlaybookDAO;
import com.springapp.mvc.footballStats.dao.PlaybookDAOImpl;
import com.springapp.mvc.footballStats.model.Play;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PlaybookServiceImpl implements PlaybookService{

    @Autowired
	private PlaybookDAO playbookDAO;

    @Transactional
	public void addPlay(Play play) {
		playbookDAO.addPlay(play);
	}

    @Transactional
	public void updatePlay(Play play) {
		playbookDAO.updatePlay(play);
	}

    @Transactional
	public Play getPlay(int id) {
		return playbookDAO.getPlay(id);
	}

    @Transactional
	public void deletePlay(int id) {
		playbookDAO.deletePlay(id);
	}

    @Transactional
	public List<Play> getPlays() {
		return playbookDAO.getPlays();
	}

}
