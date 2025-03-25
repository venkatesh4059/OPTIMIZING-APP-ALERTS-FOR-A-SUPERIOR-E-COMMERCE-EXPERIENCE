/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import com.database.Dbconnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author KishanVenky
 */
@MultipartConfig(maxFileSize=16*1024*1024)
public class Upload extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            HttpSession session=request.getSession();
            String  username=(String)session.getAttribute("username");
            String category=request.getParameter("category");
             String pname=request.getParameter("pname");
              String desc=request.getParameter("desc");
               String price=request.getParameter("price");
              Part p=request.getPart("image");
              
              InputStream in=p.getInputStream();
              
              Connection con=Dbconnection.getcon();
              PreparedStatement pst=con.prepareStatement("insert into products values(null,?,?,?,?,?,?)");
              pst.setString(1, username);
              pst.setString(2, category);
              pst.setString(3, pname);
              pst.setString(4, desc);
               pst.setString(5, price);
                pst.setBlob(6, in);
              
              int i=pst.executeUpdate();
              
              if(i>0){
                  response.sendRedirect("addproduct.jsp?msg=success");
              }else{
                  response.sendRedirect("addproduct.jsp?msg=failed");
              }
            
            
            
            
        }catch(Exception e){
        System.out.println(e);    
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
