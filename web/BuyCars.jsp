
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment </title>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        

    </head>
     <%
        try {
                if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("supplier") ){
                    response.sendRedirect("denied.jsp");
                }
            } catch (Exception e) {
                request.setAttribute("error", "<script>alert('LogIn! To Buy Cars');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="margin: auto; text-align: center; background-color: greenyellow; color: white;">Enter Your Bank Detail</h1>
        <br>
        <form action='carddetail?id=<%=request.getParameter("id")%>' method="post" style="margin: auto; width: 40%; text-align: center; ">
            <h3 style="text-align: left; margin: auto;">Bank Name:</h3>
            <br>
            <select name="bank" class="form-control" required>
                <option value="">--Bank Name--</option>
                <option>STATE BANK OF INDIA</option>
                <option>PUNJAB NATIONAL BANK</option>
                <option>AXIS BANK</option>
                <option>ICICI BANK</option>
                <option>HDFC BANK</option>
                <option>YES BANK</option>
                <option>KOTAK BANK</option>
                <option>CORPORATION BANK</option>
                <option>CITIBANK</option>
                <option>CANARA BANK</option>
            </select>
            <br>
            <h3 style="text-align: left; margin: auto;">Debit/Credit Card Number:</h3>
            <br>
            <input type="number" placeholder="Card Number(Credit/Debit Card)"  name="card" pattern="[0-9]*" title="Enter in Valid 16 digit card  Numbers Only , Only in 0-9 "  class="form-control" min="1000000000000000" onkeypress="if(this.value.length===16) {return false;}" required>
            <br>
            <div class="form-group row">
                <div class="col-xs-4">
                    <h3 style="text-align: left; margin: auto;">Expire Date:</h3>
            <br>
            <input type="month" placeholder="Expire Date" name="expire" min="2017-01" max="2030-12"  class="form-control" required>
                </div>
                <div class="col-xs-4">
                    <h3 style="text-align: left; margin: auto;">CVV No:</h3>
                    <br>
                    <input type="password" placeholder="CVV no" name="cvv" pattern="[0-9]*" title="Enter in Valid  CVV in Numbers Only , Only in 0-9 "  class="form-control" minlength="3" onkeypress="if(this.value.length===3) {return false;}" required>
                </div>
                </div>
            <br>
            <h3 style="text-align: left; margin: auto;">Card Holder Name:</h3>
            <br>
            <input type="text" placeholder="Card Holder Name" name="holder" pattern="[A-Za-z\s]+" class="form-control" required>
            <br>
            <button class="btn btn-primary">Submit</button>
        </form>
    </body>
</html>
