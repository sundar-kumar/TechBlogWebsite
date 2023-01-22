/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;
public class userdao {
    private Connection con;

    public userdao(Connection con) {
        this.con = con;
    }
    public boolean saveUser(User user){
      boolean f=false;
        try {
            String query="insert into techtable1(name,email,password,gender,about )Values(?,?,?,?,?)";
         PreparedStatement pstm= this.con.prepareStatement(query);
       
         pstm.setString(1, user.getName());
         pstm.setString(2, user.getEmail()); 
         pstm.setString(3, user.getPassword());
         pstm.setString(4, user.getGender());
         pstm.setString(5, user.getAbout());
         pstm.execute();
         f=true;
         
         System.out.println("Hello from save..");
         
       
        } catch (Exception e) {
            e.printStackTrace();
        }
      return f;
    
    }
    public User getUserbyEmailAndPassword(String email,String password){
        User user=null;
        try {
            String query="select * from techtable1 where email=? and password=?";
            PreparedStatement pstm=con.prepareStatement(query);
            pstm.setString(1,email);
            pstm.setString(2,password);
            ResultSet result=pstm.executeQuery();
            if(result.next())
            {
                user=new User();
                user.setId(result.getInt("id"));
                user.setName(result.getString("name"));
                user.setEmail(result.getString("email"));
                user.setPassword(result.getString("password"));
                user.setGender(result.getString("gender"));
                user.setDatetime(result.getTimestamp("regdate"));
                user.setAbout(result.getString("about"));
                user.setProfile(result.getString("profile"));
            }
        } catch (Exception e) {
        }
        return user;
   
    }
    public boolean UpdateUser(User user)
    {
        boolean b=false;
        try {
            String query="update techtable1 set name=? , email=?, password=? , gender=?, about=? , profile=? where id=? ";
            PreparedStatement p=con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
            
            p.executeUpdate();
            b=true;
            
            
       
        } catch (Exception e) {
            e.printStackTrace();
        }
        return b;
    }
    public User getUserByPostId(int userid)
    {
        User user=null;
        try {
            String querry="select * from techtable1 where id=?";
            PreparedStatement pstm=this.con.prepareStatement(querry);
            pstm.setInt(1, userid);
            ResultSet result=pstm.executeQuery();
            if(result.next())
            {
                 user=new User();
                user.setId(result.getInt("id"));
                user.setName(result.getString("name"));
                user.setEmail(result.getString("email"));
                user.setPassword(result.getString("password"));
                user.setGender(result.getString("gender"));
                user.setDatetime(result.getTimestamp("regdate"));
                user.setAbout(result.getString("about"));
                user.setProfile(result.getString("profile"));
                
            }
                    
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    }
    
}
