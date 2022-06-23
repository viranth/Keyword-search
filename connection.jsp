<%
String host= "jdbc:mysql://localhost:3306/mydata";
Connection con = null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(host,"root","");
%>