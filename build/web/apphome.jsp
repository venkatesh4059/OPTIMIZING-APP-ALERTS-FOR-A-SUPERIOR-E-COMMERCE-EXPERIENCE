<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
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
    <div class="content_resize">
        <h3> PRODUCTS </h3>
      <div class="mainbar">
        <div class="article">
         </div>
        <div class="article">
          <h2><span></span></h2>
          
              
              
             <table>
                  <tr>
                      <th>E-Commerce</th>
                      
                      <th>Product Name</th>
                      
                       <th>Product Image</th>
                       <th>View Full Details</th>
                  </tr>
                  <%
                  try{
                    ResultSet r=Queries.getExecuteQuery("select * from products");
                    while(r.next()){
                        %>
                        <tr>
                            <td><%=r.getString("username")%></td>
                           
                            <td><%=r.getString("pname")%></td>
                           
                            <td><image src="view.jsp?id=<%=r.getString("id")%>" width="150" height="150"/></td>
                            <td><a href="FullDetails.jsp?pid=<%=r.getString("id")%>&e_username=<%=r.getString("username")%>">view details</a></td>
                        </tr>
                        
                        <%
                    }
                  }catch(Exception e){
                      out.println(e);
                  }
                  
                  %>
              </table>
              
              
              
              
              
     
          </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span></span> </h2>
          <div class="clr"></div>
              
        </div>
        <div class="gadget">
         
          <div class="clr"></div>
          
     
        </div>
      </div>
      <div class="clr"></div>
    </div>
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