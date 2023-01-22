<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Catagory"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
    response.sendRedirect("login-page.jsp");
}
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
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
  
           <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"> <span class="	fa fa-at"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="	fa fa-bell-o"></span> Code with Sundar <span class="sr-only">(current)</span></a>
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
           <!-- Main body of the page -->
           <main>
               <div class="container">
                   <div class="row mt-4">
                       <!-- First colum catagory-->
                       <div class="col-md-4">
                           <div class="list-group">
                               <a href="#"onclick="getpost(0 , this)" class= "c-link   list-group-item list-group-item-action active">
    All Posts
  </a>
  <%
      PostDao dao=new PostDao(ConnectionProvider.getConnection());
      ArrayList<Catagory> list1=dao.getCategory();
      for(Catagory cc: list1)
      {
      %>
                               
         <a href="#" onclick="getpost(<%= cc.getCid() %>,this)" class="c-link  list-group-item list-group-item-action"><%= cc.getName() %></a>
         
  <% }%>
  
</div>
                       </div>
                         <!-- 2nd colum posts-->
                         <div class="col-md-8" >
                           <div class="container text-center" id="loader">
                               <i class="fa fa-refresh fa-3x fa-spin"> </i>
                               <h3 class="mt-2"> Loading... </h3>
                               
                           </div>
                             <div class="container-fluid" id="post_cont">
                                 
                                 
                             </div>
                       </div>
                   </div>
               </div>
           </main>
           
           
           <!--End Main body of thr page -->
           
             <%
                                Message m=(Message)session.getAttribute("msg");
                                if(m!=null)
                                {
                                %>
                                <div class="alert alert-primary" role="alert">
                                    <%= m.getContent() %>
                                    </div>
                                <%
                                    session.removeAttribute("msg");
                            }
                                %>
                            
           
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
<!-- Start of add post modal -->


<!-- Modal -->
<div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id="add-post" action="AddPostServlet" method="post" enctype="Multi/form-data">
              <div class="form-group">
                  <select class="form-control" name="cid" >
                      <option selected disabled>---Select Catagory---</option>
                      <%
                          PostDao postd=new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Catagory> list=postd.getCategory();
                          for(Catagory c: list)
                          {
                          %>
                          <option value="<%= c.getCid() %>"> <%= c.getName() %> </option>
                     
                      <% 
                          }
                      %>
                      
                  </select>
              </div>
              <div class="form-group">
                  <input name="post_title" type="text" placeholder="Enter Post Title" name="post_title" class="form-control" />
                
             
              </div>
               <div class="form-group">
                   <textarea name="post_cont" class="form-control" style="height: 100px;" placeholder="Enter Content" ></textarea>
               </div>
               <div class="form-group">
                   <textarea name="post_code" class="form-control" style="height: 100px;" placeholder="Enter Your Code(if any)" ></textarea>
               </div>
               <div class="form-group">
                    <label> Select your pic </label>
                    <input name="post_pic" type="file" class="form-control"  />
                  
               </div>
                      <div class="container text-center">
                           <button type="Submit" class="btn btn-outline-primary">Post</button>
       </div>
              
          </form>
        
      </div>
     
       
      
    </div>
  </div>
</div>


<!--End of add post modal  -->


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
    <!-- javascript for add post -->
    <script>
        $(document).ready(function(e){
         $("#add-post").on("submit",function(event){
                     //thus will run when form submitted
             event.preventDefault();
             console.log("Submitted");
             let form=new FormData(this);
             //now requesting on servlet
             $.ajax({
                     url: "AddPostServlet",
                     type: 'POST',
                     data: form,
                     success: function (data, textStatus, jqXHR) {
                       //success coding... 
                       console.log(data);
                       if(data.trim()== 'done')
                       {
                           swal("Good job!", "Saved Blog Successfully!", "success");
                       }
                       else
                       {
                           swal("Error!", "Something Went Wrong!", "error");
                       }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                         swal("Error!", "Something Went Wrong!", "error");
                        //error coding
                    },
                    processData: false,
                    contentType: false
                    
                     
        }  )
         })   
             
        })
        </script> 
        <script>
            function getpost(catid,temp)
                    {
                        $("#loader").show();
                        $("#post_cont").hide();
                        $(".c-link").removeClass('active')
                         $.ajax({
                   url: "loadpost.jsp",
                   data: {cid : catid},
                   success: function (data, textStatus, jqXHR) {
                       console.log(data); 
                       $("#loader").hide();
                       $("#post_cont").show();
                       $('#post_cont').html(data)
                       $(temp).addClass('active')
                    }
               })
                    }
                
            $(document).ready(function (e)
            {
                let allpostref=$('.c-link')[0]
               getpost(0,allpostref);
              
            })
        </script>

    </body>
</html>
