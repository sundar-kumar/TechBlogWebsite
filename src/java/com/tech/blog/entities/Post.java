/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class Post {
    private int pid;
    private String ptitle;
    private String content;
   private int userid;
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
   

  
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public Timestamp getRegdate() {
        return regdate;
    }

    public void setRegdate(Timestamp regdate) {
        this.regdate = regdate;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
    private String code;
    private String pic;
    private Timestamp regdate;
    private int cid;

    public Post(String ptitle, String content, String code, String pic, Timestamp regdate, int cid, int userid) {
        this.ptitle = ptitle;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.regdate = regdate;
        this.cid = cid;
        this.userid=userid;
    }

    public Post(int pid, String ptitle, String content, String code, String pic, Timestamp regdate, int cid,int userid) {
        this.pid = pid;
        this.ptitle = ptitle;
        this.content = content;
        this.code = code;
        this.pic = pic;
        this.regdate = regdate;
        this.cid = cid;
        this.userid=userid;
    }

    public Post() {
    }
    
}
