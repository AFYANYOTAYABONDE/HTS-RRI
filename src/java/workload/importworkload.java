/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package workload;

import data.counsellordaily;
import database.dbConnweb;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import notification.sendmail;

/**
 *
 * @author Emmanuel E
 */
public class importworkload extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String insert="";
          String myresponse="";
        
        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        
         sendmail sm=new sendmail();
        
        PrintWriter out = response.getWriter();
        String txtresponse="Error occured during data export at the server."; 
        dbConnweb conn= new dbConnweb();
        
        




String id=null;
String facility=null;
String counselorname=null;

String date_tested=null;

 String opd_t = null;
 String screened = null;
 String screenrate = null;
 String opd_eligible = null;
 String opd_tested = null;
 String opd_positive = null;
 String opd_Yield = null;
 String pmtct_tested = null;
 String pmtct_positive = null;
 String pmtct_Yield = null;
 String index_tested = null;
 String index_positive = null;
 String index_yield = null;
 String self_test = null;
 String Referred_Prep = null;
 String gbv = null;
 String Total_Tested = null;
 String Total_Positive = null;
 String Total_Linked = null;
 String Total_Linkage = null;




String user=null;
String timestamp=null;
String datestartedart="";


        
        try {
        
       
    
        
id=request.getParameter("id");
facility=request.getParameter("facility");
counselorname=request.getParameter("counselorname");


date_tested=request.getParameter("date_tested");

opd_t=request.getParameter("opd_t");
screened=request.getParameter("screened");
screenrate=request.getParameter("screenrate");
opd_eligible=request.getParameter("opd_eligible");
opd_tested=request.getParameter("opd_tested");
opd_positive=request.getParameter("opd_positive");
opd_Yield=request.getParameter("opd_Yield");
pmtct_tested=request.getParameter("pmtct_tested");
pmtct_positive=request.getParameter("pmtct_positive");
pmtct_Yield=request.getParameter("pmtct_Yield");
index_tested=request.getParameter("index_tested");
index_positive=request.getParameter("index_positive");
index_yield=request.getParameter("index_yield");
self_test=request.getParameter("self_test");
Referred_Prep=request.getParameter("Referred_Prep");
gbv=request.getParameter("gbv");
Total_Tested=request.getParameter("Total_Tested");
Total_Positive=request.getParameter("Total_Positive");
Total_Linked=request.getParameter("Total_Linked");
Total_Linkage=request.getParameter("Total_Linkage");


user=request.getParameter("user");
timestamp=request.getParameter("timestamp");

String version="1.0.0";


 id=id;
 id=id.replace("18087","17799");

 

 String usermail=""; 
 if(user.contains("@") && (user.contains(".com") || user.contains(".org")  )){usermail=","+user;}
 
        
          
          //set maxconnection

System.out.println(" Workload Data upload by "+counselorname+" ");
           
           // conn.st.executeUpdate("SET GLOBAL max_allowed_packet = 209715200");
            conn.rs = conn.st.executeQuery("SHOW VARIABLES LIKE 'max_allowed_packet' ");
            if (conn.rs.next()) {
               // System.out.println("Max_allowed_connection_" + conn.rs.getString(2));

            }            
                  
           String checkexisting="select id from workload where id  like '"+id+"' "; 
           //String checkexisting="select id from weekly_data_new where id='"+id+"' "; 
           //users should maintain the same date range
            
            /* TODO output your page here. You may use following sample code. */
         
   conn.rs=conn.st.executeQuery(checkexisting);
   
   if(conn.rs.next()){
       //System.out.println(" Data for id "+id+" and counsellor "+counselorname+" already added ");
   
   //do update code here
   
   //tested	positive_tg	positive	treatment_tg	linked_here	linked_else	declined	dead	tca	viralload_tg	viralload
   //tested	positive_tg	positive	treatment_tg	linked_here	linked_else	declined	dead	tca	viralload_tg	viralload


   //,newart=?,newpos_pmtct=?,art_pmtct=?
     
          insert=" update workload set facility=? , counselorname=? , date_tested=? , opd_t=? , screened=? , screenrate=? , opd_eligible=? , opd_tested=? , opd_positive=? , opd_Yield=? , pmtct_tested=? , pmtct_positive=? , pmtct_Yield=? , index_tested=? , index_positive=? , index_yield=? , self_test=? , Referred_Prep=? , gbv=? , Total_Tested=? , Total_Positive=? , Total_Linked=? , 	Total_Linkage=? , timestamp=? , user=?   "
                 + " where id='"+id+"' and locked='0'  ";
                        conn.pst1=conn.conne.prepareStatement(insert);   
//facilityname.startdate.enddate.hiv_pos_target_child.hiv_pos_target_adult.hiv_pos_target_total.hiv_pos_child.hiv_pos_adult.hiv_pos_total.new_care_child.new_care_adult.new_care_total.new_art_target_child.new_art_target_adult.new_art_target_total.started_art_child.started_art_adult.started_art_total.viral_load_target_child.viral_load_target_adult.viral_load_target_total.viral_load_done_child.viral_load_done_adult.viral_load_done_total.ipt_target_child.ipt_target_adult.ipt_target_total.ipt_child.ipt_adult.ipt_total.testing_target_child.testing_target_adult.testing_target_total.test_child.test_adult.test_total.pmtct_hiv_pos_target.pmtct_hiv_pos.eid_target.eid_done.viral_load_mothers_target.viral_load_mothers_done.user.hiv_pos_yield_perc_child.hiv_pos_yield_perc_adult.hiv_pos_yield_perc_all.hiv_pos_care_perc_child.hiv_pos_care_perc_adult.hiv_pos_care_perc_all.started_art_perc_child.started_art_perc_adult.started_art_perc_all.viral_test_perc_child.viral_test_perc_adult.viral_test_perc_all.ipt_done_perc_child.ipt_done_perc_adult.ipt_done_perc_all.tested_perc_child.tested_perc_adult.tested_perc_all.hiv_pos_yield_cmts.hiv_pos_care_cmts.started_art_cmts.viral_test_cmts.ipt_done_cmts.tested_cmts.viral_load_mothers_perc.eid_done_perc.pmtct_hiv_pos_perc.viral_load_mothers_cmts.eid_done_cmts.pmtct_hiv_pos_cmts
                          
conn.pst1.setString(1,facility);
conn.pst1.setString(2,counselorname);
conn.pst1.setString(3,date_tested);
conn.pst1.setString(4,opd_t);
conn.pst1.setString(5,screened);
conn.pst1.setString(6,screenrate);
conn.pst1.setString(7,opd_eligible);
conn.pst1.setString(8,opd_tested);
conn.pst1.setString(9,opd_positive);
conn.pst1.setString(10,opd_Yield);
conn.pst1.setString(11,pmtct_tested);
conn.pst1.setString(12,pmtct_positive);
conn.pst1.setString(13,pmtct_Yield);
conn.pst1.setString(14,index_tested);
conn.pst1.setString(15,index_positive);
conn.pst1.setString(16,index_yield);
conn.pst1.setString(17,self_test);
conn.pst1.setString(18,Referred_Prep);
conn.pst1.setString(19,gbv);
conn.pst1.setString(20,Total_Tested);
conn.pst1.setString(21,Total_Positive);
conn.pst1.setString(22,Total_Linked);
conn.pst1.setString(23,Total_Linkage);
conn.pst1.setString(24,timestamp);
conn.pst1.setString(25,user);



                  
                        if(conn.pst1.executeUpdate()==1)
                        { 
                            if(!id.contains("annual")){ //notify user only when importing weekly summaries
                            txtresponse="<font color='green'> Data updated succesfully for date "+date_tested+"  </font> <a id='screenshotwp' onclick='loadwhatsappdata(\""+id+"\",\""+facility+"\")'  data-toggle='modal'  href='#whatsappform' class='btn btn-default' >Share results to <img src='images/wp.png' style='height:22px;'></a></button>";
                             //sm.Sendemail("RRI Sep. IMPORT","Hi ,  nThis is to notify you that data for "+facilityname+" has been updated succesfully by user "+user+" for dates "+startdate+" to "+enddate+". n nPlease  do not reply to this mail. It is system generated ", "Updated RRI Sep Data for  "+facilityname+" & dates "+startdate+" to "+enddate,"EKaunda@fhi360.org,MObuya@fhi360.org"+usermail);
                            
                            if(counselorname.equals("select counsellor")){
                                try {
                                    sm.Sendemail("Workload. VALIDATION FAILURE"," Hi, n This is to notify you that data for "+facility+"  for date "+date_tested+" Has no user name. n n Please Request the respective user to do the update and reexport data ", "Work Load data export for "+facility+" & date "+date_tested,"EKaunda@fhi360.org"+usermail);
                                } catch (MessagingException ex) {
                                    Logger.getLogger(importworkload.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            }
                            
                            }
                        }
                        else 
                        {
                              if(!id.contains("annual"))
                              {
                        txtresponse="<font color='red'>Data for <b>"+facility+"</b></font><font color='red'> NOT updated </font><font color='red'> for date  "+date_tested+". because the record was updated by a super admin.</font>";
                        
                              }
                        }
   
   
                     //myresponse=" update daily_raw set  facility='"+facility+"',counsellor='"+counselorname+"',register_no='"+register_no+"',serialno='"+serialno+"',date_tested='"+date_tested+"',age='"+age+"',gender='"+gender+"',modality='"+modality+"',testresult='"+testresult+"',linked='"+linked+"',cccno='"+cccno+"',linked_site='"+linked_site+"',other_facility_linked='"+other_facility_linked+"',reason_not_linked='"+reason_not_linked+"',reason_for_death='"+reason_for_death+"',other_reason_for_death='"+other_reason_for_death+"',reason_for_declining='"+reason_for_declining+"',other_reason_for_declining='"+other_reason_for_declining+"',user='"+user+"',timestamp='"+timestamp+"',datestartedart='"+datestartedart+"'"
                // + " where id='"+id+"' ";
                     // System.out.println(myresponse);
                        
   
   }
   else 
   {
    
      if(1==1) {
       
   //do insert code here
   
//      myresponse=" insert into workload "
//  + " ( id,facility,counsellor,register_no,serialno,date_tested,age,gender,modality,testresult,linked,cccno,linked_site,other_facility_linked,reason_not_linked,reason_for_death,other_reason_for_death,reason_for_declining,other_reason_for_declining,user,timestamp,datestartedart) "
//+ " values ('"+id+"','"+facility+"','"+counselorname+"','"+register_no+"','"+serialno+"','"+date_tested+"','"+age+"','"+gender+"','"+modality+"','"+testresult+"','"+linked+"','"+cccno+"','"+linked_site+"','"+other_facility_linked+"','"+reason_not_linked+"','"+reason_for_death+"','"+other_reason_for_death+"','"+reason_for_declining+"','"+other_reason_for_declining+"','"+user+"','"+timestamp+"','"+datestartedart+"')";
//     // System.out.println(myresponse);                   
            
         
       
          insert=" insert into workload(id,facility,counselorname,date_tested,opd_t,screened,screenrate,opd_eligible,opd_tested,opd_positive,opd_Yield,pmtct_tested,pmtct_positive,pmtct_Yield,index_tested,index_positive,index_yield,self_test,Referred_Prep,gbv,Total_Tested,Total_Positive,Total_Linked,Total_Linkage,timestamp,user) "
                 + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                      conn.pst1=conn.conne.prepareStatement(insert);    
                          
conn.pst1.setString(1,id);
conn.pst1.setString(2,facility);
conn.pst1.setString(3,counselorname);
conn.pst1.setString(4,date_tested);
conn.pst1.setString(5,opd_t);
conn.pst1.setString(6,screened);
conn.pst1.setString(7,screenrate);
conn.pst1.setString(8,opd_eligible);
conn.pst1.setString(9,opd_tested);
conn.pst1.setString(10,opd_positive);
conn.pst1.setString(11,opd_Yield);
conn.pst1.setString(12,pmtct_tested);
conn.pst1.setString(13,pmtct_positive);
conn.pst1.setString(14,pmtct_Yield);
conn.pst1.setString(15,index_tested);
conn.pst1.setString(16,index_positive);
conn.pst1.setString(17,index_yield);
conn.pst1.setString(18,self_test);
conn.pst1.setString(19,Referred_Prep);
conn.pst1.setString(20,gbv);
conn.pst1.setString(21,Total_Tested);
conn.pst1.setString(22,Total_Positive);
conn.pst1.setString(23,Total_Linked);
conn.pst1.setString(24,Total_Linkage);
conn.pst1.setString(25,timestamp);
conn.pst1.setString(26,user);

                        
                      
            
                     
                        
                        
                        if(conn.pst1.executeUpdate()==1){
                             if(!id.contains("annual")){
                            txtresponse="<font color='green'> Data added succesfully for date "+date_tested+"  </font> <a id='screenshotwp' onclick='loadwhatsappdata(\""+id+"\",\""+facility+"\")'  data-toggle='modal'  href='#whatsappform' class='btn btn-default' >Share Results to <img src='images/wp.png' style='height:22px;'> </a></button>";
                           
                            //check if counsellor name is select counsellor
                            
                            //add team leaders variable at this point 
                            if(counselorname.equals("select counsellor")){
                                try {
                                    sm.Sendemail("RRI Sep. VALIDATION FAILURE"," Hi, n This is to notify you that data for "+facility+"  for date "+date_tested+" and id "+id+" Has no user name. n n Please Request the respective user to do the update and reexport data ", "Workload data export for "+facility+" & date "+date_tested,"EKaunda@fhi360.org"+usermail);
                                } catch (MessagingException ex) 
                                {
                                    Logger.getLogger(importworkload.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            }
                             }                          } 
                        else {
                             if(!id.contains("annual")){
                          txtresponse="<font color='green'>Data for "+facility+" </font><font color='red'>  NOT inserted </font><font color='green'> succesfully for dates to "+date_tested+". This could be a duplicate error. </font>";
                             }
                             }
       
   }
   }
           
    if(id.contains("annual")){txtresponse="";}
    if(conn.rs!=null){conn.rs.close();}
         if(conn.st!=null){conn.st.close();}  
           
         if(conn.pst1!=null){conn.pst1.close();}  
         if(conn.conne!=null){conn.conne.close();}  
        
   
        } catch (SQLException ex) {
            Logger.getLogger(importworkload.class.getName()).log(Level.SEVERE, null, ex);
             txtresponse="<font color='red'>Data for "+facility+" NOT inserted succesfully for date "+date_tested+".  "+ex+" </font>";
        //send an email at this point of the exception
            
            try {
                sm.Sendemail("Facility Workload DATA IMPORT",ex.toString()+ "___ n Counsellor name: "+counselorname+" Facility name: n "+facility+" n "+myresponse, "MYSQL IMPORTING ERROR ","EKaunda@fhi360.org");
                } catch (MessagingException ex1) {
                Logger.getLogger(importworkload.class.getName()).log(Level.SEVERE, null, ex1);
            }
            
        }
        
       
      out.println(txtresponse);   
        
        
        
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
