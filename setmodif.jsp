<%-- 
    Document   : setmodif
    Created on : Nov 25, 2023, 9:16:56 AM
    Author     : fbass
--%>

  <%@page import="java.sql.*"%>
<%  
         String nom = request.getParameter("nom");
         String pass = request.getParameter("pass");
         int iduser = Integer.parseInt(session.getAttribute("id").toString());
         try{
          
             Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat?useSSL=false","root","admin");
            String sql = "UPDATE users SET nom = '"+nom+"', password = '"+pass+"' WHERE id = "+iduser;
            Statement st = connection.createStatement();
            st.executeUpdate(sql);
            session.setAttribute("nom", nom);
            response.sendRedirect("1.jsp");
         }
         catch(Exception e){
             System.out.println(e);
         }
        
        
        %>
