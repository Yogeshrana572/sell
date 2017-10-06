
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="addcategory.AddCategoryDaoImpl"%>
<%@page import="addcategory.AddCategoryDao"%>
<%@page import="addcategory.AddCategory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Category</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
    </head>
    <% 
    AddCategory ac=new AddCategory();
    AddCategoryDao acdao=new AddCategoryDaoImpl();
    
    List<AddCategory> list=acdao.getAddCategory();
    request.setAttribute("categori", list);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="margin: auto; text-align: center; font-weight: bold">View Category</h1>
        <table class="table table-striped" style="margin: auto;  width: 90%;  font-weight: bold">
            <thead style=" color:gray;">
                <tr>
                    <th style="margin:auto;">ID</th>
                        <th style="margin:auto;">Name</th>
                        <th style="margin:auto;">Description</th>
                        <th style="margin:auto;">Image</th>
                        <%
                    try {
                         if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin"))
                         {
                    %>
                        <th style="margin:auto;">DELETE</th>
                        <th style="margin:auto;">UPDATE</th>
                        <%   }
                        } catch (Exception e) {
                            request.setAttribute("error", "<script>alert('LogIn First');</script>");
                            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                        }
                    %>
                </tr>
            </thead>
                
                <tbody>
                    <c:forEach items="${categori}" var="x" >
                        <tr>
                            <td style="margin:auto;">${x.getId()}</td>
                            <td style="margin:auto;">${x.getName()}</td>
                            <td style="margin:auto; width: 10%;">${x.getDescription()}</td>
                            <td style="height: 120px; width:20%; margin:auto;"><img src="${x.getPhoto()}" alt="image not uploaded..." height=150 width=200/></td>
                      <%
                    try {
                         if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin"))
                         {
                    %>
                            <td style="margin:auto;"><a href="DeleteCategory?id=${x.getId()}" class="btn btn-danger">Delete</a></td>
                            <td style="margin:auto;"><a href="UpdateCategory.jsp?id=${x.getId()}" class="btn btn-primary">Update</a></td>
                            <%   }
                        } catch (Exception e) {
                            request.setAttribute("error", "<script>alert('LogIn First');</script>");
                            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                        }
                    %>
                        </tr>
                    </c:forEach>
                </tbody>
                
            </table>
    </body>
</html>
