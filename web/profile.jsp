
<%@page import="company.Company"%>
<%@page import="java.util.List"%>
<%@page import="company.CompanyDaoImpl"%>
<%@page import="company.CompanyDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Sign Up</title>
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* Style all input fields */
input {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
}

/* Style the submit button */
input[type=submit] {
    background-color: #4CAF50;
    color: white;
}

/* Style the container for inputs */
.container {
    background-color: #f1f1f1;
    padding: 20px;
}

/* The message box is shown when the user clicks on the password field */
#message {
    display:none;
    background: #f1f1f1;
    color: #000;
    position: relative;
    padding: 20px;
    margin-top: 10px;
}

#message p {
    padding: 10px 35px;
    font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
    color: green;
}

.valid:before {
    position: relative;
    left: -35px;
    content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
    color: red;
}

.invalid:before {
    position: relative;
    left: -35px;
    content: "✖";
}
#suppDet{
        display: none;
    }
#compn{
        display: none;
    }
#compDet{
        display: none;
    }
</style>

<script>
function validateForm() {
    var x = document.forms["myForm"]["email"].value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
        alert("Not a valid e-mail address");
        return false;
    }
}
</script>
    </head>
    <%
    CompanyDao cdao=new CompanyDaoImpl();
    List<Company> c=cdao.getCompany();
    request.setAttribute("company", c);
    %>
    <body>
        <c:import url="header.jsp"></c:import>
        
        <h1 style="text-align: center;"><span class="bdots">&bullet;</span> R E G I S T E R &bullet;</h1>
        <form method="post" action="dosignup" name="myForm" style="margin:auto; width:40%; text-align: center;" onsubmit="return validateForm();" enctype="multipart/form-data">
            
            <h2 style="text-align: left;">Role:</h2>
            <select class="form-control" name="supe" id="role" onchange="supp()" required>
                <option value="">--Choose Role--</option>
                <option>Admin</option>
                <option>Supplier</option>
                <option>Buyer</option>
                
            </select>
              <div id="suppDet">
                  <h2 style="text-align: left; margin: auto;">Company Name:</h2>
                            <select class="form-control" id="cName" name="cName" onchange="comp()">
                                    <option selected="selected">Choose company...</option>
                                    <c:forEach items="${company}" var="c" >
                                        <option> ${c.getC_name()} </option> 
                                    </c:forEach>
                                    <option>Other</option>    
                            </select>
              </div>
            <div id="compDet">
                <h2 style="text-align: left;">Company Name:</h2>
                <input type="text" placeholder="Company Name" name="compn" >
                
                <h2 style="text-align: left;">Description</h2>
                <input type="text" placeholder="Company Name" name="desc">
                
                <h2 style="text-align: left;">Image:</h2>
                <input type="file" placeholder="Company Name" name="img" >
                
            </div>
                        <script>
                            function supp(){
                                if(document.getElementById("role").value === "Supplier") document.getElementById("suppDet").style.display="block";
                                else document.getElementById("suppDet").style.display="none";
                            }
                        </script>
                        <script>
                             function comp(){
                                 if(document.getElementById("cName").value === "Other") document.getElementById("compDet").style.display="block";
                                 else document.getElementById("compDet").style.display="none";
                             }       
                         </script>
                         
            <h2 style="text-align: left;">Full Name:</h2>
            <input type="text" placeholder="Full Name" name="name" pattern="[A-Za-z\s]+" title="Valid Name in Charaters only, A - Z , a-z" class="form-control" required>
          
            <h2 style="text-align: left;">Email:</h2>
            <input type="email" placeholder="Email" name="email"  class="form-control" title="Valid email,eg: admin@admin.com" required>
                
            <h2 style="text-align: left;">Password:</h2>
            <input type="password" placeholder="Password" name="password" class="form-control"  minlength="5" maxlength="16" title="Password must between 4 and 18" required>
            
            <h2 style="text-align: left;">Contact:</h2>
            <input type="number" placeholder="Contact" name="contact" class="form-control" pattern="[0-9]*" title="Enter Contact Number in valid Numbers 0-9" onkeypress="if(this.value.length===11) {return false;}" required>
                    <h2 style="text-align: left;">Address:</h2>
                    <textarea placeholder="Address" name="address" class="form-control" required></textarea>
                    <br>
                    <div class="form-group row">
                        <div class="col-xs-6">
                            <input type="submit" class="btn btn-success" value="Submit">
                        </div>
                        <div class="col-xs-6">
              <input type="reset" class="btn btn-primary" value="Reset">
                        </div>
                    </div>
            
            
        </form>
    </body>
</html>
