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
         try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat?useSSL=false","root","admin");
            String sql = "SELECT * FROM users where nom = '"+user+"' and password = '"+pass+"' ;";
            Statement st = connection.createStatement();
            ResultSet result = st.executeQuery(sql);
            if(result.next()){
                session.setAttribute("id", result.getInt(1));
                session.setAttribute("nom", result.getString(2));
                response.sendRedirect("index.html");
                
            }
            response.sendRedirect("login.html");
         }
         catch(Exception e){
             System.out.println(e);
         }
         %>
    </body>
</html>
