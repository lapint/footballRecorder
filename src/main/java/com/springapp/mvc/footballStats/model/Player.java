package com.springapp.mvc.footballStats.model;

import javax.persistence.*;


@Entity
@Table(name="Players")
public class Player {

	@Id
	@GeneratedValue
	private Integer id;
	
	 @Column(name = "Name", nullable = false)
	private String Name;
	
	private Integer Number;
	
	private String Position;
	
	private String Year;
	
	private String Platoon;

    public String getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(String user_Id) {
        User_Id = user_Id;
    }

    private String User_Id;

	
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
}
