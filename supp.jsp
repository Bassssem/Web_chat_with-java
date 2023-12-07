<%-- 
    Document   : supp
    Created on : Nov 25, 2023, 8:56:52 AM
    Author     : fbass
--%>

       <%@page import="java.sql.*"%>
<%  
         String id = request.getParameter("idmsg");
         try{
          
             Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat?useSSL=false","root","admin");
            String sql = "DELETE FROM message where idmessage = "+id;
            Statement st = connection.createStatement();
            st.executeUpdate(sql);
            response.sendRedirect("1.jsp");
         }
         catch(Exception e){
             System.out.println(e);
         }
        
        
        %>
