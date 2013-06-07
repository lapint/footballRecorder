package com.springapp.mvc.footballStats.dao;

import com.springapp.mvc.footballStats.model.PlayResult;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class PlayResultDAOImpl implements PlayResultDAO{

    @Autowired
	private SessionFactory sessionFactory;
	
	private Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void addPlayResult(PlayResult playResult) {
		getCurrentSession().save(playResult);
	}

	public void updatePlayResult(PlayResult playResult) {
		PlayResult playResultToUpdate = getPlayResult(playResult.getId());
		playResultToUpdate.setName(playResult.getName());
		playResultToUpdate.setType(playResult.getType());
		playResultToUpdate.setPlatoon(playResult.getPlatoon());
		getCurrentSession().update(playResultToUpdate);
	}

	public PlayResult getPlayResult(int id) {
		PlayResult playResult = (PlayResult) getCurrentSession().get(PlayResult.class, id);
		return playResult;
	}

	public void deletePlayResult(int id) {
		PlayResult playResult = getPlayResult(id);
		if(playResult!=null){
			getCurrentSession().delete(playResult);
		}
	}

	@SuppressWarnings("unchecked")
	public List<PlayResult> getPlayResults() {
		return getCurrentSession().createQuery("from PlayResults").list();
	}
	
}
