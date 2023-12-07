<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./style.css">
    </head>
    <body>
    <center> <% out.print(session.getAttribute("nom").toString()); %> <% out.print("   <a href='modif.jsp'>[modifier]</a>"); %></center>
        <script> setTimeout(function() {location.reload();}, 2000); </script>
        
        <%
         int iduser = Integer.parseInt(session.getAttribute("id").toString());
         try{
          
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat?useSSL=false","root","admin");
            String sql = "select * from message order by date";
            Statement st = connection.createStatement();
            ResultSet result = st.executeQuery(sql);
            while(result.next()){
                if(result.getInt(2)==iduser){
                    
                    %>
    <div align="right">
        <div id="chat-wrapper">
        <div id="chat-bot-mood">
        <div id="chat-bot-mood-label">
            <span id="chat-bot-mood-text"><% out.print(result.getString(4)); %><% out.print("   <a href='supp.jsp?idmsg="+result.getString(1)+"'>[X]</a>"); %></span>
        </div>
        </div>
        </div>         
    </div>             
                    <%
                    
                }
                else{
                   
                String sql1 = "select * from users where id = "+result.getInt(2);
                Statement st1 = connection.createStatement();
                ResultSet result1 = st1.executeQuery(sql1);
                result1.next();
                
            %>
            <div id="chat-wrapper">
            <div id="chat-bot-mood">
                <div id="chat-bot-mood-icon"><img src="images/<% out.print(result1.getString(4));%>" width="30"></div>
            <div id="chat-bot-mood-label">
           <span id="chat-bot-mood-text"><% out.print(result1.getString(2)+" : "+result.getString(4)); %></span>
            </div>
            </div>
            </div>
            <%
        }}
         }
         catch(Exception e){
             System.out.println(e.toString());
         }
        
        
        %>




    </body>
</html>
