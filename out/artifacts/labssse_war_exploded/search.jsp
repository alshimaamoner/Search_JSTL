<%@ page import="java.sql.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<HTML>
    <BODY>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
            input[type=text], select {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type=submit] {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }

            div {
                border-radius: 5px;
                background-color: #f2f2f2;
                padding: 20px;
            }
        </style>
    <center>
        <h1>Search From</h1>
        <h3>Please Enter First Or Last Name Or Part Of Any</h3>
        <form action='DaoServlet'>
            <!--	<label for='fname'class='label'>First name:</label>-->
            <br>
            <input type='text' name='name' required /><br/><br />
            <input type=submit value=submit />
        </form>
        <h1>Result: </h1>
        <table border='1'>
            <tr>
                <td>First Name</td>
                <td>Last Name</td>
                <td>Username</td>
                <td>Password</td>
            </tr>
            <c:if test="${!empty requestScope.result}">
                <c:forEach items="${requestScope.result}" var="rs">
                    <tr>
                        <td>${rs.username}</td>
                        <td>${rs.password}</td>
                        <td>${rs.firstName}</td>
                        <td>${rs.lastName}</td>
                    </tr>
                </c:forEach>
            </c:if>
        </TABLE>
        <!--		
     
                        
                <label for='error'class='label'style='color: red'>No Such Name:</label>
                <br>

    
         
         <h1>Result: </h1>
         <table border='1'>
         <tr>
                         <td>First Name</td>
         <td>Last Name</td>
                         <td>Username</td>
                         <td>Password</td>
                         </tr>
       
             </tr>
     
   
        <label style='color: lightblue'>Please enter your key Word</label>
        -->
    </center>
</BODY>
</HTML>