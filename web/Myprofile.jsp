<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>OPTIMIZING APP ALERTS FOR A SUPERIOR</title>
        <link rel="icon" href="3.png"/>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="3.png" width="100" height="100"/>
                <h3>OPTIMIZING APP ALERTS FOR A SUPERIOR</h3>
            </div>
            <div class="links">
                <a href="apphome.jsp">Home</a>
                <a href="Myprofile.jsp">My Profile</a>
                <a href="Notification.jsp">Notification</a>
                <a href="Login.html">Logout</a>
            </div>
        </header>
        <section>
            <% String username=(String)session.getAttribute("username"); %>
            
            <div class="content"> 
                <h3> MY PROFILE </h3>
             
                <table border="1">
                    <%
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/app","root","root");
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("select * from register where username='"+username+"'");
        while(rs.next()){
            %>
            <tr>
                <th>NAME:</th>
                <td><%=rs.getString("name")%></td>
            </tr>
            <tr>
                <th>EMAIL:</th>
                <td><%=rs.getString("email")%></td>
            </tr>
            <tr>
                <th>Mobile:</th>
                <td><%=rs.getString("mobile")%></td>
            </tr>
            <tr>
                <th>GENDER:</th>
                <td><%=rs.getString("gender")%></td>
            </tr>
               
            <%
           }
   }
   catch(Exception e){
       out.print(e);
   }
%> </table>
                </div>
           <div class="topic">
            <div class="pair">
            <div class="content"> 
                <h1 style="text-align: center;color: white;">Welcome <%=username%>!</h1>
                </div> 
            <div class="images">
                <img src="1.png" width="600" height="500"/>
            </div>
            </div>
            <div class="pair">
            <div class="content">  
                <h4>Mobile Push Notification Campaign</h4>
                
                <p>As an app publisher, push notifications are here to help you scale your business and customer relationships to the next level. Understanding how to make the most of a push notification campaign will go a long way in bringing about your desired result. Below are some tips to help you in your campaign:</p>
            </div>
            <div class="images">
                <img src="11.png" width="600" height="500"/>
            </div>
            </div>
            </div>
        </section>
    </body>
</html>