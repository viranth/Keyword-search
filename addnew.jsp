<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <style>
            .container{
                width: 600px;
        background-color: #faf8f0;
        padding: 20px 20px 20px 20px;
        border-radius: 20px;
        }
        .con{
            width: 800px;
            margin-left: 50vh;
            background-color: #faf8f0;
            border-radius: 20px;
            padding: 10px 10px 10px 10px;
        }
        hr{
            border: #000000 1px solid;
        }
        </style>
    </head>
    <body><p><br><br></p>
        <div class="con">
            <hr><br>
            <marquee behavior="" direction="left">
                <h2>Adding New Questions</h2>
            </marquee>
            <hr>
        </div>
       <br>
        <div class="container">
            <form action="" method="post">
                <div class="form-group">
                    <label>Branch</label>
                    <input type = "text" name = "branch" class="form-control" placeholder="Enter tha name" required/>
                </div><br>
                <div class="form-group">
                    <label>Regulation</label>
                    <input type = "text" name = "reg" class="form-control" placeholder="Enter tha name" required/>
                </div><br>
                <div class="form-group">
                    <label>Month</label>
                    <input type = "text" name = "month"  class="form-control" placeholder="Enter tha name" required/>
                </div><br>
                <div class="form-group">
                    <label>Year</label>
                    <input type = "text" name = "year" class="form-control" placeholder="Enter tha name" required/>
                </div><br>
                <div class="form-group">
                    <label>Subject code</label>
                    <input type = "text" name = "sc" class="form-control" placeholder="Enter tha name" required/>
                </div><br>
                <div class="form-group">
                    <label>Subject Link</label>
                    <input type = "text" name = "sl" class="form-control" placeholder="Enter tha name" required/>
                </div><br>
                <div class="form-group">
                    <label>Question paper link</label>
                    <input type = "text" name = "qpl" class="form-control" placeholder="Enter tha name" required/>
                </div><br>
                
                <div class="btn-2">
                    <button type="submit" class="btn btn-primary">Add new</button>
                <a href="index.jsp" class="btn btn-primary btna" >Back</a>
                </div>
            </form>
        </div>
    </body>
</html>

<%
    String a = request.getParameter("branch");
    String b = request.getParameter("reg");
    String c = request.getParameter("month");
    String d = request.getParameter("year");
    String e = request.getParameter("sc");
    String f = request.getParameter("sl");
    String g = request.getParameter("qpl");
    String host= "jdbc:mysql://localhost:3306/mydata";
    Connection con = null;
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    if(a!=null && b!=null && c!=null && d!=null){
        con = DriverManager.getConnection(host,"root","");
        stmt = con.prepareStatement("INSERT INTO questions (branch, regulation, month, year, subcode, subname, link) VALUES ( ?, ?, ?, ?, ?, ?, ?);");
        stmt.setString(1,a);
        stmt.setString(2,b);
        stmt.setString(3,c);
        stmt.setString(4,d);
        stmt.setString(5,e);
        stmt.setString(6,f);
        stmt.setString(7,g);
        stmt.executeUpdate();
        response.sendRedirect("index.jsp");
    }
%>