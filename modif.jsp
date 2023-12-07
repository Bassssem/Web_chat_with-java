<%-- 
    Document   : modif
    Created on : Nov 25, 2023, 9:16:01 AM
    Author     : fbass
--%>

<%@page import="java.sql.*"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <style>
            .text {
                border-radius: 30px;
                width: 90%;
                padding: 6px 2px;
                    }
            </style>
            <% 
            int iduser = Integer.parseInt(session.getAttribute("id").toString());
            
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat?useSSL=false","root","admin");
            String sql = "SELECT * FROM users where id = "+iduser;
            Statement st = connection.createStatement();
            ResultSet result = st.executeQuery(sql);
            result.next();
         
            %>
            <form name="f" action="setmodif.jsp" method="post">
                <center>
                    <br><br><br><br><br><br><br><br>
                    <h1> Modifier vos information : </h1>
		nom : <input  name="nom" type="text" value="<% out.print(result.getString(2));%>" >
                <br><br>
                password : <input  name="pass" type="text" value="<% out.print(result.getString(3));%>" >
                <br><br><br>
		<input type="submit" value="send">
                <center>
</form>
              <%   }
         catch(Exception e){
             System.out.println(e);
         }
            %>
    </body>
</html>