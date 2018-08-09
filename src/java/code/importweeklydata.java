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
public class importweeklydata extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          String insert="";
          String myresponse="";
String user=null;        
        response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        
         sendmail sm=new sendmail();
        
        PrintWriter out = response.getWriter();
        String txtresponse="Error occured during data export at the server."; 
        dbConnweb conn= new dbConnweb();
        
         String facilityname=null;
        //String startdate=null;
        String enddate=null;
        
        String modality="";
        String counsellor="";
        
        try {
        
        String id="";      
       
        

String tested=null;
String positive_tg=null;
String positive=null;
//String treatment_tg=null;
String linked_here=null;
String linked_else=null;
String declined=null;
String dead=null;
String tca=null;
//String viralload_tg=null;
//String viralload=null;
//String newart=null;
//String newpos_pmtct=null;
//String art_pmtct=null;
//String viralload_mothers=null;




        
          
       
        
         id=request.getParameter("id");      
         facilityname=request.getParameter("facilityname");
         //startdate=request.getParameter("startdate");
         enddate=request.getParameter("enddate");
         counsellor=request.getParameter("counselor");
         modality=request.getParameter("modality");
         
tested=request.getParameter("tested");
positive_tg=request.getParameter("positive_tg");
positive=request.getParameter("positive");
//treatment_tg=request.getParameter("treatment_tg");
linked_here=request.getParameter("linked_here");
linked_else=request.getParameter("linked_else");
declined=request.getParameter("declined");
dead=request.getParameter("dead");
tca=request.getParameter("tca");
//viralload_tg=request.getParameter("viralload_tg");
//viralload=request.getParameter("viralload");

//newart=request.getParameter("newart");
//newpos_pmtct=request.getParameter("newpos_pmtct");
//art_pmtct=request.getParameter("art_pmtct");
//viralload_mothers=request.getParameter("viralload_mothers");
  



 user=request.getParameter("user");
 String usermail=""; 
 if(user.contains("@") && (user.contains(".com") || user.contains(".org")  )){usermail=","+user;}
 
         
          
          //set maxconnection


           
            conn.st.executeUpdate("SET GLOBAL max_allowed_packet = 209715200");
            conn.rs = conn.st.executeQuery("SHOW VARIABLES LIKE 'max_allowed_packet' ");
            if (conn.rs.next()) {
                System.out.println("Max_allowed_connection_" + conn.rs.getString(2));

            }            
                  
           String checkexisting="select id from dailydata where id  like '"+id+"' and user='"+user+"'"; 
           //String checkexisting="select id from weekly_data_new where id='"+id+"' "; 
           //users should maintain the same date range
            
            /* TODO output your page here. You may use following sample code. */
         
   conn.rs=conn.st.executeQuery(checkexisting);
   
   if(conn.rs.next()){
       System.out.println(" Data for "+facilityname+" already added ");
   
   //do update code here
   
   //tested	positive_tg	positive	treatment_tg	linked_here	linked_else	declined	dead	tca	viralload_tg	viralload
   //tested	positive_tg	positive	treatment_tg	linked_here	linked_else	declined	dead	tca	viralload_tg	viralload


   //,newart=?,newpos_pmtct=?,art_pmtct=?
     
          insert=" update dailydata set facilityname=?, enddate=?,modality=?,counsellor=?,tested=?,positive_tg=?,positive=?,linked_here=?,linked_else=?,declined=?,dead=?,tca=?"
                 + " where id='"+id+"' ";
                        conn.pst1=conn.conne.prepareStatement(insert);   
//facilityname.startdate.enddate.hiv_pos_target_child.hiv_pos_target_adult.hiv_pos_target_total.hiv_pos_child.hiv_pos_adult.hiv_pos_total.new_care_child.new_care_adult.new_care_total.new_art_target_child.new_art_target_adult.new_art_target_total.started_art_child.started_art_adult.started_art_total.viral_load_target_child.viral_load_target_adult.viral_load_target_total.viral_load_done_child.viral_load_done_adult.viral_load_done_total.ipt_target_child.ipt_target_adult.ipt_target_total.ipt_child.ipt_adult.ipt_total.testing_target_child.testing_target_adult.testing_target_total.test_child.test_adult.test_total.pmtct_hiv_pos_target.pmtct_hiv_pos.eid_target.eid_done.viral_load_mothers_target.viral_load_mothers_done.user.hiv_pos_yield_perc_child.hiv_pos_yield_perc_adult.hiv_pos_yield_perc_all.hiv_pos_care_perc_child.hiv_pos_care_perc_adult.hiv_pos_care_perc_all.started_art_perc_child.started_art_perc_adult.started_art_perc_all.viral_test_perc_child.viral_test_perc_adult.viral_test_perc_all.ipt_done_perc_child.ipt_done_perc_adult.ipt_done_perc_all.tested_perc_child.tested_perc_adult.tested_perc_all.hiv_pos_yield_cmts.hiv_pos_care_cmts.started_art_cmts.viral_test_cmts.ipt_done_cmts.tested_cmts.viral_load_mothers_perc.eid_done_perc.pmtct_hiv_pos_perc.viral_load_mothers_cmts.eid_done_cmts.pmtct_hiv_pos_cmts
                          
                        conn.pst1.setString(1,facilityname);
                        conn.pst1.setString(2,enddate);
                        conn.pst1.setString(3,modality);                        
                        conn.pst1.setString(4,counsellor);                        
                        conn.pst1.setString(5,tested);
                        conn.pst1.setString(6,positive_tg);
                        conn.pst1.setString(7,positive);
                        conn.pst1.setString(8,linked_here);
                        conn.pst1.setString(9,linked_else);
                        conn.pst1.setString(10,declined);
                        conn.pst1.setString(11,dead);
                        conn.pst1.setString(12,tca);
                      
                   
                          
                        
                        if(conn.pst1.executeUpdate()==1)
                        { 
                            if(!id.contains("annual")){ //notify user only when importing weekly summaries
                            txtresponse="<font color='green'> Data for <b> "+facilityname+" </b> updated succesfully for date "+enddate+" </font>";
                             //sm.Sendemail("RRI Sep. IMPORT","Hi ,  \nThis is to notify you that data for "+facilityname+" has been updated succesfully by user "+user+" for dates "+startdate+" to "+enddate+". \n \nPlease  do not reply to this mail. It is system generated ", "Updated RRI Sep Data for  "+facilityname+" & dates "+startdate+" to "+enddate,"EKaunda@fhi360.org,MObuya@fhi360.org"+usermail);
                            
                            if(counsellor.equals("select counsellor")){
                                try {
                                    sm.Sendemail("RRI Sep. VALIDATION FAILURE"," Hi, \n This is to notify you that data for "+facilityname+"  for date "+enddate+" Has no Counsellor name. \n \n Please Request the respective counsellor to do the update and reexport data ", "RRI Sep. data export for "+facilityname+" & date "+enddate,"EKaunda@fhi360.org"+usermail);
                                } catch (MessagingException ex) {
                                    Logger.getLogger(importweeklydata.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            }
                            
                            }
                        }
                        else 
                        {
                              if(!id.contains("annual")){
                        txtresponse="<font color='green'>Data for <b>"+facilityname+"</b></font><font color='red'> NOT updated </font><font color='green'> for date  "+enddate+". This is because data for a similar date already exists. </font>";
                        
                              }
                        }
   
   
                     myresponse= " update dailydata set facilityname='"+facilityname+"', enddate='"+enddate+"', counsellor='"+counsellor+"' ,modality='"+modality+"',tested='"+tested+"',positive_tg='"+positive_tg+"',positive='"+positive+"',linked_here='"+linked_here+"',linked_else='"+linked_else+"',declined='"+declined+"',dead='"+dead+"',tca='"+tca+"'"
                 + " where id='"+id+"' ";
                      System.out.println(myresponse);
                        
   
   }
   else 
   {
   //do insert code here
   
      myresponse="insert into dailydata"
  + "( id,facilityname,enddate,counsellor,modality,tested,positive_tg,positive,linked_here,linked_else,declined,dead,tca, user  ) "
+ " values ('"+id+"','"+facilityname+"','"+enddate+"','"+counsellor+"','"+modality+"','"+tested+"','"+positive_tg+"','"+positive+"','"+linked_here+"','"+linked_else+"','"+declined+"','"+dead+"','"+tca+"','"+user+"')";
      System.out.println(myresponse);                   
            
         
       
          insert="insert into dailydata(id,facilityname,enddate,counsellor,modality,tested,positive_tg,positive,linked_here,linked_else,declined,dead,tca, user) "
                 + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                      conn.pst1=conn.conne.prepareStatement(insert);    
                          
                 conn.pst1.setString(1,id);
                        conn.pst1.setString(2,facilityname);
                        conn.pst1.setString(3,enddate);
                        conn.pst1.setString(4,counsellor);
                        conn.pst1.setString(5,modality);
                        conn.pst1.setString(6,tested);
                        conn.pst1.setString(7,positive_tg);
                        conn.pst1.setString(8,positive);
                        conn.pst1.setString(9,linked_here);
                        conn.pst1.setString(10,linked_else);
                        conn.pst1.setString(11,declined);
                        conn.pst1.setString(12,dead);
                        conn.pst1.setString(13,tca);
                        conn.pst1.setString(14,user);                        
                      
            
                     
                        
                        
                        if(conn.pst1.executeUpdate()==1){
                             if(!id.contains("annual")){
                            txtresponse="<font color='green'> Data for "+facilityname+" added succesfully for date "+enddate+"  </font>";
                           
                            //check if counsellor name is select counsellor
                            
                            //add team leaders variable at this point 
                            if(counsellor.equals("select counsellor")){
                                try {
                                    sm.Sendemail("RRI Sep. VALIDATION FAILURE"," Hi, \n This is to notify you that data for "+facilityname+"  for date "+enddate+" Has no Counsellor name. \n \n Please Request the respective counsellor to do the update and reexport data ", "RRI Sep. data export for "+facilityname+" & date "+enddate,"EKaunda@fhi360.org"+usermail);
                                } catch (MessagingException ex) {
                                    Logger.getLogger(importweeklydata.class.getName()).log(Level.SEVERE, null, ex);
                                }
                            }
                             }                          } 
                        else {
                             if(!id.contains("annual")){
                          txtresponse="<font color='green'>Data for "+facilityname+" </font><font color='red'>  NOT inserted </font><font color='green'> succesfully for dates to "+enddate+". This could be a duplicate error. </font>";
                             }
                             }
       
       
   }
           
    if(id.contains("annual")){txtresponse="";}
         if(conn.st!=null){conn.st.close();}  
         if(conn.rs!=null){conn.rs.close();}  
         if(conn.pst1!=null){conn.pst1.close();}  
         if(conn.conne!=null){conn.conne.close();}  
        
   
        } catch (SQLException ex) {
            Logger.getLogger(importweeklydata.class.getName()).log(Level.SEVERE, null, ex);
             txtresponse="<font color='red'>Data for "+facilityname+" NOT inserted succesfully for date "+enddate+".  "+ex+" </font>";
        //send an email at this point of the exception
            
            try {
                sm.Sendemail("RRI SEP IMPORT",ex.toString()+ "___ \n Username: "+user+" Facility name: \n "+facilityname+" \n "+myresponse, "MYSQL IMPORTING ERROR ","EKaunda@fhi360.org");
                } catch (MessagingException ex1) {
                Logger.getLogger(importweeklydata.class.getName()).log(Level.SEVERE, null, ex1);
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
