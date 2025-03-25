<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<% 
   
   String username=request.getParameter("username");
   String password=request.getParameter("password");
   
   try{
       Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/app","root","root");
       Statement st=con.createStatement();
       ResultSet rs=st.executeQuery("select * from register where username='"+username+"' and password='"+password+"'");
       
       if(rs.next()){
           session.setAttribute("username",username);
           %>
           <script>
               window.alert("Login Success")
               window.location="apphome.jsp";
           </script>
           <%
       }
       else{
           %>
           <script>
               window.alert("Invalid details")
               window.location="Login.html";
           </script>
           <%
           }
   }
   catch(Exception e){
       out.print(e);
   }
%>