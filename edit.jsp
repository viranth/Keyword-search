<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
    <%
    String host= "jdbc:mysql://localhost:3306/mydata";
    Connection con = null;
    PreparedStatement stmt = null;
    Statement stat = null;
    ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(host,"root","");
    %>
    <body>
        <p><br><br></p>
        <div class="con">
            <hr><br>
            <marquee behavior="" direction="left">
                <h2>Editing Questions</h2>
            </marquee>
            <hr>
        </div>
       <br>
        <div class="container">
            <form action="" method="post">
                <%
                stat = con.createStatement();
                String u = request.getParameter("u");
                int num = Integer.parseInt(u);
                String data = "select *from questions where id ='"+num+"'";
                rs = stat.executeQuery(data); 
                while(rs.next()){
                %>
                <input type="hidden" name="id" value='<%=rs.getString("id")%>'>
                <div class="form-group">
                    <label>Branch</label>
                    <input type = "text" name = "branch" class="form-control" placeholder="Enter tha name"  value='<%=rs.getString("branch")%>'required/>
                </div>
                <div class="form-group">
                    <label>Regulation</label>
                    <input type = "text" name = "reg" class="form-control" placeholder="Enter tha name"  value='<%=rs.getString("regulation")%>'required/>
                </div>
                <div class="form-group">
                    <label>Month</label>
                    <input type = "text" name = "month"  class="form-control" placeholder="Enter tha name"  value='<%=rs.getString("month")%>'required/>
                </div>
                <div class="form-group">
                    <label>Year</label>
                    <input type = "text" name = "year" class="form-control" placeholder="Enter tha name" value='<%=rs.getString("year")%>' required/>
                </div>
                <div class="form-group">
                    <label>Subject code</label>
                    <input type = "text" name = "sc" class="form-control" placeholder="Enter tha name"  value='<%=rs.getString("subcode")%>' required/>
                </div>
                <div class="form-group">
                    <label>Subject Name </label>
                    <input type = "text" name = "sl" class="form-control" placeholder="Enter tha name"  value='<%=rs.getString("subname")%>'required/>
                </div>
                <div class="form-group">
                    <label>Question paper link</label>
                    <input type = "text" name = "qpl" class="form-control" placeholder="Enter tha name" value='<%=rs.getString("link")%>' required/>
                </div>
                <%
                }
                %>
                <div class="btn-2">
                    <button type="submit" class="btn btn-primary">Update</button>
                <a href="index.jsp" class="btn btn-primary btna" >Back</a>
                </div>
            </form>
        </div>
    </body>
</html>
<%
String a = request.getParameter("id");
String b = request.getParameter("branch");
String c = request.getParameter("reg");
String d = request.getParameter("month");
String e = request.getParameter("year");
String f = request.getParameter("sc");
String g = request.getParameter("sl");
String h = request.getParameter("qpl");
if(a!=null && b!=null && c!=null && d!=null && e!=null){
    String query = "update questions set branch=?,regulation=?,month=?,year=?,subcode=?,subname= ?,link=? where id ='"+a+"' ";
    stmt  =con.prepareStatement(query);
    stmt.setString(1,b);
    stmt.setString(2,c);
    stmt.setString(3,d);
    stmt.setString(4,e);
    stmt.setString(5,f);
    stmt.setString(6,g);
    stmt.setString(7,h);
    stmt.executeUpdate();
    response.sendRedirect("index.jsp");
}
%>
%>