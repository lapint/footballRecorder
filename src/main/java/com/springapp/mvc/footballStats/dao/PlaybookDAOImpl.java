package com.springapp.mvc.footballStats.dao;

import com.springapp.mvc.footballStats.model.Play;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class PlaybookDAOImpl implements PlaybookDAO{

    @Autowired
    private SessionFactory sessionFactory;

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public void addPlay(Play play) {
		getCurrentSession().save(play);
	}

	public void updatePlay(Play play) {
		Play playToUpdate = getPlay(play.getId());
		playToUpdate.setName(play.getName());
		playToUpdate.setType(play.getType());
		playToUpdate.setPlatoon(play.getPlatoon());
		getCurrentSession().update(playToUpdate);
	}

	public Play getPlay(int id) {
		Play play = (Play) getCurrentSession().get(Play.class, id);
		return play;
	}

	public void deletePlay(int id) {
		Play play = getPlay(id);
		if(play!=null){
			getCurrentSession().delete(play);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Play> getPlays() {
		return getCurrentSession().createQuery("from Play").list();
	}

	
}
