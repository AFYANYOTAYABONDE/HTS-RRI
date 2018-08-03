/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Scripts;

import database.dbConnweb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author EKaunda
 */
public class updateTestedTargets extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          dbConnweb conn= new dbConnweb();
          String facilityname="";
          //String datimfacility="";
          String allfacils="select Children,Adults,Total,MflCode from tested_targets  "; 
          conn.rs=conn.st.executeQuery(allfacils);
         while(conn.rs.next()){
            
            
          
            
                
            System.out.println("__MFL"+conn.rs.getString(4)+"  Tested Total : "+conn.rs.getString(1));
             
           // out.println("MFL "+conn.rs1.getString(1)+"  Facility Name : "+facilityname+"<br/>");
            //now update
            String updatecode="update targets set testing_target_child='"+conn.rs.getString(1)+"' ,testing_target_adult='"+conn.rs.getString(2)+"', testing_target_total='"+conn.rs.getString(3)+"' where id='"+conn.rs.getString(4)+"_2017' ";
                out.println(""+updatecode+"<br/>");
                
                
            conn.st2.executeUpdate(updatecode);
            
                                 
            
                              }
          
            out.println("</html>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(settingtargets.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(settingtargets.class.getName()).log(Level.SEVERE, null, ex);
        }
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
