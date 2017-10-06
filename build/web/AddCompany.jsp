
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Company</title>
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
        try {
                if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("Buyer") ){
                    response.sendRedirect("denied.jsp");
                }
            } catch (Exception e) {
                request.setAttribute("error", "<script>alert('LogIn! Admin & Seller Can Add Company');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="margin: auto; width: 80%; text-align: center;"><span class="bdots">&bullet;</span> Add Company &bullet;</h1>
        <br>
        <form action="addcompany" method="post" style="margin: auto; width: 80%; text-align: center;" enctype="multipart/form-data">
            <input type="text" placeholder="Company Name" name="comp" class="form-control" pattern="[A-Za-z0-9\s]+" required>
            <br>
            <textarea placeholder="Company Description" name="compdesc" class="form-control"></textarea>
            <br>
            <input type="file" name="img" onchange="readURL(this);" required>
            <br>
             <img id="blah" src="#" alt="Your image will deploy here" name="data" style="margin: auto; text-align: center; width: 30%;"/>
             <br>
            <button class="btn btn-primary">Add Company</button>
        </form>
    </body>
</html>
