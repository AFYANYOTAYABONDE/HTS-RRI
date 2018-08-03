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
public class settingtargets extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          dbConnweb conn= new dbConnweb();
          String facilityname="";
          //String datimfacility="";
          String allfacils="select * from tested_targets where MflCode is  null "; 
          conn.rs=conn.st.executeQuery(allfacils);
         while(conn.rs.next()){
            
            //get the mfl code from imis
            if(conn.rs.getString("Facility")!=null){
            facilityname=conn.rs.getString("Facility");
            }
            
          
            String getmfl="select mflcode from pwp.health_facility where hf_name like ? and mflcode is not null";
            
            
            //'%"+facilityname+"'
           // conn.rs1=conn.st1.executeQuery(getmfl);
              conn.pst1=conn.conne.prepareStatement(getmfl); 
              conn.pst1.setString(1, "%"+facilityname);
              conn.rs1=conn.pst1.executeQuery();
            while(conn.rs1.next()){
                
            System.out.println("__MFL"+conn.rs1.getString(1)+"  Facility Name : "+facilityname);
             
           // out.println("MFL "+conn.rs1.getString(1)+"  Facility Name : "+facilityname+"<br/>");
            //now update
            String updatecode="update tested_targets set MflCode='"+conn.rs1.getString(1)+"' where id='"+conn.rs.getString("id")+"' ";
                out.println(""+updatecode+"<br/>");
                
                
            conn.st2.executeUpdate(updatecode);
            
                                  }
            
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
