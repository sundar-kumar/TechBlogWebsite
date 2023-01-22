/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class ConnectionProvider {
    
    private static Connection con;
    public static Connection getConnection()
    {
        try {
            if(con==null)
            {
                
             
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3309/techdatabase1","root","heerani123");
          
            System.out.println("succefulyy");
            }
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        return con;
    }
        
    
}
