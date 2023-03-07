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
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author EKaunda
 */
public class getrawdata extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
          
            
            
            String facilitymfl="15288";
            
            
            if(request.getParameter("mfl")!=null){
            
            facilitymfl=request.getParameter("mfl");
            
            }
            
            
            dbConnweb conn = new dbConnweb();
            
            
            String getdata=" select id, facility, counsellor, register_no, serialno, date_tested, age, gender, modality, testresult, linked, cccno, linked_site, other_facility_linked, reason_not_linked, reason_for_death, other_reason_for_death, reason_for_declining, other_reason_for_declining, timestamp, ( lastsynced + INTERVAL 3 HOUR) as lastsynced, ifnull(datestartedart,'') as datestartedart ,ifnull(positive_verified,'No') as positive_verified ,ifnull(linkage_verified,'No') as linkage_verified  ,ifnull(linkagedate,'') as linkagedate , ifnull(started_on_art,'') as started_on_art ,ifnull(reason_not_started_art,'') as reason_not_started_art ,other_reason_not_started_on_treatment,ifnull(started_tx_site,'') as started_tx_site,other_facility_started_art,reason_for_declining_art,other_reason_for_declining_art,reason_for_death_tx,other_reason_for_death_tx ,enrolled_hts_recent,offered_index_testing,elicited_contacts from aphiaplus_moi.daily_raw  where ( testresult='Positive' or testresult='Negative') and facility in ('"+facilitymfl+"')  ";
          //SUBSTR(`daily_raw`.`id`, 1, 5) in ('"+facilitymfl+"')
            
          
            System.out.println(""+getdata);
            conn.rs= conn.st.executeQuery(getdata);
            
            JSONArray  jarr= new JSONArray();
            
            
            while(conn.rs.next())
            {
            
            
            JSONObject jobj= new JSONObject();

jobj.put("id",conn.rs.getString("id"));
jobj.put("facility",conn.rs.getString("facility"));
jobj.put("counsellor",conn.rs.getString("counsellor"));
jobj.put("register_no",conn.rs.getString("register_no"));
jobj.put("serialno",conn.rs.getString("serialno"));
jobj.put("date_tested",conn.rs.getString("date_tested"));
jobj.put("age",conn.rs.getString("age"));
jobj.put("gender",conn.rs.getString("gender"));
jobj.put("modality",conn.rs.getString("modality"));
jobj.put("testresult",conn.rs.getString("testresult"));
jobj.put("linked",conn.rs.getString("linked"));
jobj.put("cccno",conn.rs.getString("cccno"));
jobj.put("linked_site",conn.rs.getString("linked_site"));
jobj.put("other_facility_linked",conn.rs.getString("other_facility_linked"));
jobj.put("reason_not_linked",conn.rs.getString("reason_not_linked"));
jobj.put("reason_for_death",conn.rs.getString("reason_for_death"));
jobj.put("other_reason_for_death",conn.rs.getString("other_reason_for_death"));
jobj.put("reason_for_declining",conn.rs.getString("reason_for_declining"));
jobj.put("other_reason_for_declining",conn.rs.getString("other_reason_for_declining"));
jobj.put("timestamp",conn.rs.getString("timestamp"));
jobj.put("lastsynced",conn.rs.getString("lastsynced"));
jobj.put("datestartedart",conn.rs.getString("datestartedart"));
jobj.put("positive_verified",conn.rs.getString("positive_verified"));
jobj.put("linkage_verified",conn.rs.getString("linkage_verified"));
jobj.put("linkagedate",conn.rs.getString("linkagedate"));
jobj.put("started_on_art",conn.rs.getString("started_on_art"));
jobj.put("reason_not_started_art",conn.rs.getString("reason_not_started_art"));
jobj.put("other_reason_not_started_on_treatment",conn.rs.getString("other_reason_not_started_on_treatment"));
jobj.put("started_tx_site",conn.rs.getString("started_tx_site"));
jobj.put("other_facility_started_art",conn.rs.getString("other_facility_started_art"));
jobj.put("reason_for_declining_art",conn.rs.getString("reason_for_declining_art"));
jobj.put("other_reason_for_declining_art",conn.rs.getString("other_reason_for_declining_art"));
jobj.put("reason_for_death_tx",conn.rs.getString("reason_for_death_tx"));
jobj.put("other_reason_for_death_tx",conn.rs.getString("other_reason_for_death_tx"));

//,,,

jobj.put("enrolled_hts_recent",conn.rs.getString("enrolled_hts_recent"));
jobj.put("offered_index_testing",conn.rs.getString("offered_index_testing"));
jobj.put("elicited_contacts",conn.rs.getString("elicited_contacts"));

            jarr.put(jobj);
                
                
            
            }
            
            
            out.println(jarr);
            
        
         if(conn.rs!=null){  conn.rs.close();  }
         if(conn.st!=null){ conn.st.close(); }
          if(conn.conne!=null){conn.conne.close(); }
         
        } catch (SQLException ex) {
            Logger.getLogger(getrawdata.class.getName()).log(Level.SEVERE, null, ex);
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
