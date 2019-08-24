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
public class savetestandstart extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
          String tesd="";  
          String artd="";  
          String cccno="";  
          String ti="";  
          String rf=""; 
          
//          tesd:sd,
//          artd:ed,
//          ti:ti,
//          rf:rf,
//          cccno:finalcccno
          
          if(request.getParameter("rf")!=null){rf= request.getParameter("rf");  }
          if(request.getParameter("ti")!=null){ti=request.getParameter("ti"); }
          if(request.getParameter("tesd")!=null){tesd=request.getParameter("tesd"); }
          if(request.getParameter("artd")!=null){artd=request.getParameter("artd"); }
          if(request.getParameter("cccno")!=null){cccno=request.getParameter("cccno"); }
          
          
            dbConnweb conn= new dbConnweb();
            
          String update=" replace into testandstart (cccno,hivtestdate,artstartdate,transferin,refferedfrom) values ('"+cccno+"','"+tesd+"','"+artd+"','"+ti+"','"+rf+"') "; 
            
          
          
            if(conn.st.executeUpdate(update)==1){
            out.println(" Data saved successfully");
            
            }
            
           if(conn.st!=null){
              conn.st.close();
                            }
          
             if(conn.conne!=null){
              conn.conne.close();
                                 }  
            
         
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(savetestandstart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(savetestandstart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
