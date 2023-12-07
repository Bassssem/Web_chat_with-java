<%-- 
    Document   : send
    Created on : Nov 20, 2023, 10:16:01 AM
    Author     : fbass
--%>


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%  
         String msg = request.getParameter("text");
         int iduser = Integer.parseInt(session.getAttribute("id").toString());
         try{
          
             Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat?useSSL=false","root","admin");
            String sql = "INSERT INTO message VALUES (null,"+iduser+",now(),'"+msg+"')";
            Statement st = connection.createStatement();
            st.executeUpdate(sql);
            response.sendRedirect("2.html");
         }
         catch(Exception e){
             System.out.println(e);
         }
        
        
        %>
    </body>
</html>
