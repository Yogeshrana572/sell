<%-- 
    Document   : ViewCompany
    Created on : Sep 15, 2017, 11:56:32 AM
    Author     : YOGESH RANA
--%>

<%@page import="supplier.SupplierDaoImpl"%>
<%@page import="supplier.SupplierDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="company.Company"%>
<%@page import="java.util.List"%>
<%@page import="company.CompanyDaoImpl"%>
<%@page import="company.CompanyDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Company</title>
                     
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <%
    CompanyDao cdao=new CompanyDaoImpl();
    List<Company> list=cdao.getCompany();
    request.setAttribute("compn", list);
    SupplierDao sdao=new SupplierDaoImpl();
    
request.setAttribute("sup", sdao);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        <h1 style="text-align: center;">View Company</h1>
        <table class="table table-striped" style="margin: auto; width: 80%;">
            <thead>
                <tr>
                    <th>Company name</th>
                    <th>Suppliers ID</th>
                    <th>Company Description</th>
                    <th>Logo</th>
                    <%
                    try {
                         if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin"))
                         {
                    %>
                    <th>Delete</th>
                    <th>Update</th>
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
            <c:forEach items="${compn}" var="x">
                <tr>
                    <td>${x.getC_name()}</td>
                    <td>
                        <select name="" class="form-control">
                            <c:forEach items="${sup.getSupplierC(x.getC_name())}" var="s">
                                <option>${s.getSupplier_id()}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>${x.getC_desc()}</td>
                    <td><img src="${x.getC_img()}" alt="image not uploaded..." height=150 width=200/></td>
                        <%
                    try {
                         if(request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin"))
                         {
                    %>
                    
                    <td style="margin:auto;"><a href="DeleteCompany?id=${x.getId()}" class="btn btn-danger">Delete</a></td>
                    <td style="margin:auto;"><a href="UpdateCompany.jsp?id=${x.getId()}" class="btn btn-success">Update</a></td>
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
