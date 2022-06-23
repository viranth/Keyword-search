<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap');
        body{
            font-family: 'Poppins', sans-serif;
            background-color: #774360;
        }
        .head{
            border-radius: 10px;
            text-align: center;
            padding: 10px 10px 10px 10px;
            background-color: #4C3A51;
        }
        section{
            
            margin-top: 10vh;
        } .container{
            background: #fff;
            border-radius: 10px;
            padding: 20px 20px 20px 20px;
            margin: auto;
            border: 3px solid green;
            padding: 10px;
        }
        a{
            text-decoration-style: none;
        }
    </style>
</head>
<body>
    <section>
        <div class="container">
            <h3 class="text-white head">Login Details</h3><hr>
            <div class="row">
                <div class="col">
                    <img src="login.png" class="img-fluid" alt="">
                </div>

                <%
                String host= "jdbc:mysql://localhost:3306/mydata";
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(host,"root","");
                stmt = con.createStatement(); 
                %>
                <div class="col-md-6 col-md-4">
                    <form class= "form-group"action="" method="post">
                        <div class="col-md-8">
                            <p><br><br><br></p>
                                <input type="text" class="form-control form-control-lg"name="uname" id="uname" placeholder="Enter the username">
                                <hr>
                                <input type="password" class="form-control form-control-lg"name="upass" id="upass" placeholder="Enter the password">
                            </div>
                            <div class=""><br><p class="me-3"></p>
                                <button class="btn btn-lg btn-primary me-5">login</button>
                                <a href="Signup.html" class="btn btn-lg btn-primary">signup</a>
                            </div>
                            <%
                                String uname = request.getParameter("uname");
                                String upass = request.getParameter("upass"); 
                                rs = stmt.executeQuery("select regNo,mail,phone,pass form login where regNo = '"+uname+"' or mail = '"+uname+"' or phone = '"+uname+"' and pass = '"+upass+"' ");
                                String Username = rs.getString("regNo");
                                String Usermail = rs.getString("mail");
                                String Usephone = rs.getString("phone");
                                String password = rs.getString("upass");

                                if(Usermail.equals(uname) || Username.equals(uname) || Usephone.equals(uname) && password.equals(upass)){
                                    response.sendRedirect("index");
                                }
                                %>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>

