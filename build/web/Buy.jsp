
<%@page import="cars.Cars"%>
<%@page import="java.util.List"%>
<%@page import="cars.CarsDaoImpl"%>
<%@page import="cars.CarsDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        

    </head>
    <%
        CarsDao crdao=new CarsDaoImpl();
        List<Cars> list=crdao.getCar(Integer.parseInt(request.getParameter("id")));
        request.setAttribute("car", list);
     %>   
    <body>
        <c:import url="header.jsp"></c:import>
        <br>
        <div class="container">
        <c:forEach items="${car}" var="cr">
            <h1 style="margin: auto; text-align: center; color: gainsboro">${cr.getCr_comp()} Car Detail</h1>
            <br>
            <h2 style="margin:auto; color:gainsboro; text-align: center;">${cr.getCr_comp()} ${cr.getCr_name()}</h2>
            <br>
            <div class="row">
                <div class="col-md-6">

                    <img src="${cr.getCr_img()}" width="500px" height="400px" onclick="onClick(this)" alt="${cr.getCr_name()}">
<!--                    to VIew the car  -->
                    <div id="modal01" class="w3-modal w3-black" style="padding-top:0" onclick="this.style.display='none'">
                        <span class="w3-button w3-black w3-xxlarge w3-display-topright">×</span>
                        <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
                            <img id="img01" class="w3-image">
                        <p id="caption"></p>
                        </div>
                    </div>
                </div>
                      
                <div class="col-md-6">
                    <label class="middle" style="font-size: 30px; font-family:courier;">Model : </label>
                    <label class="badge" style="font-size: 20px; margin-left:210px;"> ${cr.getCr_model()}</label><br>
                    <label class="middle" style="font-size: 30px; font-family:courier;">Color : </label>
                    <label class="badge" style="font-size: 20px; margin-left: 210px;"> ${cr.getCr_color()}</label><br>
                    <label class="middle" style="font-size: 30px; font-family:courier;">Speed : </label>
                    <label class="badge" style="font-size: 20px; margin-left: 210px;"> ${cr.getCr_speed()}Km/h</label><br>
                    <label class="middle" style="font-size: 30px; font-family:courier;">Seat : </label>
                    <label class="badge" style="font-size: 20px; margin-left: 230px;"> ${cr.getCr_seat()}</label><br>
                    <label class="middle" style="font-size: 30px; font-family:courier;">Fuel : </label>
                    <label class="badge" style="font-size: 20px; margin-left: 227px;"> ${cr.getCr_fuel()}</label><br>
                    <label class="middle" style="font-size: 30px; font-family:courier;">Fuel CapaCity : </label>
                    <label class="badge" style="font-size: 20px; margin-left: 67px;"> ${cr.getCr_fuelcap()}L</label><br>
                    <label class="middle" style="font-size: 30px; font-family:courier;">Transmission : </label>
                    <label class="badge" style="font-size: 20px; margin-left: 83px;"> ${cr.getCr_transmission()}</label><br>
                    <label class="middle" style="font-size: 30px; font-family:courier;">Price : </label>
                    <label class="badge" style="font-size: 20px; margin-left: 210px;"><i class="fa fa-inr"> ${cr.getCr_price()}</i></label><br>
                    <label class="middle" style="font-size: 30px; font-family:courier;">Features : </label>
                    <label class="badge" style="font-size: 20px; margin-left: 160px;"> ${cr.getCr_features()}</label>
                </div>
            </div>
                    <div class="w3-padding-32 w3-red w3-circle w3-center" style="width: 30%; margin-left: 200px;">
                        <h1><a href="BuyCars.jsp?id=${cr.getId()}" style="color: white; text-decoration: none;">Buy Now</a></h1>
                    </div>
                    
<!--                    view the car script code-->
                    <script>
                        function onClick(element) {
                         document.getElementById("img01").src = element.src;
                         document.getElementById("modal01").style.display = "block";
                         var captionText = document.getElementById("caption");
                        captionText.innerHTML = element.alt;
                                    }
                        </script>
        </c:forEach>
                        
        </div>
        
    </body>
</html>
