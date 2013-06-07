package com.springapp.mvc.footballStats.service;


import com.springapp.mvc.footballStats.model.Play;

import java.util.List;

/**
 * Used to add a play to the playbook
 * @author luke pint
 *
 */
public interface PlaybookService {
	
	public void addPlay(Play play);
	public void updatePlay(Play play);
	public Play getPlay(int id);
	public void deletePlay(int id);
	public List<Play> getPlays();
}
