<%-- 
    Document   : Apps
    Created on : 4 Apr, 2021, 12:15:57 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
            <a href="AmazonHome.jsp">Home</a>
            <a href="A_UploadProducts.jsp">Add Product</a>
            <a href="A_PushNotification.jsp">Push Notification</a>
            <a href="applogin.jsp">Logout</a>
        </div>
    </header>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
          <%
           
              String  username=(String)session.getAttribute("username");
              
              %>
        <h3><a href="#">Welcome : <%=username%></a></h3>
      </div>
     
      
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
         </div>
        <div class="article">
          <h2><span></span></h2>
        
              
          <h2>View All Products <font color="red">which are clicked by users more than 3 times</font></h2>
              <table>
                  <tr>
                      <th>Product Category</th>
                      <th>Product Name</th>
                      <th>Product Price</th>
                      <th>Product Description</th>
                       <th>Product Image</th>
                  </tr>
                  <%
                  try{
                    ResultSet r=Queries.getExecuteQuery("select * from pcount c, products p where c.pcount>=3 and p.id=c.pid and c.category='"+username+"'");
                    while(r.next()){
                        %>
                        <tr>
                            <td><%=r.getString("p.category")%></td>
                            <td><%=r.getString("p.pname")%></td>
                            <td><%=r.getString("p.price")%></td>
                            <td><%=r.getString("p.description")%></td>
                            <td><image src="view.jsp?id=<%=r.getString("p.id")%>" width="100" height="100"/></td>
                            
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
              <h2>Select User & Push Notification</h2>
             
              <form action="F_PushNotification.jsp" method="post" >
                  <table>
                                  <tr><th>Product Category</th><td><select name="uid" required="">
                                              <option></option>
                                              <%try{
                                             ResultSet r=Queries.getExecuteQuery("select * from pcount where pcount>=3  and category='"+username+"'");
                                             while(r.next()){
                                                 session.setAttribute("pid",r.getString("pid"));
                                              %>
                                              <option value="<%=r.getString("uid")%>"><%=r.getString("username")%></option>
                                             <%}
}catch(Exception e){
out.println(e);
}%>
                                              
                                              
                              </select></td></tr>
                           <tr><th></th><td><input type="submit" value="Push"/> </td></tr>
                     
                  </table>
              </form>

<%String uid=request.getParameter("uid");
String pid=(String)session.getAttribute("pid");
if(uid!=null&&pid!=null){
  %>
  <form action="PushNotifyAction.jsp" method="post">
  <table>
      <tr><th>Product Id</th><td><input type="text" name="pid" value="<%=pid%>" readonly/></td></tr>
      <tr><th>User Id</th><td><input type="text" name="uid" value="<%=uid%>" readonly/></td></tr>
      <tr><th>Content</th><td><textarea cols="30" rows="5" name="content"></textarea></td></tr>
<tr><th></th><td><input type="submit" value="SUBMIT"/></td></tr>
  </table>
  </form>
<%  
}%>

        </div>
        <div class="gadget">
         
          <div class="clr"></div>
           
              
     
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  
  <div class="footer">
    <div class="footer_resize">
      
      <div class="clr"></div>
    </div>
  </div>
</div>
</html>

