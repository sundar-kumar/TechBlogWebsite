

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
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
        <div class="container text-center">
            <img src="img/cancelled.png" class="img-fluid">
             <h1>Sorry! Something went wrong </h1>
             <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">HOME</a>
        </div>
       
    </body>
</html>
