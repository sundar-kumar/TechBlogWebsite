<%-- 
    Document   : index
    Created on : Sep 18, 2022, 9:30:55 PM
    Author     : ADMIN
--%>


<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
            
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 97% 87%, 54% 89%, 14% 95%, 1% 83%, 0 1%);
            }
            </style>
    </head>
    
    <body>
       
        <%@include file="normalnavbar.jsp" %>
     
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                <h3 class="display"> Welcome to TechBlog</h3>
                <p>Welcome to Technical Blog, World of Technology</p>
                <button class="btn btn-outline-light btn-lg" ><span class="fa fa-child"></span> Start it free</button>
                <a href="login-page.jsp"class="btn btn-outline-light btn-lg" ><span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
                
                
                
                
            </div>
             
        </div>
        <br>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Here you will find all about java.</p>
    <a href="#" class="btn btn-primary primary-background text-white">Read More</a>
  </div>
</div>
                </div>
                 <div class="col-md-4">
     <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Here you will find all about java.</p>
    <a href="#" class="btn btn-primary primary-background text-white">Read More</a>
  </div>
       </div>
                 </div>
                 <div class="col-md-4">
    <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Here you will find all about java.</p>
    <a href="#" class="btn btn-primary primary-background text-white">Read More</a>
  </div>
</div> 
                </div>
            </div>
              <div class="row">
                <div class="col-md-4">
                    <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Here you will find all about java.</p>
    <a href="#" class="btn btn-primary primary-background text-white">Read More</a>
  </div>
</div>
                </div>
                 <div class="col-md-4">
     <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Here you will find all about java.</p>
    <a href="#" class="btn btn-primary primary-background text-white">Read More</a>
  </div>
       </div>
                 </div>
                 <div class="col-md-4">
    <div class="card" >
 
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Here you will find all about java.</p>
    <a href="#" class="btn btn-primary primary-background text-white">Read More</a>
  </div>
</div> 
                </div>
            </div>
                                 

        </div>
        <%
            Connection con=ConnectionProvider.getConnection();
            %>
            <h1><%= con %></h1>
        
        <script
  src="https://code.jquery.com/jquery-3.6.1.min.js"
  integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
  crossorigin="anonymous"></script>
  
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<!-- comment <script src="javascript/jsfile1.js" type="text/javascript"></script> -->
 
  
    </body>
    </html>
       
        
  
    

