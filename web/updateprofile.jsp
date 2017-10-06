
<%@page import="company.Company"%>
<%@page import="java.util.List"%>
<%@page import="company.CompanyDaoImpl"%>
<%@page import="company.CompanyDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="proprofile.Profile"%>
<%@page import="proprofile.ProfileDao"%>
<%@page import="proprofile.ProfileDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Update</title>
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    #suppDet{
        display: none;
    }
</style>
    </head>
    <% 
        System.out.println(request.getSession().getAttribute("user").toString());
    ProfileDao pdao=new ProfileDaoImpl();
    Profile p;
    try {
            p=pdao.getProfile(Integer.parseInt(request.getParameter("id")));
        } catch (Exception e) {
           e.printStackTrace();
           p=pdao.getProfile(request.getSession().getAttribute("user").toString());
        }
     CompanyDao cdao=new CompanyDaoImpl();
    List<Company> c=cdao.getCompany();
    request.setAttribute("company", c);
    %>
    <body>
    <c:import url="header.jsp"></c:import>
        
        <h1 style="text-align: center;">Update Profile</h1>
        <form method="post" action="doupdate?id=<%=p.getId()%>" style="margin:auto; width:70%; text-align: center;">
          
            <input type="text" value="<%=p.getId()%>" disabled class="form-control">
            
            <h2 style="text-align: left;">Role:</h2>
            <select class="form-control" name="supe" id="role" onchange="supp()">
                <option selected ><%=p.getRole()%></option>
                <option>Choose role...</option>
                <option>Admin</option>
                <option>Supplier</option>
                <option>Buyer</option>
            </select>
            <br>
              <div id="suppDet">
                  <h2 style="text-align: left; margin: auto;">Company Name:</h2>
                            <select class="form-control" id="cName" name="cName" onchange="comp()">
                                    <option selected="selected"></option>
                                    <c:forEach items="${company}" var="c" >
                                        <option> ${c.getC_name()} </option> 
                                    </c:forEach>
                           
                            </select>
                            <br>
                            
              </div>
                        <script>
                            function supp(){
                                if(document.getElementById("role").value === "Supplier") document.getElementById("suppDet").style.display="block";
                                else document.getElementById("suppDet").style.display="none";
                            }
                        </script>
                <br>
                 <h2 style="text-align: left;">Name:</h2>
            <input type="text"  value="<%=p.getName()%>" name="name" pattern="[A-Za-z\s]+" title="Valid Name in Charaters only, A - Z , a-z" class="form-control">
            <br>
             <h2 style="text-align: left;">Email:</h2>
             <input type="email" value="<%=p.getEmail()%>"  name="email" class="form-control">
            <br>
             <h2 style="text-align: left;">Password:</h2>
            <input type="password" value="<%=p.getPassword()%>" name="password" class="form-control" minlength="5" maxlength="16"  title="Password must between 4 and 18">
            <br>
             <h2 style="text-align: left;">Contact:</h2>
            <input type="number" value="<%=p.getContact()%>" name="contact" class="form-control" pattern="[0-9]*"  onkeypress="if(this.value.length===11) {return false;}">
            <br>
             <h2 style="text-align: left;">Address:</h2>
            <textarea name="address" class="form-control"><%=p.getAddress()%></textarea>
            <br>
            <button  class="btn btn-success">Update</button>
        </form>
    </body>
</html>
