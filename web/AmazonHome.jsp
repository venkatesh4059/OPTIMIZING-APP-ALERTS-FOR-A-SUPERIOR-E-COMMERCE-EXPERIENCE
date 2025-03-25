<%-- 
    Document   : Apps
    Created on : 4 Apr, 2021, 12:15:57 PM
    Author     : KishanVenky
--%>

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
          <div class="clr">
              
              
              <h2>Application Home page</h2>
            
              
              
              
              
              
          </div>
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
  
  <div class="footer">
    <div class="footer_resize">
      
      <div class="clr"></div>
    </div>
  </div>
</div>
</html>

