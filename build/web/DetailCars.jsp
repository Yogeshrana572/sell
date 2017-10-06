
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="addcategory.AddCategory"%>
<%@page import="addcategory.AddCategoryDaoImpl"%>
<%@page import="addcategory.AddCategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Detail</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
     <% 
    AddCategoryDao acdao=new AddCategoryDaoImpl();
    AddCategory ac=acdao.getAddCategory(Integer.parseInt(request.getParameter("id")));
    
    List<AddCategory> list=acdao.getAddCategory();
    request.setAttribute("categori", list);
    %>
    <body>
        <h1 style="text-align: center; margin: auto;">Car Detail</h1>
        <table class="table table-striped" style="margin: auto; width: 80%;" ><%=ac.getId()%>
            <thead>
                <tr>
                    <th>Car Image</th>
                    <th>Car Name</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                    <tr>
                       <td style="height: 120px; width:20%; margin:auto;"><img src="<%=ac.getPhoto()%>" alt="image not uploaded..." height=150 width=200/></td>
                        <td><%=ac.getName()%></td>
                        <td><%=ac.getDescription()%></td>
                    </tr>
            </tbody>
        </table>
    </body>
</html>
