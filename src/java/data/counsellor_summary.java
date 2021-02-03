/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import database.dbConnweb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Emmanuel E
 */
public class counsellor_summary extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
            response.setHeader("Access-Control-Allow-Origin", "*");
        try {
            
            
            String counsellorname="";
            
            String cnswhere="where `HTS Counsellor` in (";
            
            if(request.getParameter("cns")!=null){
            
            String[] cnsarr=request.getParameter("cns").split(",");
            
            for(int a=0;a<cnsarr.length;a++)
            {
                if(a!=cnsarr.length-1){
            cnswhere+="'"+cnsarr[a]+"',";
                }
                else{
                cnswhere+="'"+cnsarr[a]+"')";
                }
            }
            
            }
            
            if(cnswhere.equals("where counsellor in ("))
            {cnswhere="";}
            
            
            dbConnweb conn= new dbConnweb();
           
          
            JSONArray jarr=new JSONArray();
           
          
            
            String getfacils="SELECT `HTS Counsellor`,  `County`,  `District`,    `Facility`,     `Date`,`Tested`,  `Positive`,`Linked` FROM `aphiaplus_moi`.`counsellors_summary_vw` "+cnswhere;
         
              System.out.println(""+getfacils);
            
            conn.rs=conn.st.executeQuery(getfacils);
            while (conn.rs.next()){
                
             JSONObject jobj= new JSONObject();
             
            jobj.put("County",conn.rs.getString("County"));
            jobj.put("Sub-County",conn.rs.getString("District"));
            jobj.put("Facility",conn.rs.getString("Facility"));
            jobj.put("Counsellor",conn.rs.getString("HTS Counsellor"));
            jobj.put("Date",conn.rs.getString("Date"));           
            jobj.put("Tested",conn.rs.getString("Tested"));
            jobj.put("Positive",conn.rs.getString("Positive"));
            jobj.put("linked",conn.rs.getString("Linked"));
          

            jarr.put(jobj);
            
          
            }
           
            
              if(conn.rs!=null){conn.rs.close();}
              if(conn.st!=null){conn.st.close();}
              if(conn.conne!=null){conn.conne.close();}
            
            
          //System.out.println(""+data); 
            
            try (PrintWriter out = response.getWriter()) {
                
                
                out.println(jarr);
            }
        }   catch (SQLException ex) {
            Logger.getLogger(counsellordaily.class.getName()).log(Level.SEVERE, null, ex);
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

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
