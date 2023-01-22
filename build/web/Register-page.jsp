

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register </title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
            
       clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 84%, 70% 100%, 31% 95%, 1% 90%, 1% 0);
            }
            </style>
    </head>
    <body>
        <%@include file="normalnavbar.jsp" %>
        <main class="primary-background banner-background " style="padding-bottom: 50px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center banner-background primary-background text-white"> 
                            <span class="fa fa-3x fa-user-circle"></span>
                            
                            Sign up</div>
                        <div class="card-body">
                            <form id="reg-form" action="Registerservlet" method="POST">
  <div class="form-group">
    <label for="user_name">User name</label>
    <input name="user_name" type="name" class="form-control" id="user-name" aria-describedby="Enter name">
   
  </div>
                                 <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input  name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
                                
                                
                                
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
  </div>
                                 <div class="form-group">
    <label for="gender">Select Gender</label>
    <br>
    <input type="radio" id="gender" name="gender" value="Male"> Male
    <input type="radio" id="gender" name="gender" value="Female"> Female
  </div>
 
                                
         
      <div class="form-group form-check">
          <textarea id="id" name="about" rows="2" cols="20" placeholder="Something about yourself"> </textarea>
                                    
      </div>
                                 <div class="form-group form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree term and condition</label>
  </div>
                                <div class="container text-center "id="loader" style="display: none;">
         <span class="fa fa-refresh fa-2x fa-spin">  </span>
         <h3>Please wait..</h3>
                                </div>
                                
  <button type="submit" class="btn btn-primary" id="sub-btn">Signup</button>
</form>
                        </div>
                    </div>
                </div>
                
            </div>
        </main>
        
        
        
        
            <script
  src="https://code.jquery.com/jquery-3.6.1.min.js"
  integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
  crossorigin="anonymous"></script>
  
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    
    $(document).ready(function()
    {
        console.log("loaded...")
        $('#reg-form').on('submit',function(event){
            event.preventDefault();
            $('#loader').show();
            $('#sub-btn').hide();
            
            let form=new FormData(this);
            $.ajax({
                url: "Registerservlet",
                type: 'POST',
                data: form,
                success: function (data,textstutas,jqXHR){
                    console.log(data)
                     $('#loader').hide();
            $('#sub-btn').show();
            if(data.trim()==='Done'){
           swal("Register Successfulyy. Now Redirect to Login")
                    .then((value) => {
                   window.location="login-page.jsp"
                       });
                   }
                   else{
                       swal(data);
                   }
       


                },
                error: function(jqXHR, textstutas, errorthrown) {
                    console.log(jqXHR)
                      $('#loader').hide();
                        $('#sub-btn').show();
                        swal("Something went wrong!");
                },
                processData: false,
                contentType: false
                
                
            });
            
        });
        
    });
        
</script>
    </body>
</html>
