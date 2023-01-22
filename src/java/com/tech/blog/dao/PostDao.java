/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;
import com.tech.blog.entities.Catagory;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Catagory> getCategory()
    {
    ArrayList<Catagory> list=new ArrayList<>();
    
        try {
            String query="select * from categries";
            Statement st=this.con.createStatement();
            ResultSet result=st.executeQuery(query);
            while(result.next())
            {
                int cid=result.getInt("cid");
                String name=result.getString("cname");
                String desc=result.getString("cdesc");
                Catagory c=new Catagory(cid, name, desc);
                list.add(c);
                
                        
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    
    return list;
    
    }
    public boolean savePost(Post p)
    {
        boolean f=false;
        try {
            String query="insert into post(ptitle,content,code,pic,cid,userid)values(?,?,?,?,?,?)";
            PreparedStatement pstm=con.prepareStatement(query);
            pstm.setString(1, p.getPtitle());
            pstm.setString(2,p.getContent());
            pstm.setString(3, p.getCode());
            pstm.setString(4, p.getPic());
            pstm.setInt(5, p.getCid());
            pstm.setInt(6, p.getUserid());
            pstm.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    public List getAllPost()
    {
        List<Post> list=new ArrayList<>();
        try {
            String queery="select * from post order by pid desc";
            PreparedStatement pstm=con.prepareStatement(queery);
            ResultSet result=pstm.executeQuery();
            while(result.next())
                
            {
                int pid=result.getInt("pid");
                String ptitle=result.getString("ptitle");
                String content=result.getString("content");
                String code=result.getString("code");
                String pic=result.getString("pic");
                Timestamp regtime=result.getTimestamp("regdate");
                int cid=result.getInt("cid");
                int userid=result.getInt("userid");
                
                Post post=new Post(pid, ptitle, content, code, pic, regtime, cid,userid);
                list.add(post);
                
                
                
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return list;
    }
     public List getPostByCat(int catid)
    {
        List<Post> list=new ArrayList<>();
        try {
            String queery="select * from post where cid=?";
            PreparedStatement pstm=con.prepareStatement(queery);
            pstm.setInt(1, catid);
            ResultSet result=pstm.executeQuery();
            while(result.next())
                
            {
                int pid=result.getInt("pid");
                String ptitle=result.getString("ptitle");
                String content=result.getString("content");
                String code=result.getString("code");
                String pic=result.getString("pic");
                Timestamp regtime=result.getTimestamp("regdate");
               
                int userid=result.getInt("userid");
                
                Post post=new Post(pid, ptitle, content, code, pic, regtime,catid,userid);
                list.add(post);
                
                
                
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return list;
    }
    
     public Post getpostbypostid(int postid)
     { 
           Post post=null;
         try {
           
             String query ="select * from post where pid =?";
             PreparedStatement pstm=con.prepareStatement(query);
             pstm.setInt(1, postid);
             ResultSet result=pstm.executeQuery();
             if(result.next())
             {
               
                String ptitle=result.getString("ptitle");
                String content=result.getString("content");
                String code=result.getString("code");
                String pic=result.getString("pic");
                Timestamp regtime=result.getTimestamp("regdate");
                int cid=result.getInt("cid");
                int userid=result.getInt("userid");
                
               post=new Post(postid, ptitle, content, code, pic, regtime,cid,userid);  
             }
             
         } catch (Exception e) {
             e.printStackTrace();
         }
         return post;
     }
    
}
