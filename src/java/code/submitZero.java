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

/**
 *
 * @author EKaunda
 */
public class submitZero extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
         String feedback="";
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
           
            dbConnweb conn = new dbConnweb();
           
            
           
            
            String tarehe="";
            String facil="";
            String mflcode="";
            
            
            if(request.getParameter("date")!=null){
            tarehe=request.getParameter("date");
            }
            
            if(request.getParameter("facil")!=null){
            facil=request.getParameter("facil");
            String[] mfl=facil.split("_");
            mflcode=mfl[0];
            }
            
            if(mflcode.equals("18087")){ mflcode="17799"; }
            
            
            String replace="replace into zero_reports  (id,zero_reports,date,mflcode) values ('"+mflcode+"_"+tarehe+"','0','"+tarehe+"','"+mflcode+"'); ";
           
            
            System.out.println(""+replace); 
            
            conn.st.executeUpdate(replace);
            
             feedback="<font color='green'><b>Zero report submitted successfully</b></font>";
            
             if(conn.st!=null){conn.st.close();}  
             if(conn.conne!=null){conn.conne.close();}  
            
        } catch (SQLException ex) 
        {
            Logger.getLogger(submitZero.class.getName()).log(Level.SEVERE, null, ex);
            feedback="Error will submitting zero report: <font color='red'>"+ex+"</font>";
          
        }
       out.println(feedback);   
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
