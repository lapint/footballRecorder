package com.springapp.mvc.footballStats.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;

@Entity
@Table(name="PlayerStats")
public class PlayerStat implements Comparable<PlayerStat>{

    @Id
    private Integer Player_Id;

    private Integer Sacks=0;
    private Integer Carries=0;
    private Integer Recs=0;
    private Integer Ints=0;
    private Integer Tackles=0;
    private Integer ForcedFumbles=0;
    private Integer Fumbles=0;
    private Integer FGs=0;
    private Integer XPs=0;
    private Integer Comps=0;
    private Integer PassYds=0;
    private Integer RushYds=0;
    private Integer RecYds=0;
    private Integer TDs=0;
    private String Opponent;
    private String Date;
    private String Name;

    public String getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(String user_Id) {
        User_Id = user_Id;
    }

    private String User_Id;

    public Integer getRecs() {
        return Recs;
    }

    public void setRecs(Integer recs) {
        Recs = recs;
    }

    public Integer getPlayer_Id() {
        return Player_Id;
    }

    public void setPlayer_Id(Integer player_Id) {
        Player_Id = player_Id;
    }

    public Integer getSacks() {
        return Sacks;
    }

    public void setSacks(Integer sacks) {
        Sacks = sacks;
    }

    public Integer getCarries() {
        return Carries;
    }

    public void setCarries(Integer carries) {
        Carries = carries;
    }

    public Integer getInts() {
        return Ints;
    }

    public void setInts(Integer ints) {
        Ints = ints;
    }

    public Integer getTackles() {
        return Tackles;
    }

    public void setTackles(Integer tackles) {
        Tackles = tackles;
    }

    public Integer getForcedFumbles() {
        return ForcedFumbles;
    }

    public void setForcedFumbles(Integer forcedFumbles) {
        ForcedFumbles = forcedFumbles;
    }

    public Integer getFumbles() {
        return Fumbles;
    }

    public void setFumbles(Integer fumbles) {
        Fumbles = fumbles;
    }

    public Integer getFGs() {
        return FGs;
    }

    public void setFGs(Integer FGs) {
        this.FGs = FGs;
    }

    public Integer getXPs() {
        return XPs;
    }

    public void setXPs(Integer XPs) {
        this.XPs = XPs;
    }

    public Integer getComps() {
        return Comps;
    }

    public void setComps(Integer comps) {
        Comps = comps;
    }

    public Integer getPassYds() {
        return PassYds;
    }

    public void setPassYds(Integer passYds) {
        PassYds = passYds;
    }

    public Integer getRushYds() {
        return RushYds;
    }

    public void setRushYds(Integer rushYds) {
        RushYds = rushYds;
    }

    public Integer getRecYds() {
        return RecYds;
    }

    public void setRecYds(Integer recYds) {
        RecYds = recYds;
    }

    public Integer getTDs() {
        return TDs;
    }

    public void setTDs(Integer TDs) {
        this.TDs = TDs;
    }

    public String getOpponent() {
        return Opponent;
    }

    public void setOpponent(String opponent) {
        Opponent = opponent;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String date) {
        Date = date;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }


    @Override
    public int compareTo(PlayerStat playerStat) {
        String date = playerStat.getDate();
        Date newDate  = getDate(date.split("-"));
        Date thisDate = getDate(this.getDate().split("-"));


        if(thisDate.before(newDate)){
            return -1;
        }
        if(thisDate.after(thisDate)){
            return 1;
        }

        return 0;  //To change body of implemented methods use File | Settings | File Templates.
    }

    private java.util.Date getDate(String[] split){
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, Integer.parseInt(split[2]));
        cal.set(Calendar.MONTH, Integer.parseInt(split[0]));
        cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(split[1]));
        Date date = cal.getTime();
        System.out.println(date.toString());
        return date;
    }
}
