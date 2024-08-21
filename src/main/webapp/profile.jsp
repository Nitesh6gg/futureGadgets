<%@page import="com.connection.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page errorPage="error.jsp" %>   
<%@page import="java.util.*" %>
<%@page import="com.entity.*" %>
<%@page import="com.dao.*" %>

<% User us=(User)request.getSession().getAttribute("user"); 
if(us!=null){
request.setAttribute("us",us);
//response.sendRedirect("login.jsp");
}

//this is for cart no.
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);

}



%>   


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile page</title>
<%@ include file="component/allcss.jsp" %>
<style>
.alert {
            display: none;
        }
</style>
</head>
<body>

<%@ include file="component/navbar.jsp" %>


<section style="background-color: #eee ms;">
  <div class="container py-3">
    <div class="row">
    
   
    
      <div class="col">
        
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
          
         
          
          <h4>Welcome</h4>
            <img src="img/profile_pic.png" alt="avatar"
              class="rounded-circle img-fluid" style="width: 200px;">
            <h5 class="my-3"><%=us.getName() %></h5>
            <p class="text-muted mb-1">Register on:</p>
            <p class="text-muted mb-4"><strong>01-01-2022</strong></p>
            <div class="d-flex justify-content-center mb-2">
              
            </div>
          </div>
        </div>
        <div >
          <!-- space  -->
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
          
           <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">U-ID</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getId() %></p>
              </div>
            </div>
            <hr>
          
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getName() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getEmail() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Password</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getPassword() %></p>
              </div>
            </div>
            <hr>
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getPhoneNo() %></p>
              </div>
            </div>
            <hr>
            
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getAddress() %></p>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-2">
          <div class="box" data-toggle="modal"
			data-target="#editprofile-modal">
           <button type="button" class="btn btn-primary"> <span class="fa fa-pencil-square-o"></span>&nbsp;Edit</button>
          
           </div>
          </div>
         
      </div>
    </div>
  </div>
  </div>
</section>

<!--profile Modal -->	
	

	<div class="modal fade " id="editprofile-modal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
				
					<div class="modal-header">
					
						<h6 class="modal-title" id="exampleModalLongTitle">Update details:
							</h6>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
					
 
		
					
					<section style="background-color: #eee ms;">
					 <form action="updateProfileServlet" method="post">
  <div class="container py-3">
    <div class="row">
      <div class="col">
        
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
          <h4>Welcome</h4>
            <img src="img/profile_pic.png" alt="avatar"
              class="rounded-circle img-fluid" style="width: 200px;">
            <h5 class="my-3"><%=us.getName() %></h5>
         
            <div class="d-flex justify-content-center mb-2">
             
            </div>
          </div>
        </div>
        <div >
         <button type="submit" class="btn btn-primary"style="position: absolute;  right: 30%; " > <span class="fa fa-cloud-upload "></span>&nbsp;Update</button>
          <!-- space  -->
        </div>
      </div>
        
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
          
           <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">ID</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getId() %></p>
              </div>
            </div>
            <hr>
          
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getName() %></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=us.getEmail() %></p>
              </div>
            </div>
            <hr>
            
            
        
            <div class="row">

              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <input type="text" class="form-control" name="phoneNo" placeholder="Enter Phone no." required>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Password</p>
              </div>
              <div class="col-sm-9">
                <input type="text" class="form-control" name="update-password" placeholder="Enter new Password" required>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
               <input type="text" class="form-control" name="update-address" placeholder="Enter your Address" required>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-2">
           
           
           </div>
           
          </div>
          
         
         
         
      </div>
      </div>
      </div>
      </form>
    </section> 
      
    </div>
    
  </div>

					</div>
				</div>
			

	<!--profile Modal end -->
 <script>
        $(document).ready(function () {
            $('button').click(function () {
                $('.alert').show()
            })
        });
    </script>	

</body>
</html>