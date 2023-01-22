<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<div class="row">
    
    <%
        Thread.sleep(1000);
        PostDao dao=new PostDao(ConnectionProvider.getConnection());
        int cid=Integer.parseInt(request.getParameter("cid"));
         List<Post> list=null ;
        if(cid==0){
       list=dao.getAllPost();
        }
        else
        {
        list=dao.getPostByCat(cid);
        }
        for(Post p: list)
        {
        %>
      
        <div class="col-md-6 mt-2" >
           
            <div class="card">
                <img class="card-img-top" src="blog_pics/<%= p.getPic() %>" alt="Card image cap">
                <div class="card-body">
                    
                     <b> <%= p.getPtitle() %> </b>
                      <p> <%= p.getContent() %> </p>
          
        
           
                </div>
                      <div class="card-footer">
                          <a href="show_post_single.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm">Read More</a>
                          <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"> </i>
                              <span>10</span>
                          <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"> </i>
                              <span>20</span>
                          </a>
                      
                      
                      </div>
                
                
            </div>
                 
                 
    </div>
         
     
        
        <% } %>
       
          </div> 
      
