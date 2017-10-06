

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
    <style>
.dropdown-toggle {
    background-color: whitesmoke;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

.dropdown {
    position: relative;
    display: inline-block;
}

.dropdown-menu {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-menu a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-menu a:hover {background-color: whitesmoke}

.dropdown:hover .dropdown-menu {
    display: block;
}

.dropdown:hover .dropdown-toggle {
    background-color: whitesmoke;
}
</style>
    </head>

    <nav class="topnavbar navbar-default topnav" style="margin-bottom: 15px; height: 91px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" href="index.jsp"><img src="http://www.chrisdenton.co.uk/img/header/logo.png" alt="logo" width="180px"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#" > Cars Category <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="addcategory.jsp">Add Category</a></li>
            <li><a href="ViewCategory.jsp">View Category</a></li>
          </ul>
        </li>
           <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Company<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="AddCompany.jsp">Add Company</a></li>
            <li><a href="ViewCompany.jsp">View Company</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Add & View Cars<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="NewCars.jsp">New Cars</a></li>
            <li><a href="ViewCars.jsp">View Cars</a></li>
          </ul>
        </li>
        <li><a href="ViewOrders.jsp">Orders</a></li>
      </ul>
        <% 
         
        if(request.getSession().getAttribute("user") == null)
            
        {
        %>
        <ul class="nav navbar-nav navbar-right" onload="log()">
        <li><a href="profile.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="Login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
      <% 
      }
    else
        {
      %>
      <ul class="nav navbar-nav navbar-right" onload="log()">
          <li><a href="updateprofile.jsp"> welcome ${name}</a></li>
        <li><a href="Logout"><span class="glyphicon glyphicon-log-in"></span> Log out</a></li>
      </ul>
        <% 
            }
        %>
    </div>
  </div>
</nav>
    
  
