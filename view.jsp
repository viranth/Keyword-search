<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


<head>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .container{
        background-color: #faf8f0;
        padding: 20px 20px 20px 20px;
        border-radius: 20px;
    }
    .row{
        margin-left: 500px;
    }
    </style>
</head>
<body>
    <p><br/></p>
    
    <div class="container">
        <div class="row">
            <div class="col-md-4">
               <marquee behavior="" direction=""><h3>Question Details</h3></marquee> 
            </div>
        </div>
                <%
                     String host= "jdbc:mysql://localhost:3306/mydata";
                     Connection con = null;
                     Statement stmt = null;
                     ResultSet rs = null;
                     Class.forName("com.mysql.jdbc.Driver");
                     con = DriverManager.getConnection(host,"root","");
                     stmt = con.createStatement(); 
                     String query = request.getParameter("u");
                     String data;
                     if(query!=null)
                        data = "select *from questions where id = '"+query+"'";
                    else
                        data =  "select *from questions order by id desc";
                     rs = stmt.executeQuery(data);
                     while(rs.next()){
                %>
                <div class="container">
                   <h4>Question paper Id           : <%=rs.getInt("id")%> <br></h4> 
                    <hr>
                    <h4>Branch of Question    : <%=rs.getString("branch")%><br><hr></h4> 
                    <h4> Regulation         : <%=rs.getString("regulation")%><br><hr></h4> 
                    <h4>Month : <%=rs.getString("month")%><br><hr></h4> 
                    <h4>   Year      : <%=rs.getString("year")%><br><hr></h4> 
                    <h4>  Subject Code      : <%=rs.getString("subcode")%><br><hr></h4> 
                    <h4> Subject Name      : <%=rs.getString("subname")%><br><hr></h4> 
                    <h4> Question Link      : <a href='<%=rs.getString("link")%>' target="_blank" class="btn btn-primary btna" ><%=rs.getString("link")%></a><br></h3> 
                </div>
                <a href="index.jsp" class="btn btn-primary btna" >Back</a>
                   
                    <!-- <td><a href='view.jsp?u=<%=rs.getInt("id")%>' class="btn btn-primary">view</a></td>
                    <td class="text-center">
                        <a href='edit.jsp?u=<%=rs.getInt("id")%>' class="btn btn-warning">Edit</a>
                        <a href='delete.jsp?d=<%=rs.getInt("id")%>' class="btn btn-danger">Delete</a>
                    </td>
                </tr> -->
                <%
                 }
                %>
    </div>
</body>
    
</html>