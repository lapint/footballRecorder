package com.springapp.mvc.footballStats.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="PlayResult")
public class PlayResult {

	@Id
	@GeneratedValue
	private Integer id;
	
	private String Name;
	
	private Integer Number;
	
	private String Position;
	
	private String Year;
	
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
	
	public void setName(String name){
		this.Name = name;
	}
	
	public Integer getNumber(){
		return this.Number;
	}
	
	public void setNumber(Integer number){
		this.Number = number;
	}
	
	public String getPosition(){
		return this.Position;
	}
	
	public void setPosition(String position){
		this.Position = position;
	}
	
	public String getYear(){
		return this.Year;
	}
	
	public void setYear(String year){
		this.Year = year;
	}
	
	public String getPlatoon(){
		return this.Platoon;
	}
	
	public void setPlatoon(String platoon){
		this.Platoon = platoon;
	}

	public Object getType() {
		// TODO Auto-generated method stub
		return null;
	}

	public void setType(Object type) {
		// TODO Auto-generated method stub
		
	}
}
