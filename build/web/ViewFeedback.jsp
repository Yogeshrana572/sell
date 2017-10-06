
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="review.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="review.FeedbackDao"%>
<%@page import="review.FeedbackDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <%
        try {
                if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin")){
                    response.sendRedirect("denied.jsp");
                }
            } catch (Exception e) {                
                request.setAttribute("error", "<script>alert('LogIn First');</script>");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
    FeedbackDao fdao=new FeedbackDaoImpl();
    List<Feedback> list=fdao.getFeedback();
    request.setAttribute("feedbacks", list);
    %>
    <body>
        <h1 style="margin: auto; text-align: center;">View Feedback</h1>
        <table class="table table-striped" style="margin: auto; width:70%;">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Review</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${feedbacks}" var="x">
                <tr>
                    <td>${x.getName()}</td>
                    <td>${x.getEmail()}</td>
                    <td>${x.getFeeds()}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </body>
</html>
