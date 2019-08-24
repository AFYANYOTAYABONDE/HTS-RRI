/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package code;

import database.dbConnweb;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.joda.time.DateTime;
import org.joda.time.Weeks;

/**
 *
 * @author Emmanuel E
 */
public class excelreport_cumulative extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            /* TODO output your page here. You may use following sample code. */
   
             String allpath = getServletContext().getRealPath("/MOIS.xlsm");
            
XSSFWorkbook wb1;
 
String pathtodelete=null;

Date da= new Date();
String dat2 = da.toString().replace(" ", "_");

dat2 = dat2.toString().replace(":", "_");
   
    String mydrive = allpath.substring(0, 1);
    
    String np=mydrive+":\\APHIAPLUS\\MOIS\\MACROS\\MOIS_REPORT"+dat2+".xlsm";
    //check if file exists
     String sourcepath = getServletContext().getRealPath("/MOIS.xlsm");
             
    File f = new File(np);
if(!f.exists()&& !f.isFile() ) {
/* do something */
    
copytemplates ct= new copytemplates();
System.out.println("Copying macros..");
ct.transfermacros(sourcepath,np);
    
}
else 
  //copy the file alone  
{
    
copytemplates ct= new copytemplates();
//copy the agebased file only
ct.copymacros(sourcepath,np);

}
    


            
             File allpathfile= new File(np);
     
      OPCPackage pkg = OPCPackage.open(allpathfile);
 
      pathtodelete=np;
    
    
    //wb = new XSSFWorkbook( OPCPackage.open(allpath) );
    wb1 = new XSSFWorkbook(pkg);
    
    
    SXSSFWorkbook wb = new SXSSFWorkbook(wb1, 100);
    
  
    
           Sheet rawdata = wb.getSheet("Facility Report");     
            String startdate="2016-10-01";
            
            String enddate="2016-10-30";
            String county="";
            
       
            if(request.getParameter("startdate")!=null){
            startdate=request.getParameter("startdate");
            }
            if(request.getParameter("county")!=null){
                if(!request.getParameter("county").equals(""))
               {
                
            county=request.getParameter("county");
            
                }
            }
           
            
            
            if(request.getParameter("enddate")!=null){
            enddate=request.getParameter("enddate");
            }
            String countywhere=" and 1=1";
            if(!county.equals("")){
            countywhere="  and ( county like '"+county+"' )";
            }
            
            
            DateTime dateTime1 = new DateTime(startdate);
            DateTime dateTime2 = new DateTime(enddate);

int weeks = Weeks.weeksBetween(dateTime1, dateTime2).getWeeks();
            System.out.println("___Weeks____"+weeks);
           
            if(weeks==0){
            weeks=1;
                        }
            //String header[]="county,subcounty,facilityname,startdate,enddate,hiv_pos_target_child,hiv_pos_target_adult,hiv_pos_target_total,hiv_pos_child,hiv_pos_adult,hiv_pos_total,new_care_child,new_care_adult,new_care_total,new_art_target_child,new_art_target_adult,new_art_target_total,started_art_child,started_art_adult,started_art_total,viral_load_target_child,viral_load_target_adult,viral_load_target_total,viral_load_done_child,viral_load_done_adult,viral_load_done_total,ipt_target_child,ipt_target_adult,ipt_target_total,ipt_child,ipt_adult,ipt_total,testing_target_child,testing_target_adult,testing_target_total,test_child,test_adult,test_total,pmtct_hiv_pos_target,pmtct_hiv_pos,eid_target,eid_done,viral_load_mothers_target,viral_load_mothers_done,hiv_pos_yield_perc_child,hiv_pos_yield_perc_adult,hiv_pos_yield_perc_all,hiv_pos_care_perc_child,hiv_pos_care_perc_adult,hiv_pos_care_perc_all,started_art_perc_child,started_art_perc_adult,started_art_perc_all,viral_test_perc_child,viral_test_perc_adult,viral_test_perc_all,ipt_done_perc_child,ipt_done_perc_adult,ipt_done_perc_all,tested_perc_child,tested_perc_adult,tested_perc_all,viral_load_mothers_perc,eid_done_perc,pmtct_hiv_pos_perc,hiv_pos_yield_cmts,hiv_pos_care_cmts,started_art_cmts,viral_test_cmts,ipt_done_cmts,tested_cmts,viral_load_mothers_cmts,eid_done_cmts,pmtct_hiv_pos_cmts".split(",");
            //String headername[]="COUNTY,SUB-COUNTY,FACILITY,START DATE,END DATE,HIV POSITIVE TARGET CHILDREN,HIV POSITIVE TARGET ADULT,HIV POSITIVE TARGET TOTAL,HIV POSITIVE CHILDREN,HIV POSITIVE ADULT,HIV POSITIVE TOTAL, NEW CARE CHILDREN,NEW CARE ADULT,NEW CARE TOTAL,NEW ART TARGET CHILDREN,NEW ART TARGET ADULT,NEW ART TARGET TOTAL,STARTED ART CHILDREN,STARTED ART ADULT,STARTED ART TOTAL,VIRAL LOAD TARGET CHILDREN,VIRAL LOAD TARGET ADULT,VIRAL LOAD TARGET TOTAL,VIRAL LOAD DONE CHILDREN,VIRAL LOAD DONE ADULT,VIRAL LOAD DONE TOTAL,IPT TARGET CHILDREN,IPT TARGET ADULT,IPT TARGET TOTAL,IPT CHILDREN,IPT ADULT,IPT TOTAL,TESTING TARGET CHILDREN,TESTING TARGET ADULT,TESTING TARGET TOTAL,TESTING CHILDREN,TESTING ADULT,TESTING TOTAL,PMTCT HIV POSITIVE TARGET,PMTCT HIV POSITIVE ,EID TARGET,EID DONE,VIRAL LOAD MOTHERS TARGET,VIRAL LOAD MOTHERS DONE,HIV POSITIVE YIELD CHILDREN ,HIV POSITIVE YIELD ADULT,HIV POSITIVE YIELD ALL,HIV POSITIVE CARE CHILDREN,HIV POSITIVE CARE ADULT,HIV POSITIVE CARE ALL,STARTED ART CHILDREN,STARTED ART ADULT,STARTED ART ,VIRAL TEST CHILDREN,VIRAL TEST ADULT,VIRAL TEST ALL,IPT DONE CHILD,IPT DONE ADULT,IPT DONE ALL,TESTED CHILD,TESTED ADULT,TESTED ALL,VIRAL LOAD MOTHERS ,EID DONE,PMTCT HIV POSITIVE,HIV POSITIVE YIELD COMMENTS,HIV POSITIVE CARE COMMENTS,STARTED ART COMMENTS,VIRAL TEST COMMENTS,IPT DONE COMMENTS ,TESTED COMMENTS,VIRAL LOAD MOTHERS COMMENTS,EID DONE COMMENTS,PMTCT HIV POSITIVE COMMENTS,REPORTING RATE".split(",");
            
            String header[]="county,subcounty,facilityname,startdate,enddate,testing_target_child,testing_target_adult,testing_target_total,test_child,test_adult,test_total,tested_perc_child,tested_perc_adult,tested_perc_all,tested_cmts,hiv_pos_target_child,hiv_pos_target_adult,hiv_pos_target_total,hiv_pos_child,hiv_pos_adult,hiv_pos_total,hiv_pos_yield_perc_child,hiv_pos_yield_perc_adult,hiv_pos_yield_perc_all,hiv_pos_yield_cmts,new_care_child,new_care_adult,new_care_total,hiv_pos_care_perc_child,hiv_pos_care_perc_adult,hiv_pos_care_perc_all,hiv_pos_care_cmts,new_art_target_child,new_art_target_adult,new_art_target_total,started_art_child,started_art_adult,started_art_total,started_art_perc_child,started_art_perc_adult,started_art_perc_all,started_art_cmts,viral_load_target_child,viral_load_target_adult,viral_load_target_total,viral_load_done_child,viral_load_done_adult,viral_load_done_total,viral_test_perc_child,viral_test_perc_adult,viral_test_perc_all,viral_test_cmts,ipt_target_child,ipt_target_adult,ipt_target_total,ipt_child,ipt_adult,ipt_total,ipt_done_perc_child,ipt_done_perc_adult,ipt_done_perc_all,ipt_done_cmts,pmtct_hiv_pos_target,pmtct_hiv_pos,pmtct_hiv_pos_perc,pmtct_hiv_pos_cmts,eid_target,eid_done,eid_done_perc,eid_done_cmts,viral_load_mothers_target,viral_load_mothers_done,viral_load_mothers_perc,viral_load_mothers_cmts".split(",");
            String headername[]="COUNTY,SUB-COUNTY,FACILITY,START DATE,END DATE,TESTING TARGET CHILDREN,TESTING TARGET ADULT,TESTING TARGET TOTAL,TESTING CHILDREN,TESTING ADULT,TESTING TOTAL,PERCENTAGE TESTED AGAINST TARGET CHILDREN,PERCENTAGE TESTED AGAINST TARGET ADULT,PERCENTAGE TESTED AGAINST TARGET ALL,PERCENTAGE TESTED AGAINST TARGET COMMENTS,HIV POSITIVE TARGET CHILDREN,HIV POSITIVE TARGET ADULT,HIV POSITIVE TARGET TOTAL,HIV POSITIVE CHILDREN,HIV POSITIVE ADULT,HIV POSITIVE TOTAL,PERCENTAGE HIV POSITIVE TARGET YIELD ACHIEVED CHILDREN,PERCENTAGE HIV POSITIVE TARGET YIELD ACHIEVED ADULT,PERCENTAGE HIV POSITIVE TARGET YIELD ACHIEVED ALL,PERCENTAGE HIV POSITIVE TARGET YIELD ACHIEVED COMMENTS, NEW CARE CHILDREN,NEW CARE ADULT,NEW CARE TOTAL,PERCENTAGE HIV POSITIVE ENROLLED ON CARE CHILDREN,PERCENTAGE HIV POSITIVE ENROLLED ON CARE ADULT,PERCENTAGE HIV POSITIVE ENROLLED ON CARE ALL,PERCENTAGE HIV POSITIVE ENROLLED ON CARE COMMENTS,NEW ART TARGET CHILDREN,NEW ART TARGET ADULT,NEW ART TARGET TOTAL,STARTED ART CHILDREN,STARTED ART ADULT,STARTED ART TOTAL,PERCENTAGE OF TARGET STARTED ON ART CHILDREN,PERCENTAGE OF TARGET STARTED ON ART ADULT,PERCENTAGE OF TARGET STARTED ON ART ALL,PERCENTAGE OF TARGET STARTED ON ART COMMENTS,VIRAL LOAD TARGET CHILDREN,VIRAL LOAD TARGET ADULT,VIRAL LOAD TARGET TOTAL,VIRAL LOAD DONE CHILDREN,VIRAL LOAD DONE ADULT,VIRAL LOAD DONE TOTAL,PERCENTAGE OF VIRAL LOAD TESTS DONE AGAINST TARGET CHILDREN,PERCENTAGE OF VIRAL LOAD TESTS DONE AGAINST TARGET ADULT,PERCENTAGE OF VIRAL LOAD TESTS DONE AGAINST TARGET ALL,PERCENTAGE OF VIRAL LOAD TESTS DONE AGAINST TARGET COMMENTS,IPT TARGET CHILDREN,IPT TARGET ADULT,IPT TARGET TOTAL,IPT CHILDREN,IPT ADULT,IPT TOTAL,PERCENTAGE OF IPT DONE AGAINST TARGET CHILDREN,PERCENTAGE OF IPT DONE AGAINST TARGET ADULT,PERCENTAGE OF IPT DONE AGAINST TARGET ALL,PERCENTAGE OF IPT DONE AGAINST TARGET COMMENTS,PMTCT HIV POSITIVE TARGET,PMTCT HIV POSITIVE ,PERCENTAGE PMTCT HIV POSITIVE YIELD ACHIEVED AGAINST TARGET ALL,PERCENTAGE PMTCT HIV POSITIVE YIELD ACHIEVED AGAINST TARGET COMMENTS,EID TARGET,EID DONE,PERCENTAGE EID DONE AGAINST TARGET ALL,PERCENTAGE EID DONE AGAINST TARGET COMMENTS,VIRAL LOAD MOTHERS TARGET,VIRAL LOAD MOTHERS DONE,PERCENTAGE VIRAL LOAD TESTS DONE FOR MOTHERS AGAINST TARGET ALL,PERCENTAGE VIRAL LOAD TESTS DONE FOR MOTHERS AGAINST TARGET COMMENTS,REPORTING RATE".split(",");
            //
            //
           Row rw0=rawdata.createRow(0);
            rw0.setHeightInPoints(25);
            
            for(int d=0;d<headername.length;d++){
            Cell ce=rw0.createCell(d);
            ce.setCellValue(headername[d]);
            
            
            
            }
            
            dbConnweb conn= new dbConnweb();
            
            //conn.st.executeUpdate("SET GLOBAL max_allowed_packet = 209715200");
            conn.rs = conn.st.executeQuery("SHOW VARIABLES LIKE 'max_allowed_packet' ");
            if (conn.rs.next()) {
                System.out.println("Generating report | Max_allowed_connection_" + conn.rs.getString(2));

            }
            
            String where=" (enddate between '"+startdate+"' and '"+enddate+"')  "+countywhere+" and cur.id  like '%_weekly%' ";      
            String where1=" (enddate between '"+startdate+"' and '"+enddate+"') and weekly_data_new.id  like '%_weekly%'  ";      
            
            String period="1";
            String yr=enddate.substring(0, 4);
            String tar[]=enddate.split("-");
            
            int mwaka=new Integer(yr);
            if(new Integer(tar[1])>=10 && new Integer(tar[1])<=12){
            mwaka=mwaka+1;
            }
            //get data in report form and add into the various json macros.
//String query="select facilityname,startdate,enddate, hiv_pos_target_child,hiv_pos_target_adult,hiv_pos_target_total ,hiv_pos_child as hiv_pos_child , hiv_pos_adult as hiv_pos_adult  ,hiv_pos_total as hiv_pos_total  ,new_care_child as new_care_child ,new_care_adult as new_care_adult ,new_care_total as new_care_total  , new_art_target_child  ,new_art_target_adult  ,new_art_target_total  ,started_art_child as started_art_child, started_art_adult as started_art_adult ,started_art_total as started_art_total ,viral_load_target_child  ,viral_load_target_adult  ,viral_load_target_total  ,viral_load_done_child as viral_load_done_child ,viral_load_done_adult as viral_load_done_adult ,viral_load_done_total as viral_load_done_total  ,ipt_target_child  ,ipt_target_adult  ,ipt_target_total  ,ipt_child as ipt_child ,ipt_adult as ipt_adult ,ipt_total as ipt_total ,testing_target_child  ,testing_target_adult  ,testing_target_total  ,test_child as test_child ,test_adult as test_adult   ,test_total as test_total , pmtct_hiv_pos_target,pmtct_hiv_pos as pmtct_hiv_pos, eid_target  , eid_done as eid_done, viral_load_mothers_target, viral_load_mothers_done as viral_load_mothers_done  from weekly_data_new join facility on weekly_data_new.facilityname=facility.facility_name ";

String query=" select facility.county,facility.subcounty,cur.facilityname,cur.startdate,cur.enddate,case when  ROUND(targets.testing_target_child/"+period+") >0 then ROUND(targets.testing_target_child/"+period+") else 1 end as testing_target_child,case when  ROUND(targets.testing_target_adult/"+period+") >0 then ROUND(targets.testing_target_adult/"+period+") else 1 end as testing_target_adult,case when  ROUND(targets.testing_target_total/"+period+") >0 then ROUND(targets.testing_target_total/"+period+") else 1 end as testing_target_total,SUM(cur.test_child) as test_child,SUM(cur.test_adult) as test_adult,SUM(cur.test_total) as test_total,AVG(cur.tested_perc_child) as tested_perc_child,AVG(cur.tested_perc_adult) as tested_perc_adult,AVG(cur.tested_perc_all) as tested_perc_all,cur.tested_cmts,case when  ROUND(targets.hiv_pos_target_child/"+period+") >0 then ROUND(targets.hiv_pos_target_child/"+period+") else 1 end as hiv_pos_target_child,case when  ROUND(targets.hiv_pos_target_adult/"+period+") >0 then ROUND(targets.hiv_pos_target_adult/"+period+") else 1 end as hiv_pos_target_adult,case when  ROUND(targets.hiv_pos_target_total/"+period+") >0 then ROUND(targets.hiv_pos_target_total/"+period+") else 1 end as hiv_pos_target_total,SUM(cur.hiv_pos_child) as hiv_pos_child,SUM(cur.hiv_pos_adult) as hiv_pos_adult,SUM(cur.hiv_pos_total) as hiv_pos_total,AVG(cur.hiv_pos_yield_perc_child) as hiv_pos_yield_perc_child,AVG(cur.hiv_pos_yield_perc_adult) as hiv_pos_yield_perc_adult,AVG(cur.hiv_pos_yield_perc_all) as hiv_pos_yield_perc_all,cur.hiv_pos_yield_cmts,SUM(cur.new_care_child) as new_care_child,SUM(cur.new_care_adult) as new_care_adult,SUM(cur.new_care_total) as new_care_total,AVG(cur.hiv_pos_care_perc_child) as hiv_pos_care_perc_child,AVG(cur.hiv_pos_care_perc_adult) as hiv_pos_care_perc_adult,AVG(cur.hiv_pos_care_perc_all) as hiv_pos_care_perc_all,cur.hiv_pos_care_cmts,case when  ROUND(targets.new_art_target_child/"+period+") >0 then ROUND(targets.new_art_target_child/"+period+") else 1 end as new_art_target_child,case when  ROUND(targets.new_art_target_adult/"+period+") >0 then ROUND(targets.new_art_target_adult/"+period+") else 1 end as new_art_target_adult,case when  ROUND(targets.new_art_target_total/"+period+") >0 then ROUND(targets.new_art_target_total/"+period+") else 1 end as new_art_target_total,SUM(cur.started_art_child) as started_art_child,SUM(cur.started_art_adult) as started_art_adult,SUM(cur.started_art_total) as started_art_total,AVG(cur.started_art_perc_child) as started_art_perc_child,AVG(cur.started_art_perc_adult) as started_art_perc_adult, AVG(cur.started_art_perc_all) as started_art_perc_all,cur.started_art_cmts,case when  ROUND(targets.viral_load_target_child/"+period+") >0 then ROUND(targets.viral_load_target_child/"+period+") else 1 end as viral_load_target_child,case when  ROUND(targets.viral_load_target_adult/"+period+") >0 then ROUND(targets.viral_load_target_adult/"+period+") else 1 end as viral_load_target_adult,case when  ROUND(targets.viral_load_target_total/"+period+") >0 then ROUND(targets.viral_load_target_total/"+period+") else 1 end as viral_load_target_total,SUM(cur.viral_load_done_child) as viral_load_done_child,SUM(cur.viral_load_done_adult) as viral_load_done_adult, SUM(cur.viral_load_done_total) as viral_load_done_total,AVG(cur.viral_test_perc_child) as viral_test_perc_child,AVG(cur.viral_test_perc_adult) as viral_test_perc_adult, AVG(cur.viral_test_perc_all) as viral_test_perc_all,cur.viral_test_cmts,case when  ROUND(targets.ipt_target_child/"+period+") >0 then ROUND(targets.ipt_target_child/"+period+") else 1 end as ipt_target_child,case when  ROUND(targets.ipt_target_adult/"+period+") >0 then ROUND(targets.ipt_target_adult/"+period+") else 1 end as ipt_target_adult,case when  ROUND(targets.ipt_target_total/"+period+") >0 then ROUND(targets.ipt_target_total/"+period+") else 1 end as ipt_target_total,SUM(cur.ipt_child) as ipt_child,SUM(cur.ipt_adult) as ipt_adult ,SUM(cur.ipt_total) as ipt_total,AVG(cur.ipt_done_perc_child) as ipt_done_perc_child,AVG(cur.ipt_done_perc_adult) as ipt_done_perc_adult, AVG(cur.ipt_done_perc_all) as ipt_done_perc_all,cur.ipt_done_cmts,case when ROUND(targets.pmtct_hiv_pos_target/"+period+") >0 then ROUND(targets.pmtct_hiv_pos_target/"+period+") else 1 end as pmtct_hiv_pos_target,SUM(cur.pmtct_hiv_pos) as pmtct_hiv_pos,AVG(cur.pmtct_hiv_pos_perc) as pmtct_hiv_pos_perc,cur.pmtct_hiv_pos_cmts,case when  ROUND(targets.eid_target/"+period+") >0 then ROUND(targets.eid_target/"+period+") else 1 end as eid_target,SUM(cur.eid_done) as eid_done,AVG(cur.eid_done_perc) as eid_done_perc,cur.eid_done_cmts,case when  ROUND(targets.viral_load_mothers_target/"+period+") >0 then ROUND(targets.viral_load_mothers_target/"+period+") else 1 end as viral_load_mothers_target,SUM(cur.viral_load_mothers_done) as viral_load_mothers_done,AVG(cur.viral_load_mothers_perc) as viral_load_mothers_perc,cur.viral_load_mothers_cmts  from weekly_data_new cur join (facility join targets on (facility.mflcode=targets.facility and targets.year='"+mwaka+"' ) ) on cur.facilityname=facility.facility_name where  "+where+" "+
" group by facilityname ";

            System.out.println(""+query);
            try {
                
                conn.rs=conn.st.executeQuery(query);
                 String facilname="";
                String facilnamecopy="";
                
                
 String id="";      
      
 
        
//percentages


String viral_load_mothers_perc=null;
String  eid_done_perc=null;
String pmtct_hiv_pos_perc=null;

//new percenatages
String hiv_pos_yield_perc_child=null;
String hiv_pos_yield_perc_adult=null;
String hiv_pos_yield_perc_all=null;
String hiv_pos_care_perc_child=null;
String hiv_pos_care_perc_adult=null;
String hiv_pos_care_perc_all=null;
String started_art_perc_child=null;
String started_art_perc_adult=null;
String started_art_perc_all=null;
String viral_test_perc_child=null;
String viral_test_perc_adult=null;
String viral_test_perc_all=null;
String ipt_done_perc_child=null;
String ipt_done_perc_adult=null;
String ipt_done_perc_all=null;
String tested_perc_child=null;
String tested_perc_adult=null;
String tested_perc_all=null;          
        //comments
String viral_load_mothers_cmts=null;
String eid_done_cmts=null;
String pmtct_hiv_pos_cmts=null;
String hiv_pos_yield_cmts=null;
String hiv_pos_care_cmts=null;
String started_art_cmts=null;
String viral_test_cmts=null;
String ipt_done_cmts=null;
String tested_cmts=null;
                
                
  Row rwx = null;

           

            int rowno=0;
            
        

                while(conn.rs.next())
                {
                   
                       rowno++;
            
            rwx=rawdata.createRow(rowno);
            rwx.setHeightInPoints(23);
                    
                    //do a per facility 
                    
                    //System.out.println("___FACILITY : "+conn.rs.getString("facilityname")+" => hiv_pos_total "+conn.rs.getString("hiv_pos_total"));
                    
               
                for(int a=1;a<=header.length;a++){
                
                
                    System.out.print(header[a-1]+" _ "+conn.rs.getString(a));
                Cell ce=rwx.createCell(a-1);
               
                if(a>5 && a<=73){
                    if(header[a-1].contains("cmts")){
                     ce.setCellValue(conn.rs.getString(a));
                    }
                    else if(header[a-1].contains("_perc")  ){
                     ce.setCellValue(conn.rs.getInt(a));
                        System.out.println("__Percent");
                    }
                    else {
            ce.setCellValue(conn.rs.getInt(a));
                    }
                }
                else {
                    
                 ce.setCellValue(conn.rs.getString(a));
                
                }
            
                
                                                  }
                //reporting rate
                int reportingrate=0;
                
                String getrates="select ROUND(((count(facilityname))/("+weeks+")*100)) as count from weekly_data_new where facilityname like '"+conn.rs.getString("facilityname")+"' and "+where1+" ";
                
                
                conn.rs1=conn.st1.executeQuery(getrates);
                
                if(conn.rs1.next()){
                
                reportingrate=conn.rs1.getInt(1);
                }
                
                Cell ce=rwx.createCell(header.length);
                  ce.setCellValue(reportingrate);
                
                
                
                }
                
            
                
                if(conn.rs!=null){conn.rs.close();}
                if(conn.rs1!=null){conn.rs1.close();}
                if(conn.st!=null){conn.st.close();}
                if(conn.st1!=null){conn.st1.close();}
                if(conn.conne!=null){conn.conne.close();}
                
        
            Date dat = new Date();

        String dat1 = dat.toString().replace(" ", "_");

        // write it as an excel attachment
        ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
        wb.write(outByteStream);
        byte[] outArray = outByteStream.toByteArray();
        response.setContentType("application/ms-excel");
        response.setContentLength(outArray.length);
        response.setHeader("Expires:", "0"); // eliminates browser caching
        response.setHeader("Content-Disposition", "attachment; filename=MOIS_Cum_Rpt_From" + startdate.replace(" ","-") +"_To_"+enddate.replace(" ","_") +".xlsm");
        response.setHeader("Set-Cookie","fileDownload=true; path=/");
        OutputStream outStream = response.getOutputStream();
        outStream.write(outArray);
        outStream.flush();
        pkg.close();
         wb.dispose();
       // response.sendRedirect("index.jsp");
           
         File file= new File(pathtodelete);
        
        if(file.delete()){
    			System.out.println(file.getName() + " is deleted!");
    		}else{
    			System.out.println("Delete operation is failed.");
    		}
                
                
                
            } catch (SQLException ex) {
                Logger.getLogger(excelreport.class.getName()).log(Level.SEVERE, null, ex);
            }


                                                     } catch (InvalidFormatException ex) {
            Logger.getLogger(excelreport.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(excelreport.class.getName()).log(Level.SEVERE, null, ex);
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
