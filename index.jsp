<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .container{
        background-color: #faf8f0;
        padding: 20px 20px 20px 20px;
        border-radius: 20px;
    }
</style>    
<p><br/></p>
    <body>
        <%
            String host= "jdbc:mysql://localhost:3306/mydata";
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(host,"root","");
            stmt = con.createStatement(); 
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <marquee behavior="" direction="">
                        <h3>Question List</h3>
                    </marquee>
                </div>
                <div class="col-md-3">
                    <form action="" method="get">
                        <input type="text" name="q" id="q" class="form-control" placeholder="Search Here..." >
                        
                    </form>
                </div>
                <div class="col-md-3">
                    <a href="addnew.jsp" class="btn btn-primary">Add New</a>
                </div>
            </div>
            <hr>
            <table class = "table table-bordered table-striped table-hover">
                <thead>
                     <tr>
                         <th>ID</th>
                         <th>branch</th>
                         <th>Regulation</th>
                         <th>month</th>
                         <th>Year</th>
                         <th>subject code</th>
                         <th>subject name</th>
                         <th>link</th>
                         <th class="text-center">View</th>
                         <th>Action</th>
                     </tr>
                </thead>
                <tbody>
                    <%
                         String query = request.getParameter("q");
                         String data;
                         if(query!=null){
                            data = "select *from questions where branch like'%"+query+"%' or regulation like'%"+query+"%' or month like'%"+query+"%' or year like'%"+query+"%' or subcode like'%"+query+"%' or subname like'%"+query+"%'";
                            %>
                            <a href="index.jsp" class="btn btn-primary">back</a>
                            <hr>
                            
                       <% }
                        else
                            data =  "select *from questions order by id desc";
                           rs = stmt.executeQuery(data);
                         while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getInt("id")%></td>
                        <!-- <td><%=rs.getString("deptid")%></td> -->
                        <td><%=rs.getString("branch")%></td>
                        <td><%=rs.getString("regulation")%></td>
                        <td><%=rs.getString("month")%></td>
                        <td><%=rs.getString("year")%></td>
                        <td><%=rs.getString("subcode")%></td>
                        <td><%=rs.getString("subname")%></td>
                        <td><a href='<%=rs.getString("link")%>' target="_blank" class="btn btn-primary">click</a></td>
                        <td><a href='view.jsp?u=<%=rs.getInt("id")%>' class="btn btn-primary">view</a></td>
                        <td class="text-center">
                            <a href='edit.jsp?u=<%=rs.getInt("id")%>' class="btn btn-warning">Edit</a>
                            <a href='delete.jsp?d=<%=rs.getInt("id")%>' class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <%
                     }
                    %>
                </tbody>
             </table>
        </div>
    </body>
   
</html>
