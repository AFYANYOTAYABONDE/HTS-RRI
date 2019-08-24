/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package code;

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
import javax.servlet.http.HttpSession;

/**
 *
 * @author EKaunda
 */
public class deletedata extends HttpServlet {

    HttpSession session;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          
            session=request.getSession();
            
            
           
            
            dbConnweb conn = new dbConnweb();
            
            String id="";
            String user="system";
            
             if(session.getAttribute("user")!=null){
                 
            user=session.getAttribute("user").toString();
            
            }
            
            if(request.getParameter("id")!=null)
            {
            
            id=request.getParameter("id");
            
            }
            
            String insert=" replace into aphiaplus_moi.deleted_daily_raw select id, facility, counsellor, register_no, serialno, date_tested, age, gender, modality, testresult, linked, cccno, linked_site, other_facility_linked, reason_not_linked, reason_for_death, other_reason_for_death, reason_for_declining, other_reason_for_declining, user, timestamp, lastsynced, datestartedart, positive_verified,linkage_verified,locked, '"+user+"' as deletedby  from aphiaplus_moi.daily_raw where id='"+id+"'; ";
            
            conn.st.executeUpdate(insert);
            
            conn.st.executeUpdate("call aphiaplus_moi.delete_record('"+id+"');");
            
           // id, action, user, timestamp
                    
            conn.st.executeUpdate(" insert into audit(action, user) values('Deleted user whose id is "+id+"','"+user+"')");  
                    
               if(conn.rs!=null){conn.rs.close();}
              if(conn.st!=null){conn.st.close();}
              if(conn.conne!=null){conn.conne.close();}
            
        } catch (SQLException ex) {
            Logger.getLogger(deletedata.class.getName()).log(Level.SEVERE, null, ex);
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
