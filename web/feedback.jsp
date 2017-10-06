
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
    <body style="background-color: gainsboro;">
        <h1 style="text-align: center; margin: auto;">Customers Feedback</h1>
        <form action="feedback" method="post" style="margin: auto; text-align: center; width: 80%;">
            <input type="text" placeholder="Name" name="feed" class="form-control" required>
            <br>
            <input type="email" placeholder="Email(optional)" class="form-control" name="feed">
            <br>
            <textarea name="feed" placeholder="Feedback" required class="form-control"></textarea>
            <br>
            <button class="btn-primary">Submit</button>
        </form>
    </body>
</html>
