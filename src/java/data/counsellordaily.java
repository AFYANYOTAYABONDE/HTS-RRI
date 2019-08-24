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
public class counsellordaily extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
            response.setHeader("Access-Control-Allow-Origin", "*");
        try {
            
            dbConnweb conn= new dbConnweb();
            
              // conn.st.executeUpdate("SET GLOBAL max_allowed_packet = 209715200"); 
               
           Calendar cal = Calendar.getInstance(); 
           int year=cal.get(Calendar.YEAR);
           int month=cal.get(Calendar.MONTH)+1;
           //if month is october, get targets for the next year
           if(month>=10){year=year+1;}
            int ordinalDay = cal.get(Calendar.DAY_OF_YEAR);
    int weekDay = cal.get(Calendar.DAY_OF_WEEK) - 1; // Sunday = 0
    int numberOfWeeks = (ordinalDay - weekDay + 10) / 7;
            JSONArray jarr=new JSONArray();
            //String getfacils="SELECT id,facility,year,hiv_pos_target_child,hiv_pos_target_adult,hiv_pos_target_total,new_art_target_child,new_art_target_adult,new_art_target_total,viral_load_target_child,viral_load_target_adult,viral_load_target_total,ipt_target_child,ipt_target_adult,ipt_target_total,testing_target_child,testing_target_adult,testing_target_total,pmtct_hiv_pos_target,eid_target,viral_load_mothers_target,timestamp FROM  targets where year ='"+year+"'order by id";
           
            //currently i am not validating targets that are being fetched 
            
            String getfacils="SELECT `County`,    `Sub-County`,    `Facility`,    `MflCode`,    `Counsellor Name`,    `Date of entry`,    `Positive target`,    `Total No. Tested`,    `Total No. positive`,   `No. linked to this facility`,    `No. linked to other facilities`,    `No. declined`,    `No. dead`, `To come later (TCA)`, `Counsellor Achievement`,`Positivity`, `Linkage`FROM `aphiaplus_moi`.`rpt_sum_modalities_daily`";
         
            String data="<table border='1'><tr><th>County</th><th>Sub-County</th><th>Facility</th><th>MflCode</th><th>Counsellor</th><th>Date of Entry</th><th>Positive Target</th><th>Total No. Tested</th><th>Total No. positive</th></tr>";
             
            
            conn.rs=conn.st.executeQuery(getfacils);
            while (conn.rs.next()){
                
                data+="<tr><td>"+conn.rs.getString("County")+"</td><td>"+conn.rs.getString("Sub-County")+"</td><td>"+conn.rs.getString("Facility")+"</td><td>"+conn.rs.getString("MflCode")+"</td><td>"+conn.rs.getString("Counsellor Name")+"</td><td>"+conn.rs.getString("Date of Entry")+"</td><td>"+conn.rs.getString("Positive Target")+"</td><td>"+conn.rs.getString("Total No. Tested")+"</td><td>"+conn.rs.getString("Total No. positive")+"</td></tr>";
                 JSONObject jobj= new JSONObject();
            jobj.put("County",conn.rs.getString("County"));
            jobj.put("Sub-County",conn.rs.getString("Sub-County"));
            jobj.put("Facility",conn.rs.getString("Facility"));
            jobj.put("Counsellor Name",conn.rs.getString("Counsellor Name"));
            jobj.put("Date of entry",conn.rs.getString("Date of entry"));
            jobj.put("Positive target",conn.rs.getString("Positive target"));
           jobj.put("Total No. Tested",conn.rs.getString("Total No. Tested"));
            jobj.put("Total No. positive",conn.rs.getString("Total No. positive"));
            jobj.put("No. linked to this facility",conn.rs.getString("No. linked to this facility"));
            jobj.put("No. linked to other facilities",conn.rs.getString("No. linked to other facilities"));
            jobj.put("No. declined",conn.rs.getString("No. declined"));
            jobj.put("No. dead",conn.rs.getString("No. dead"));
            jobj.put("To come later (TCA)",conn.rs.getString("To come later (TCA)"));
            jobj.put("Counsellor Achievement",conn.rs.getString("Counsellor Achievement"));
            jobj.put("Positivity",conn.rs.getString("Positivity"));
            jobj.put("Linkage",conn.rs.getString("Linkage"));


            jarr.put(jobj);
            
          
            }
            data+="</table>";
            
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
