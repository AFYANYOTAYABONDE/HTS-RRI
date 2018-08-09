/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reports;


import General.IdGenerator;
import database.dbConnweb;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 *
 * @author EKaunda
 */
public class reports extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();

        /* TODO output your page here. You may use following sample code. */
//______________________________________________________________________________________
//                       CREATE THE WORKSHEETS          
//______________________________________________________________________________________  
        HSSFWorkbook wb = new HSSFWorkbook();

        HSSFFont font = wb.createFont();
        font.setFontHeightInPoints((short) 18);
        font.setFontName("Cambria");
        font.setColor((short) 0000);
        CellStyle style = wb.createCellStyle();
        style.setFont(font);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont font2 = wb.createFont();
        font2.setFontName("Cambria");
        font2.setColor((short) 0000);
        
        CellStyle style2 = wb.createCellStyle();
        style2.setFont(font2);
        style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
        style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
        style2.setAlignment(HSSFCellStyle.ALIGN_LEFT);
        
        
        
         CellStyle stylec = wb.createCellStyle();
        stylec.setFont(font2);
        stylec.setBorderTop(HSSFCellStyle.BORDER_THIN);
        stylec.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        stylec.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        stylec.setBorderRight(HSSFCellStyle.BORDER_THIN);
        stylec.setAlignment(HSSFCellStyle.ALIGN_LEFT);
        

        HSSFCellStyle stborder = wb.createCellStyle();
        stborder.setBorderTop(HSSFCellStyle.BORDER_THIN);
        stborder.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        stborder.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        stborder.setBorderRight(HSSFCellStyle.BORDER_THIN);
        stborder.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        HSSFCellStyle stylex = wb.createCellStyle();
        stylex.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
        stylex.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        stylex.setBorderTop(HSSFCellStyle.BORDER_THIN);
        stylex.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        stylex.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        stylex.setBorderRight(HSSFCellStyle.BORDER_THIN);
        stylex.setAlignment(HSSFCellStyle.ALIGN_LEFT);

        HSSFCellStyle stylesum = wb.createCellStyle();
        stylesum.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
        stylesum.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        stylesum.setBorderTop(HSSFCellStyle.BORDER_THIN);
        stylesum.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        stylesum.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        stylesum.setBorderRight(HSSFCellStyle.BORDER_THIN);
        stylesum.setAlignment(HSSFCellStyle.ALIGN_CENTER);

        HSSFFont fontx = wb.createFont();
        fontx.setColor(HSSFColor.BLACK.index);
        fontx.setFontName("Cambria");
        stylex.setFont(fontx);
        stylex.setWrapText(true);

        stylesum.setFont(fontx);
        stylesum.setWrapText(true);

         HSSFSheet shet7 = wb.createSheet("Project Summary");
         HSSFSheet shet6 = wb.createSheet("Cumulative by county");
         HSSFSheet shet5 = wb.createSheet("Cumulative by subcounty");
         HSSFSheet shet8 = wb.createSheet("Cumulative by facility");
         HSSFSheet shet4 = wb.createSheet("Cumulative by counsellor");
         HSSFSheet shet3 = wb.createSheet("Weekly by counsellor");
         HSSFSheet shet2 = wb.createSheet("Raw data by counsellor");
         HSSFSheet shet1 = wb.createSheet("Raw data");
        
        
        
         
        
        
       
       
        
        HSSFSheet Sheetnames[]={shet7,shet1,shet2,shet3,shet4,shet5,shet6,shet8};
        String viewnames[]={"rpt_project","htsrri_raw","rpt_sum_modalities_daily","rpt_sum_modalities_weekly","rpt_sum_modalities_cumulative","rpt_subcounty","rpt_county","rpt_facilities_cumulative"};

        String year="";
       IdGenerator dats= new IdGenerator();
        
        String startdate=dats.toDay();
        String enddate="2018-08-30";
        String subcounty="";
        String county="";
        if(request.getParameter("startdate")!=null)
        {
        
            startdate=request.getParameter("startdate");
        
        }
        if(request.getParameter("enddate")!=null)
        {
        
            enddate=request.getParameter("enddate");
        
        }
        
        
        
        startdate=startdate.replace("-", "").substring(0,6);
       // enddate=enddate.replace("-", "").substring(0,6);
        
        
//        //subcounty
//        if(request.getParameter("rpt_subcounty")!=null)
//        {
//            subcounty=request.getParameter("rpt_subcounty");
//        }
//        //county
//        if(request.getParameter("rpt_county")!=null)
//        {
//         county=request.getParameter("rpt_county");
//        }
        
        dbConnweb conn = new dbConnweb();
        //========Query 1=================
        
        String orgunits="1=1 ";
        
        if(!county.equals("")){
        orgunits+=" and County like '"+county+"' ";
        }
        if(!subcounty.equals("") ){
            
         orgunits+=" and `Sub-County` like '"+subcounty+"' ";
        
        }
        
        //for(int sheetno=0;sheetno < wb.getNumberOfSheets();sheetno++){
        int cn=0;
        for(HSSFSheet shet:Sheetnames){
        
        HSSFRow rw0=shet.createRow(1);
        HSSFCell cell = rw0.createCell(0);
                    cell.setCellValue(shet.getSheetName()+" from date 2018-08-06  to "+enddate);
                    cell.setCellStyle(style);
        shet.addMergedRegion(new CellRangeAddress(1, 1, 0,10));
                    
                int count1  = 3;
        
              //shet.getSheetName();
              
                
        
        //========Query two====Facility Details==============
        
        String qry = "select * from "+viewnames[cn]+"  where "+orgunits;

        cn++;
         System.out.println(qry);
        conn.rs = conn.st.executeQuery(qry);
        
         ResultSetMetaData metaData = conn.rs.getMetaData();
        int columnCount = metaData.getColumnCount();

         metaData = conn.rs.getMetaData();
         columnCount = metaData.getColumnCount();
        int count = count1;
        ArrayList mycolumns = new ArrayList();

        while (conn.rs.next()) {

            if (count == (count1)) {
//header rows
                HSSFRow rw = shet.createRow(count);
rw.setHeightInPoints(26);
                for (int i = 1; i <= columnCount; i++) {

                    mycolumns.add(metaData.getColumnLabel(i));
                    HSSFCell cell0 = rw.createCell(i - 1);
                    cell0.setCellValue(metaData.getColumnLabel(i));
                    cell0.setCellStyle(stylex);

                    //create row header
                }//end of for loop
                count++;
            }//end of if
            //data rows     
            HSSFRow rw = shet.createRow(count);

            for (int a = 0; a < columnCount; a++) {
                //System.out.print(mycolumns.get(a) + ":" + conn.rs.getString("" + mycolumns.get(a)));

                HSSFCell cell0 = rw.createCell(a);
                 if(isNumeric(conn.rs.getString("" + mycolumns.get(a)))){
               // if(1==1){
                     
                     
                    
                    if(conn.rs.getString(""+mycolumns.get(a)).length()>3 && conn.rs.getString(""+mycolumns.get(a)).contains(".")){
                        System.out.println("Number:"+conn.rs.getString(""+mycolumns.get(a)));  
                        
                       
                    cell0.setCellValue(conn.rs.getDouble(mycolumns.get(a).toString()));
                    stylec.setDataFormat(wb.createDataFormat().getFormat("0%"));
                    cell0.setCellStyle(stylec);
                    }
                    else {
                    cell0.setCellValue(conn.rs.getInt(mycolumns.get(a).toString()));
                    cell0.setCellStyle(style2);
                    }
                    
                   }
                else 
                {
                    //cell0.setCellValue(conn.rs.getString("" + mycolumns.get(a)));                
                    
                    cell0.setCellValue(conn.rs.getString("" + mycolumns.get(a)));
                    cell0.setCellStyle(style2);
                }
            
                

            }

            // System.out.println("");
            count++;
        }

        
        
        //Autofreeze  || Autofilter  || Remove Gridlines ||  
        
        shet.setAutoFilter(new CellRangeAddress(count1, count - 1, 0, columnCount-1));

        //System.out.println("1,"+rowpos+",0,"+colposcopy);
        for (int i = 0; i <= columnCount; i++) {
            shet.autoSizeColumn(i);
        }

        shet.setDisplayGridlines(false);
        shet.createFreezePane(5, 4);

    }
        
        if(conn.rs!=null){conn.rs.close();}
        if(conn.rs1!=null){conn.rs1.close();}
        if(conn.st!=null){conn.st.close();}
        if(conn.st1!=null){conn.st1.close();}
        
        
        IdGenerator IG = new IdGenerator();
        String createdOn = IG.CreatedOn();

        System.out.println("" + "HTS_RRI_rpt_from_" + createdOn.trim() + ".xls");

        ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
        wb.write(outByteStream);
        byte[] outArray = outByteStream.toByteArray();
        response.setContentType("application/ms-excel");
        response.setContentLength(outArray.length);
        response.setHeader("Expires:", "0"); // eliminates browser caching
        response.setHeader("Content-Disposition", "attachment; filename=" + "HTS_RRI_rpt_from_"+startdate+"_to_"+enddate+"_gen_" + createdOn.trim() + ".xls");
         response.setHeader("Set-Cookie","fileDownload=true; path=/");
        OutputStream outStream = response.getOutputStream();
        outStream.write(outArray);
        outStream.flush();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(reports.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(reports.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static boolean isNumeric(String strNum) {
    try {
        double d = Double.parseDouble(strNum);
    } catch (NumberFormatException | NullPointerException nfe) {
        return false;
    }
    return true;
}
    
}
