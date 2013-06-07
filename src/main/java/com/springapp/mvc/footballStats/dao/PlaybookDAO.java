package com.springapp.mvc.footballStats.dao;

import com.springapp.mvc.footballStats.model.Play;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface PlaybookDAO {

	public void addPlay(Play play);
	public void updatePlay(Play play);
	public Play getPlay(int id);
	public void deletePlay(int id);
	public List<Play> getPlays();
}
