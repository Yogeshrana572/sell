
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="proprofile.Profile"%>
<%@page import="java.util.List"%>
<%@page import="proprofile.ProfileDao"%>
<%@page import="proprofile.ProfileDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    
    <% 
        List<Profile> list=new ArrayList<Profile>();
        try {
                if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("Admin")){
                    
                ProfileDao pdao=new ProfileDaoImpl();
                list=pdao.getProfile();
                request.setAttribute("product", list);
                }
                else{
                    response.sendRedirect("denied.jsp");
                }
            } catch (Exception e) {
                request.setAttribute("error", "<script>alert('LogIn First');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="text-align: center;">View Profile</h1>
        <table class="table table-striped" style="margin: auto; width: 80%;">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Role</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            
            <tbody>
                <c:forEach items="${product}" var="x">
                <tr>
                    <td>${x.getId()}</td>
                    <td>${x.getRole()}</td>
                    <td>${x.getName()}</td>
                    <td>${x.getEmail()}</td>
                    <td>${x.getContact()}</td>
                    <td>${x.getAddress()}</td>
                    <td><a href="deletefromdb?id=${x.getId()}" class="btn btn-danger">Delete</a></td>
                    <td><a href="updateprofile.jsp?id=${x.getId()}" class="btn btn-success">Update</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
