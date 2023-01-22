/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ADMIN
 */
public class Testdata {
     private static Connection con;
    public static Connection getConnection()
    {
        try {
             
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3309/TechBlog1","root","heerani123");
          
            System.out.println("succefulyy");
        } catch (Exception e) {
        }
        return con;
    }
    public static void main(String arg[])
    {
        getConnection();
    }
    
    
}
