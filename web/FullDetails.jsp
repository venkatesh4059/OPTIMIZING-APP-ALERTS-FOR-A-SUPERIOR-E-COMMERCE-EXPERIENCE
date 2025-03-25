<%-- 
    Document   : Apps
    Created on : 4 Apr, 2021, 12:15:57 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.Dbconnection"%>
<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>OPTIMIZING APP ALERTS FOR A SUPERIOR E-COMMERCE EXPERIENCE</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style>
    table tr th{
        text-align: center;
        border:0.5px solid lightgrey;
    }
    table tr td{
        text-align: center;
        border:0.5px solid lightgrey;
    }
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
          <%
              String  id=(String)session.getAttribute("id");
              String  email=(String)session.getAttribute("email");
              String  username=(String)session.getAttribute("username");
              String pid=request.getParameter("pid");
              String category=request.getParameter("e_username");
              
try{
    Connection con=Dbconnection.getcon();
    Statement s=con.createStatement();
    
    String qu="select count(*) from pcount where pid='"+pid+"'and uid='"+id+"' and category='"+category+"'";
    ResultSet r=Queries.getExecuteQuery(qu);
    int c=0;
    while(r.next()){
        c=r.getInt(1);
    }
    if(c!=0){
      ResultSet r1=Queries.getExecuteQuery("select * from pcount where pid='"+pid+"'and uid='"+id+"'and category='"+category+"'");
      while(r1.next()){
        int cc=Integer.parseInt(r1.getString("pcount"));
        int c2=cc+1;
    s.executeUpdate("update pcount set pcount='"+c2+"' where pid='"+pid+"'and uid='"+id+"' and category='"+category+"'");
      
      }
    }else{
     Queries.getExecuteUpdate("insert into pcount values(null,'"+pid+"','"+username+"','"+id+"','1','waiting','"+category+"')");
           
    }
    
}catch(Exception e){
   out.println(e); 
}



              %>
        <h3><a href="#"><%=email%></a></h3>
      </div>
      <div class="menu_nav">
        <ul>
          <li  class="active"><a href="UserHome.jsp">Home</a></li>
          <li><a href="Notification.jsp">Notification</a></li>
          <li><a href="ViewProfile.jsp">View Profile</a></li>
          <li><a href="Users.jsp">logout</a></li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="htext">
        <h2>OPTIMIZING APP ALERTS FOR A SUPERIOR E-COMMERCE EXPERIENCE</h2>
        
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
          
              
              
             <table>
                  <tr>
                      <th>E-Commerce</th>
                      <th>Product Category</th>
                      <th>Product Name</th>
                      <th>Product Description</th>
                      <th>Product Price</th>
                       <th>Product Image</th>
                       <th>Back</th>
                  </tr>
                  <%
                  try{
                    ResultSet r=Queries.getExecuteQuery("select * from products where id='"+pid+"'");
                    while(r.next()){
                        %>
                        <tr>
                            <td><%=r.getString("username")%></td>
                            <td><%=r.getString("category")%></td>
                           <td><%=r.getString("pname")%></td>
                            <td><%=r.getString("description")%></td>
                            <td><%=r.getString("price")%></td>
                            <td><image src="view.jsp?id=<%=r.getString("id")%>" width="150" height="150"/></td>
                            <td><a href="UserHome.jsp">Back</a></td>
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
  
  <div class="footer">
    <div class="footer_resize">
      
      <div class="clr"></div>
    </div>
  </div>
</div>
</html>

