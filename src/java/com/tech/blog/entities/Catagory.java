/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

/**
 *
 * @author ADMIN
 */
public class Catagory {
    private int cid;
      private String name;
    private String desc;

    public Catagory(String name, String desc) {
        this.name = name;
        this.desc = desc;
    }

    public Catagory() {
    }

    public Catagory(int cid, String name, String desc) {
        this.cid = cid;
        this.name = name;
        this.desc = desc;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
  
    
}
