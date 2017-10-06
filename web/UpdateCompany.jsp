
<%@page import="company.Company"%>
<%@page import="company.CompanyDao"%>
<%@page import="company.CompanyDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Company</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        
<script>
            function readURL(input) {
                var path;
                var reader = new FileReader();
    		reader.onload = function (e) {
                    path=e.target.result;
                    $('#blah').attr('src', path);
		};
                reader.readAsDataURL(input.files[0]);
            }   
        </script>
    </head>
    <% 
    CompanyDao cdao=new CompanyDaoImpl();
    Company c=cdao.getCompany(Integer.parseInt(request.getParameter("id")));
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        
        <h1 style="margin: auto; width: 80%; text-align: center;">Update Company</h1>
        <form action="updatecompany?id=<%=c.getId()%>" method="post" style="margin: auto; width: 80%; text-align: center;" enctype="multipart/form-data">
            <input type="text"  name="id" class="form-control" value="<%=c.getId()%>" disabled>
            <br>
            <input type="text"  name="comp" class="form-control" value="<%=c.getC_name()%>">
            <br>
            <textarea name="compdesc" class="form-control"><%=c.getC_desc()%></textarea>
            <br>
            <input type="file" name="img" onchange="readURL(this);" value="<%=c.getC_img()%>">
            <br>
             <img id="blah" src="<%=c.getC_img()%>" alt="Your image will deploy here" name="data" style="margin: auto; text-align: center; width: 30%;"/>
             <br>
            <button class="btn btn-primary">Update Company</button>
        </form>
    </body>
</html>
