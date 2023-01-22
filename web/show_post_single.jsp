<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.userdao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
    response.sendRedirect("login-page.jsp");
}
    %>

<%
    int postid=Integer.parseInt(request.getParameter("post_id"));
    PostDao dao =new PostDao(ConnectionProvider.getConnection());
    Post p=dao.getpostbypostid(postid);
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getPtitle() %></title>
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
            
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 97% 87%, 54% 89%, 14% 95%, 1% 83%, 0 1%);
            
            }
            .post-title
            {
                font-weight: 100;
                font-size: 30px;
            }
            
            .post-content{
                 font-weight: 100;
                font-size: 25px;
            }
            .post-code{
                 font-weight: 100;
                font-size: 25px;
            }
            
            
            </style>
    </head>
    <body>
           <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="	fa fa-at"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="profile.jsp"><span class="	fa fa-bell-o"></span> Code with Sundar <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-circle"></span> Categeries
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
       <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact</a>
      </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#do-post-modal"><span class="fa fa-address-book"></span> Do Post</a>
      </li>
         </ul>
       <ul class="navbar-nav mr-right">
           <li class="nav-item">
               <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"> </span> <%= user.getName() %> </a>
           </li>
                 <li class="nav-item">
          <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Log Out</a>
      </li>  
      </ul>
             
  </div>
</nav>
              
           <!-- Start of modal -->
    


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background">
        <h5 class="modal-title " id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <div class="modal-body text-center" >
            <img src="pics/<%=user.getProfile() %>" class="img-fluid " style="border-radius: 50%; max-width: 100px;" >
          <h5><%= user.getName() %> </h5>
          <div  id="profile-detail" class="container text-center">
            
            <table class="table">
  <thead>
    <tr>
      <th scope="col">ID :</th>
      <th scope="col"><%= user.getId() %></th>
     
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">Email:</th>
      <td><%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender:</th>
      <td><%=user.getGender() %></td>
    
    </tr>
    <tr>
      <th scope="row">Registered on:</th>
      <td><%=user.getDatetime() %></td>
     
    </tr>
     </tr>
    <tr>
      <th scope="row">About:</th>
      <td>    <%=user.getAbout() %></td>
     
    </tr>
  </tbody>
</table>
          </div> <!-- End of profile detail div -->
          <div id="edit-profile" style="display: none;" >
              <h2 class=" mt-2"> Please Edit Carefully </h2>
              <form action="EditServlet" method="post" enctype="multipart/form-data">
                  <table class="table">
                      <tr>
                          <td> ID:</td>
                          <td> <%= user.getId() %></td>
                          </tr
                          <tr>
                          <td> Email:</td>
                          <td><input type="email" class="form-control" name="user_email" value="    <%= user.getEmail()%>"></td>
                          </tr>
                           <tr>
                          <td> Name:</td>
                          <td><input type="text" class="form-control" name="user_name" value="    <%= user.getName()%>"></td>
                          </tr>
                           <td> Password:</td>
                          <td><input type="password" class="form-control" name="user_password" value=" <%= user.getPassword()%>"></td>
                          </tr>
                          
                           <tr>
                          <td> Gender:</td>
                         <td>    <%= user.getGender()%></td>
                          </tr>
                          <tr>
                          <td> About:</td>
                          <td> <textarea id="id" class="form-control" name="user_about" rows="2" cols="15"><%=user.getAbout() %></textarea>     </td>
                          </tr>
                          <tr>
                          <td> Select Profile:</td>
                          <td> <input type="file" name="user_image" class="form-control" > </td>
                          </tr>
                  </table>
                          <div class="container">
                              <button class="btn btn-outline-primary" type="submit">Save</button>
                          </div>
              </form>
              
          </div> <!-- End of edit profile -->
      </div>
                          <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>


    
        
<!-- End of modal !-->
        <!-- Main content of page -->
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header text-center">
                            <h4 class="post-title">  <%=p.getPtitle() %> </h4>
                        </div>
                        <div class="card-body">
                              <img class="card-img-top my-2" src="blog_pics/<%= p.getPic() %>" alt="Card image cap">
                              <div class="row my-2">
                                  <div class="col-md-8">
                                      <%
                                          userdao d=new userdao(ConnectionProvider.getConnection());
                                        //  User u=d.getUserByPostId(p.getUserid());
                                          %>
                                          <p>  <a href="#"><%= d.getUserByPostId(p.getUserid()).getName() %> </a> has posted: </p>
                                      
                                  </div>
                                  <div class="col-md-4">
                                      <p><%= DateFormat.getDateTimeInstance().format(p.getRegdate()) %> </p>
                                      
                                  </div>
                              </div>
                              <p class="post-content"> <%=p.getContent() %> </p>
                            <br>
                            <br>
                            <div class="post-code">
                            <pre> <%=p.getCode()%> </pre>
                            </div>                                                  </div>
                        <div class="card-footer primary-background">
                            <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"> </i>
                              <span>10</span>
                          <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"> </i>
                              <span>20</span>
                          </a>
                        </div>
                    </div>
                    
                    
                    
                </div>
            </div>
        </div>
        
        
        <!-- End Main content of page -->
        
        <script
  src="https://code.jquery.com/jquery-3.6.1.min.js"
  integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
  crossorigin="anonymous"></script>
  
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    $(document).ready(function()
    {
        let editstatus=false;
        $('#edit-profile-button').click(function()
        {
            if(editstatus==false)
            {
            $('#profile-detail').hide()
            $('#edit-profile').show();
            editstatus=true;
            $(this).text("Back")
        }
        else
        {
             $('#profile-detail').show()
            $('#edit-profile').hide()
            editstatus=false;
            $(this).text("Edit")
        }
            
        })
    });
        
    </script>
    </body>
</html>
