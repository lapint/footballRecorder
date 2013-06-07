package com.springapp.mvc.footballStats.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Playbook")
public class Play {

	@Id
	@GeneratedValue
	private Integer id;
	
	private String Name;
	private String Type;
	private String Platoon;
	
	public Integer getId(){
		return this.id;
	}
	
	public void setId(Integer id){
		this.id = id;
	}
	
	public String getName(){
		return this.Name;
	}
	
	public void setName(String Name){
		this.Name = Name;
	}
	
	public String getType(){
		return this.Type;
	}
	
	public void setType(String type){
		this.Type = type;
	}
	
	public String getPlatoon(){
		return this.Platoon;
	}
	
	public void setPlatoon(String platoon){
		this.Platoon = platoon;
	}
	
}
