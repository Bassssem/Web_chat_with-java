<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <% 
             
             String user = request.getParameter("user");
             String pass = request.getParameter("pass");
             String image = request.getParameter("image");
         try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat?useSSL=false","root","admin");
            String sql = "INSERT INTO users (id,nom, password, image) VALUES (null,'"+user+"', '"+pass+"', '"+image+"');";
            Statement st = connection.createStatement();
            st.executeUpdate(sql);
            response.sendRedirect("login.html");
         }
         catch(Exception e){
             System.out.println(e);
         }
         %>
    </body>
</html>
