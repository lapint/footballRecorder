package com.springapp.mvc.footballStats.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Plays")
public class PlayResult {

	@Id
	@GeneratedValue
	private Integer id;

    private String Opponent;

    private String Date;

	private String Play;
	
	private String Carrier;

    private String Result;

    private Integer Yards;

    private Integer YTG;

    private Integer Down;

    private String Tackler;


	public Integer getId(){
		return this.id;
	}

    public Integer getYards(){
        return  this.Yards;
    }

    public void setYards(Integer yards){
        this.Yards = yards;
    }

    public String getTackler(){
        return this.Tackler;
    }

    public void setTackler(String Tackler){
        this.Tackler = Tackler;
    }


    public String getResult(){
        return this.Result;
    }

    public void setResult(String result){
        this.Result = result;
    }

    public Integer getYTG(){
        return this.YTG;
    }

    public void setYTG(Integer YTG){
        this.YTG = YTG;
    }

    public Integer getDown(){
        return this.Down;
    }

    public void setDown(Integer Down){
        this.Down = Down;
    }

	public String getOpponent(){
		return this.Opponent;
	}
	
	public void setOpponent(String Opponent){
		this.Opponent = Opponent;
	}
	
	public String getDate(){
		return this.Date;
	}
	
	public void setDate(String Date){
		this.Date = Date;
	}
	
	public String getCarrier(){
		return this.Carrier;
	}
	
	public void setCarrier(String Carrier){
		this.Carrier = Carrier;
	}
	
	public String getPlay(){
		return this.Play;
	}
	
	public void setPlay(String play){
		this.Play = play;
	}
	
//	public String getPlatoon(){
//		return this.Platoon;
//	}
//
//	public void setPlatoon(String platoon){
//		this.Platoon = platoon;
//	}
}
