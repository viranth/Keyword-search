<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String id = request.getParameter("d");
int num = Integer.parseInt(id);
    String host= "jdbc:mysql://localhost:3306/mydata";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection(host,"root","");
    Statement stat = con.createStatement();
    String data = "delete from questions where id ='"+num+"'";
    stat.executeUpdate(data); 
    response.sendRedirect("index.jsp");
%>