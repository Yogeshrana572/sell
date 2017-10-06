
<%@page import="proprofile.ProfileDaoImpl"%>
<%@page import="proprofile.ProfileDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="proprofile.Profile"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="ordered.Ordered"%>
<%@page import="ordered.OrderedDaoImpl"%>
<%@page import="ordered.OrderedDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <% 
        OrderedDao odao=new OrderedDaoImpl();
        List<Ordered> list=new ArrayList<Ordered>();
        List<Ordered> list1=new ArrayList<Ordered>();
        
        
        Profile p=new Profile();
        
try{
    ProfileDao pdao=new ProfileDaoImpl();
    p=pdao.getProfile(request.getSession().getAttribute("user").toString());
    list=odao.getOrdered();
    
    if(!p.getRole().equals("Admin")){
        for (Ordered elem : list) {
                if(elem.getBuyer() == p.getId() || elem.getSeller() == p.getId()){
                    list1.add(elem);
                }
            }
        request.setAttribute("ordr", list1);
    }else
        request.setAttribute("ordr", list);
    
} catch(Exception e)
{
    
}

    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="text-align: center; margin: auto;"> Orders</h1>
        <table class="table table-striped" style="margin: auto; width: 50%;">
            <thead>
                <tr>
                    <th>Ordered id</th>
                    <th>Product id</th>
                    <th>Transaction id</th>
                    <th>Buyer</th>
                    <th>Seller</th>
                    <th>Status</th>

                     <%
                    try {
                         if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("buyer"))
                         {
                    %>
                    <th>Place</th>
                    <th>Delete</th>
                                <%   }
                                else{
                                %>
                        <th>Cancel</th>
                                  <%  }    
                        } catch (Exception e) {
                            request.setAttribute("error", "<script>alert('LogIn First');</script>");
                            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                            rd.forward(request, response);
                        }
                    %>

                </tr>
            </thead>
            <tbody>
            <c:forEach items="${ordr}" var="o">
                <tr>
                    <th>${o.getId()}</th>
                    <th>${o.getProduct()}</th>
                    <th>${o.getTransactions()}</th>
                    <th>${o.getBuyer()}</th>
                    <th>${o.getSeller()}</th>
                    <th>${o.getStatus()}</th>
                    <%
                    try {
                         if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("buyer"))
                         {
                    %>
                    <th><a href="placeorder?id=${o.getId()}" class="btn btn-danger">Place</a></th>
                    <th><a href="deleteorder?id=${o.getId()}" class="btn btn-danger">Delete</a></th>
                    
                              <%   }
                                else{
                                %>
                    <th><a href="cancelorder?id=${o.getId()}" class="btn btn-danger">Cancel</a></th>
                                <%  }    
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
