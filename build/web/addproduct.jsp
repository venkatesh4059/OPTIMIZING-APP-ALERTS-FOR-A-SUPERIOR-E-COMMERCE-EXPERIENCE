<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.io.PrintWriter"%>

<%
    // Check if user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page
        return;
    }

    // Database Connection
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/app", "root", "root");

        // Handle Product Addition
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String category = request.getParameter("productcategory");
            String pname = request.getParameter("productname");
            String description = request.getParameter("productdes");
            String price = request.getParameter("productprice");

            pst = con.prepareStatement("INSERT INTO addproduct (username, productcategory, productname, productdes, productprice) VALUES (?, ?, ?, ?, ?)");
            pst.setString(1, username);
            pst.setString(2, category);
            pst.setString(3, pname);
            pst.setString(4, description);
            pst.setString(5, price);
            pst.executeUpdate();
            response.sendRedirect("AddProduct.jsp"); // Refresh to show new product
        }
    } catch (Exception e) {
        e.printStackTrace(); // Log error
    } finally {
        if (pst != null) pst.close();
        if (con != null) con.close();
    }
%>

<!DOCTYPE html>
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
            <a href="index.html">Home</a>
            <a href="AddProduct.jsp">Add Product</a>
            <a href="PushNotification.jsp">Push Notification</a>
            <a href="Logout.jsp">Logout</a>
        </div>
    </header>

    <section>
        <div class="content"> 
            <h3>Add a New Product</h3>
            <form method="post" action="AddProduct.jsp" enctype="multipart/form-data">
                <table border="1">
                    <tr>
                        <th>PRODUCT CATEGORY:</th>
                        <td>
                            <select name="productcategory" required>
                                <option value="mobile">Mobile</option>
                                <option value="laptop">Laptop</option>
                                <option value="televisions">Televisions</option>
                                <option value="others">Others</option>
                            </select>
                        </td>
                    </tr>
                   <tr><th>Product Name</th><td><input type="text" name="pname" required=""/></td></tr>
                      <tr><th>Product Description</th><td><textarea cols=20 rows=10 name="desc" required=""></textarea></td></tr>
                      <tr><th>Product Price</th><td><input type="number" name="price" required=""/></td></tr>
                        <tr><th>Product Image</th><td><input type="file" name="image" required=""/></td></tr>
                     <tr><th></th><td><input type="submit" value="Upload"/> <input type="reset" value="Reset"/></td></tr>
                </table>
            </form>

            <h3>My Products</h3>
            <table border="1">
                <tr>
                    <th>Product Category</th>
                    <th>Product Name</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Image</th>
                </tr>

                <%
                    try {
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/app", "root", "root");
                        pst = con.prepareStatement("SELECT * FROM addproduct WHERE username=?");
                        pst.setString(1, username);
                        rs = pst.executeQuery();

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("productcategory") %></td>
                    <td><%= rs.getString("productname") %></td>
                    <td><%= rs.getString("productdes") %></td>
                    <td>$<%= rs.getString("productprice") %></td>
                    <td><img src="view.jsp?id=<%= rs.getString("id") %>" width="100" height="100"></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                %>
                <tr><td colspan="5">Error fetching products.</td></tr>
                <%
                    } finally {
                        if (rs != null) rs.close();
                        if (pst != null) pst.close();
                        if (con != null) con.close();
                    }
                %>
            </table>
        </div>
    </section>
</body>
</html>
