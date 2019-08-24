<%-- 
    Document   : index
    Created on : Mar 17, 2016, 3:17:19 PM
    Author     : Emmanuel E
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!--<!DOCTYPE html>-->
<html  manifest="htsrriv1.appcache">
<html  >
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>HSDSA HTS RRI</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
                  <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
                  <link href="css/jquery.dataTables.min.css" rel="stylesheet">
		<link href="css/bootstrap.css" rel="stylesheet">
                <link href="css/bootstrap-datepicker.min.css" rel="stylesheet">
                    <link rel="stylesheet" href="css/select2.min.css">
                    <link rel="shortcut icon" href="htsrri.png">
                  
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">
                
                <style>
input:focus {
    border-color: red;
}
</style>
                
	</head>
	<body>
<!-- header -->
<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
        </div>
        <div class="navbar-collapse collapse">
                       

            
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
              
                    <ul id="g-account-menu" class="dropdown-menu" role="menu">
                        <li><a href="#">My Profile</a></li>
                    </ul>
                </li>
          
                
                 <li><a title="Add Widget" id="adduserbutton" data-toggle="modal" href="#userdetails"><i class="glyphicon glyphicon-user"></i><span id="usernamelabel"> Add Counsellor</span></a></li>
                 <li><a title="Add Widget" data-toggle="modal" style="display:none;" id="exportdataanchor2" href="#addWidgetModal"><i class="glyphicon glyphicon-cloud-upload"></i> Export Data</a></li>
                 <li>
                  <a  title="Help" data-toggle="modal" href="#help">
                            <i class="glyphicon glyphicon-question-sign"></i>
                            Help
                        </a></li>
                              <li><a href="#" style="display:none;" onclick="closeapp();"><i class="glyphicon glyphicon-lock"></i> Exit</a></li>
            </ul>
        </div>
        
    </div>
    <!-- /container -->
    
</div>
<!-- /Header -->
     <div class="well well-sm" style="display:none" >
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
   <strong>Note!</strong> Targets have been hidden from the screen. To show targets for each site, un check the button besides. <b>Hide targets </b> <input type="checkbox" onclick="togglehidding();" checked id="hidetargets" />
  </div>
<!-- Main -->
<div class="container-fluid">
    <div class="row">
        
        <!-- /col-3 -->
        <div class="col-sm-12">

            
            
          <h5 style="text-align: center;color:blue;">HTS RRI Aug-Sep 2018 v 1.0.5</h5>

      
      
  

            <div class="row">
                <!-- center left-->
                <div class="col-md-12">
                    

                  

                    <div class="btn-group btn-group-justified">
                        <a href="#" id='refreshpage' class="btn btn-primary col-sm-3">
                            <i class="glyphicon glyphicon-refresh"></i>
                            <br> Refresh
                        </a>
                        
                         
                            
                            <a  class="btn btn-primary col-sm-3" id="exportdataanchor1" style="display:none;" title="Add Widget" data-toggle="modal" href="#addWidgetModal">
                                <i class="glyphicon glyphicon-cloud-upload"></i>
                                <br/>Export Data 
                                <span id="unexportedno" style="color:yellow;">(0 site )</span>
                            </a>
                            
                        
                        <!--<a href="#" class="btn btn-primary col-sm-3">
                            <i class="glyphicon glyphicon-cog"></i>
                            <br> Settings
                        </a>-->
                       <a class="btn btn-primary col-sm-3" title="Excel report" data-toggle="modal" href="#excelreport">
                            <i class="glyphicon glyphicon-stats"></i>
                            <br> Excel Report
                        </a> 
                    </div>

                    <hr>


                   

                    <!--tabs-->
                    <div class="panel">
                        <ul class="nav nav-tabs " id="myTab">
                           
                            <!--<li class="active editdata" style='display:none;' ><a href="#dataentry" id="newdatabutton" data-toggle="tab">  <i class="glyphicon glyphicon-edit"></i> Edit Data</a></li>-->
                            <!--<li><a href="#reports" style="display:none;" id="reportsbutton" data-toggle="tab"> <i class="glyphicon glyphicon-stats"></i> Report</a></li>--> 
                            <li class="active"><a href="#searchdata" data-toggle="tab"> <i class="glyphicon glyphicon-search"></i> Edit OutComes</a></li> 
                           <!-- <li><a href="#export" data-toggle="tab"> <i class="glyphicon glyphicon-cloud-upload"></i> Data Export</a></li>-->
                            <!--<li class="newdata"><a href="#dataentry" id="newdatabutton" data-toggle="tab">  <i class="glyphicon glyphicon-plus"></i> New Data</a></li>-->
                            <!--<li><a href="#viewcounsellors" data-toggle="tab"> <i class="glyphicon glyphicon-bishop"></i>Counsellors</a></li>-->
                        </ul>
                        <div class="tab-content">
<!--                            <div class="tab-pane  well col-md-12" id="dataentry">
                                
                                
                              Data entry code
                    <div class="panel panel-default">
                       
                        <div class="panel-body" style="width:100%;">
                            <form class="form form-vertical" action="#" method="post" id="weeklydataform">
                                <table class='table table-striped table-bordered'  style="margin-left:  px;" >
                                <tr><th style="text-align:center"><b>Enter HTS Data</b></th></tr>
                                <tr><td class="col-xs-12">
                                <div class="control-group">
                                    <label><font color="red"><b>*</b></font> Date </label>
                                    <div class="controls">
                                        <input type="text" onchange="checkids();" name ="startdate" id="startdate" data-date-end-date="0d" autocomplete="off" class="form-control dates" readonly placeholder="e.g yyyy-mm-dd">
                                        
                                    </div>
                                </div>
                                        </td></tr>
                                
                                <tr><td class="col-xs-12">
                                   <div class="control-group">
                                    <label><font color="red"><b>*</b></font> Date </label>
                                    <div class="controls">
                                        <input type="text" onchange="checkids();settargets();" onblur="" name="enddate" id="enddate" data-date-end-date="0d" autocomplete="off"  class="form-control dates" readonly placeholder="e.g yyyy-mm-dd">
                                   <input type="hidden"  name ="rowid" id="rowid"  />
                                    </div>
                                </div>
                                        
                                        
                                </td></tr>
                                
                                  <tr><td class="col-xs-12">
                                
                                
                                
                              
                                
                                  <div class="control-group">
                                    <label> <font color="red"><b>*</b></font>  Facility Name:</label>
                                    <div class="controls">
                                        <select  onchange="settargets();checkids();validatemodalities();"   name="facilityname" id="facilityname" class="form-control" >
                                            <option>Select Facility Name</option>
                                           
                                        </select>
                                    </div>
                                </div>
                                
                                
                               
                                
                               
                                
                                          </td></tr>
                                  
                                counsellor
                                <tr><td> 

                                        <div class="control-group">
                                            <label> <font color="red"><b>*</b></font>  Name of Counsellor:</label>
                                            <div class="controls">
                                                <select  onchange="" required  name="counsellor" id="counsellor" class="form-control" >
                                                    <option value=''>Select Counsellor</option>

                                                </select>
                                            </div>
                                        </div>


                                    </td></tr>
                                    
                                HTS Testing Modality
                                
                                
                                <tr><td> 
                                             
                                             <div class="control-group">
                                    <label> <font color="red"><b>*</b></font> HTS Testing Modality</label>
                                    <div class="controls">
                                        <select  onchange=""   name="modality" id="modality" class="form-control" >
                                            <option value="">Select Modality</option>
                                            <option value="Optimized Testing IPD">Optimized Testing IPD</option>
                                            <option value="Optimized Testing OPD">Optimized Testing OPD</option>
                                            <option value="PNS">PNS</option>
                                            <option value="Index Testing">Index Testing</option>
                                            <option value="Others">Others</option>
                                           
                                        </select>
                                    </div>
                                </div>
                                             
                                             
                                             </td></tr>
                                
                                
                                
                                    </table>
                                         <table class='table table-striped table-bordered' id="dynamicindicators"  > 
                                   
                                ----INDICATORS---
                                 <tr ><td class='col-xs-12' colspan='3'>
                                 <div class='control-group'>
                                    <label><font color='red'><b>*</b></font>Loading Data.... Please wait</label>
                                  </div></td>
                                 </tr>                                 
                                  <tr>
                                  <td class='col-xs-4'>
                                 <div class='control-group'>
                                    <label>Total</label>
                                    <div class='controls'>
                                   <input onkeypress=' return numbers(event);' onblur='inpatient_uptake_perc();Testing_uptake_perc();' type='number' min ='0' max='5237'  name='inpatient_adm' id='inpatient_adm' class='form-control' >
                                    </div></div>
                                  </td>
                                  <td class='col-xs-4'>
                                 <div class='control-group'>
                                    <label>Adult</label>
                                    <div class='controls'>
                                        <input onkeypress=' return numbers(event);' onblur='inpatient_uptake_perc();Testing_uptake_perc();' type='number' min ='0' max='5237'  name='inpatient_adm' id='inpatient_adm' class='form-control' >
                                    </div></div>
                                  </td>
                                  <td class='col-xs-4'>
                                  <div class='control-group'>
                                  <label>Children</label>
                                  <div class='controls'>
                                  <input onkeypress=' return numbers(event);' onblur='inpatient_uptake_perc();Testing_uptake_perc();' type='number' min ='0' max='5237'  name='inpatient_adm' id='inpatient_adm' class='form-control' >
                                  </div>
                                   </div>
                                  </td>                                    
                                  </tr>
                                  
                                     </table>
                                <table class="table table-striped table-bordered">
                                       <tr><td colspan="3" class="col-xs-12">               
                                <div class="control-group col-xs-12">
                                        <div class="alert-info">Note: Please enter data for all input fields.</div>
                                   <br/>
                                    <div class="controls">
                                        <button type="submit" id='savebutton' onclick="validateweeklydata();" style="margin-left: 0%;" class="btn-lg btn-success active">
                                            SAVE
                                        </button>
                                     </div>
                                    <div class="controls">
                                        <button type="submit" id='updatebutton' onclick="updateweeklydata();" style="margin-left: 0%;display:none;" class="btn-lg btn-info active">
                                            UPDATE
                                        </button>
                                    
                                        
                                    </div>
                                    
                                </div>
                                        </td></tr>
                                        
                                </table>
                            </form>
                        </div>
                        /panel content
                    </div>
                    /panel

                              
                              Data entry code
                            
                            </div>-->
                            <div class="tab-pane well" id="reports">
                                
                                
                               <!--Dashboard code-->
                            
                               
                               
                               
                                                   <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4>Dashboard</h4></div>
                        <div class="panel-body">
                            <form id="reportsform">
<table class='table table-striped table-bordered' id="reportstable" >
    
                            </table>
                            </form>
                        </div>
                        <!--/panel-body-->
                    </div>
                    <!--/panel-->

                               
                              
                              <!--Reports entry code-->
                            
                            
                            </div>
                            <div class="tab-pane well" id="export">
                                
                                
                               <!--- Data export---->
                            </div>
                            
<!--                            <div class="tab-pane well" id="searchdata">
                                 <button id="btnDeleteRow" style='display:none;' value="cancel">Delete selected Row</button>
                                <div id="searchtablediv">
                                  
                                </div>    
                               - Data export--
                            </div>-->
                            <div class="tab-pane active well" id="viewcounsellors">
                                 <button id="btnDeleteRow" style='display:none;' value="cancel">Delete selected counselor</button>
                                <div id="searchtabledivcns">
                                  
                                </div>    
                               <!--- Data export---->
                            </div>
                            
                            
                            </div>
                        </div>

                    </div>
                    <!--/tabs-->

                </div>
                <!--/col-->
               
                <!--/col-span-6-->

            </div>
            <!--/row-->

           


            
        </div>
        <!--/col-span-9-->
    </div>

<!-- /Main -->

<footer class="text-center"> &copy; HSDSA USAID </footer>

<div class="modal" id="addWidgetModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" id="refr1" aria-hidden="true">×</button>
                <h4 class="modal-title">Data Export</h4>
            </div>
            <div class="modal-body">
                <form id="exportdataform">
                   
              <button class=" btn-lg btn-success" style="text-align: center;" id="exportbutton" onclick="importdata();"> Export Data</button>
              
              
              <button class=" btn-lg btn-info" style="display:none;text-align: center;"  id="exportmsg" > Exporting Data..</button>
              <p id="exportresponse"> </p>
              </form>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn" id="refr">Close</a>
              
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>
<!-- /.modal -->

<div class="modal" id="userdetails">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" id="saveuserbtn" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Counsellor Registration</h4>
            </div>
            <div class="modal-body">
                <form action="#" id="userform" method="post">
                 <div class="control-group">
                                    <label><font color="red"><b>*</b></font>Counsellor Name</label>
                                    <div class="controls">
                                        <input type="text" maxlength="30" placeholder="eg John Ndoe"   required name="counsellorreg" id="counsellorreg" class="form-control" >
                                    </div>
                                </div> 
                    
                     <div class="control-group" style="display:none;" >
                                    <label>County Supporting:</label>
                                    <div class="controls">
                                        <select  name="usercounty" id="usercounty" style="width:100%;" class="form-control">
                                            <option value="">Select County</option>
                                             <option value="Baringo">Baringo</option>
                                             <option value="Kajiado">Kajiado</option>
                                             <option value="Laikipia">Laikipia</option>
                                             <option value="Nakuru">Nakuru</option>
                                             <option value="Narok">Narok</option>
                                             <option value="Samburu">Samburu</option>
                                             <option value="Turkana">Turkana</option>
                                            
                                           
                                        </select>
                                    </div>
                                </div>
                    
                    <div class="control-group" >
                                    <label>Facility Supporting:</label>
                                    <div class="controls">
                                        <select  name="counsellorfacil" id="counsellorfacil" style="width:100%;" class="form-control">
                                            <option value="">Select Facility</option>
                                            
                                           
                                            
                                           
                                        </select>
                                    </div>
                                </div>
                    
                    
                    
                                <div class="control-group">
                                    <label></label>
                                    <div class="controls">
                                        <button onclick=" updateuser();"  type="submit" style="margin-left: 50%;" data-dismiss="modal" class="btn-lg btn-success active">
                                            SAVE
                                        </button>
                                    </div>
                                </div>   
                    
                </form>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn">Close</a>
              
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>



<div class="modal" id="excelreport">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button"  class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Generate Excel Report <span id="needsinternet"></span></h4>
            </div>
            <div class="modal-body">
                <form  id="excelreportsfom" method="post">
                                <div class="control-group" style="display:none;">
                                    <label><font color="red"><b>*</b></font>Report Start Date</label>
                                    <div class="controls">
                                       <input type="text"  name ="startdaterpt" id="startdaterpt"  class="form-control dates" readonly placeholder="e.g yyyy-mm-dd">
                                    </div>
                                </div> 
                    
                    
                  <div class="control-group" style="display:none;">
                                    <label><font color="red"><b>*</b></font>Report End Date</label>
                                    <div class="controls">
                                       <input type="text"  name ="enddaterpt" id="enddaterpt"  class="form-control dates" readonly placeholder="e.g yyyy-mm-dd">
                                    </div>
                                </div> 
                    
                      <div class="control-group" style="display:none;">
                                    <label>Report Type</label>
                                    <div class="controls" style="display:none;">
                                        <select  name="rpt_type" id="rpt_type" style="width:100%;" class="form-control">
                                           
                                             <!--<option title="From 1st October of the selected date year to the end date specified inside the same date year " value="excelreport_cumulative">Cumulative</option>-->
                                             <option title="Weekly data breakdown per sites" value="reports">Weekly</option>
                                            
                                            
                                           
                                        </select>
                                    </div>
                                </div>
                    
                    <div class="control-group" >
                                    <label>County</label>
                                    <div class="controls">
                                        <select  name="rpt_county" id="rpt_county" style="width:100%;" class="form-control">
                                            <option value="">Select County (optional)</option>
                                             <option value="Baringo">Baringo</option>
                                             <option value="Kajiado">Kajiado</option>
                                             <option value="Laikipia">Laikipia</option>
                                             <option value="Nakuru">Nakuru</option>
                                             <option value="Narok">Narok</option>
                                              <option value="Samburu">Samburu</option>
                                             <option value="Turkana">Turkana</option>
                                            
                                           
                                        </select>
                                    </div>
                                </div>
                    
                   <!-- <div class="control-group" >
                                    <label>Facility </label>
                                    <div class="controls">
                                        <select  name="rpt_facility" id="rpt_facility" style="width:100%;" class="form-control">
                                            <option>Select Facility</option>
                                             
                                            
                                           
                                        </select>
                                    </div>
                                </div> -->
                    
                    
                                <div class="control-group">
                                    <label></label>
                                    <div class="controls">
                                        <button onclick=" getreport();" id="excelreportbtn"   style="margin-left: 30%;"  class="btn-lg btn-info active">
                                            Generate
                                        </button>
                                        
                                        <img src='images/ajax_loader.gif' alt='loading' style="display:none; margin-left:30% ;" class='loading'/>
                                        
                                    </div>
                                </div>   
                    
                </form>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn">Close</a>
              
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>




<div class="modal" id="help">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Help</h4>
            </div>
            <div class="modal-body">
                <p>This  application is created for aiding users in collecting data for the Matching Order indicators which is done weekly. One is expected to enter data per facility.</p>
                <h3>Indicators</h3>
                <p>The specific indicators that one should enter data for are;</p>
                <ul>

<li> # HIV positive target </li>
<li> # HIV positive [cumulative] </li>
<li> # Number new on care [cumulative] </li>
<li> # Target new on ART</li>
<li> # Started on ART [cumulative] </li>
<li> # Viral load target [current on ART for Dec 2015] </li>
<li> # Viral load done [cumulative] </li>
<li> # Viral load done [cumulative] </li>
<li> # Viral load done [cumulative] </li>
<li> # IPT target [current on Care for Dec 2015] </li> 
<li> # IPT done [cumulative] </li>
<li> # Testing target [Target/IPD/OPD work load] </li>
<li> # Tests done [IPD/OPD/VCT] </li>
<li> # PMTCT HIV positive yield target</li>
<li> # PMTCT HIV positive yield [cumulative] </li>
<li> # EID target</li>
<li> # EID done [cumulative] </li>
<li> # viral load tests for mothers target</li>
<li> # viral load tests done for mothers [cumulative]</li>



                </ul>
             <h3>Loading Facilities</h3>
                 <p> The first time of installing/running the application,health facilities are downloaded and saved on the host device (mobile phone or computer browser). This requires internet connectivity. After the download, sites should appear on the facility drop down list.</p>
                 <h3>Data Export</h3>
                <p>Data is saved on your mobile device and should be shared to a server for analysis </p>
                <p>If there is Any un-exported that has  been saved offline, the user will be reminded to create an export by seeing yellow text showing number of sites whose data has not been exported .</p>
            </div>
            <div class="modal-footer">
                <a href="#" data-dismiss="modal" class="btn">Close</a>
               
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dalog -->
</div>




	<!-- script references -->
                <script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/scripts.js"></script>
                <script src="js/bootstrap-datepicker.min.js"></script>
                <script src="js/select2.min.js"></script>
                <script src="js/pouchdb-4.0.1.js"></script>
                 
                <script type="text/javascript" src="js/jquery.fileDownload.js"></script>
                <script type="text/javascript" src="js/datatables.min.js"></script>
<!--                   <script type="text/javascript" charset="utf-8" src="cordova-1.5.0.js"></script>  -->
                <script>
               var hostname="http://hsdsacluster2.fhi360.org";
 // var hostname="http://localhost";

     // todayHighlight: true, daysOfWeekDisabled: "0,6",clearBtn: true, autoclose: true,format: "yyyy-mm-dd",
                </script>
                <script type="text/javascript">
  $(document).ready(function(){
      
          
                         $('.dates').datepicker({
                             todayHighlight: true, clearBtn: true, autoclose: true,format: "yyyy-mm-dd",
     });
      
  $('facilityname').select2();  
  //$('#rowid').val("");  
  
  });   
                 </script>


<script>
   
  var user="hsdsa";  
//load data from the cloud server 
   
//load data from the cloud server 
   function getFacilitiesJson(){
       
      
       
        var facilities="<option value=''>Select Facility</option>";
        
              $.ajax({
                    url:'sites1.json',                            
                    type:'get',  
                    dataType: 'json',  
                    success: function(data) {
                     for(var i=0;i<data.length;i++){
                       
                             if(data[i].isactive==="Yes"){
                  facilities+="<option data-pns='"+data[i].pns+"' value='"+data[i].mflcode+"_"+data[i].facility_name+"'>"+data[i].facility_name+"</option>"; 
                                                        }
             
              
              
                        
                     }
                     //alert(facilities);
                      $("#facilityname").html(facilities);
                      $("#counsellorfacil").html(facilities);
                      
                      
                   $(document).ready(function() {
            //$('#lyricstable').DataTable();
              $('#facilityname').select2(); 
              $('#counsellorfacil').select2(); 
             
             
                                 } );
                     
                      }});
   
   }
   
  // getFacilitiesJson();
   
    
    
      
    
    //PouchDB.debug.enable('*');
    //PouchDB.debug.disable();
    var userdb = new PouchDB('test');
var remoteCouch = false;
var userdetails;

//receive the artist, song title and lyrics text
function adduser(cname,cfacil) {
   userdetails = {
        _id: cname+cfacil, //this is static since we cant have two users using the same phone
	cname:cname,
        cfacil:cfacil,
        completed: false
  };
  userdb.put(userdetails, function callback(err, result) {
    if (!err) {
      console.log('counsellor added succesfully');
    }
    
    setTimeout(delayedrefresh,1500);
  });
}	


  function updateuser(){
   //alert("save called");   
   var counsname=$("#counsellorreg").val();   
   var counsfacil=$("#counsellorfacil").val().replace("'","");
   
   if(counsname===''){alert("Enter Counsellor name");}
   else if(counsfacil===''){alert("Enter Counsellor facility");}
   else 
   {
       
    adduser(counsname,counsfacil); 
   showuser();   
       
   }
   
  }  
    
   function showuser(){

//doc.username=username;
  
  // update user
 // return db.put(doc); //continue from here


	//var counties=["Baringo","Kajiado","Laikipia","Nakuru","Narok"];
	userdb.allDocs({include_docs: true, ascending: true}).then(function (da) {
            //
//if(cname!==''){
//doc.cname=cname;  
//doc.cfacil=cfacil;  
// update user
//return userdb.put(doc); //continue from here
             //}  
          
        //alert(da.total_rows);
        
if(da.total_rows===0){
     $("#usernamelabel").html("Add Counsellor");
        
$("#usernamelabel").click();
$("#usernamelabel").click();

                      }
     else {
       
            var counsellors="<option value=''>select  Counsellor</option>";
            var a;
           
            
           // console.log("  @@ "+da.rows[0].doc.cname);
            
            for(a=0;a<da.total_rows;a++){
                var dat={}; 
           
	       dat=da.rows[a].doc;
                
            if(dat.cname!==''){
                if(da.total_rows===1){
           counsellors="<option value='"+dat.cname+"'>"+dat.cname+"</option>"
           $("#facilityname").val(dat.cfacil);
           $('#facilityname').select2();
            validatemodalities();
                                     
                                     }
       else {
           counsellors+="<option value='"+dat.cname+"'>"+dat.cname+"</option>"
           
       }
           
           $("#counsellor").html(counsellors);
          $('#counsellor').select2(); 
           user=dat.cname;
            }
            else {
             counsellors="<option value=''>Add Counsellor</option>";
             $("#counsellor").html(counsellors);
             
             //Add Counsellor
                
            }
            //alert(doc.county);  
  // var cntselect="<option value=''>Select facility Supporting</option>";
//            for(var s=0;s<counties.length;s++){
//             if(counties[s]===doc.county){
//                 // console.log(counties[s]+"_"+doc.county+"_");
//             
//        cntselect+="<option selected value='"+counties[s]+"'>"+counties[s]+"</option>";
//             } else {
//                   cntselect+="<option  value='"+counties[s]+"'>"+counties[s]+"</option>";
//               
//                 
//             }  
//                
//            }
// $("#counsellorfacil").html(cntselect);

     }//end of row

        }
});
	} //end of function
        
        
     //showuser();
     
   function loaduser()
   {
   //alert("save called");   
    var cname=$("#counsellorreg").val().replace("'","");   
   var cfacil=$("#counsellorfacil").val();   
        adduser(cname,cfacil);   
  }  
      
    
//This is a document to save all facilities for offline use 
var db = new PouchDB('facilities3');
var remoteCouch = false;
var receiveddata;

//add facility details here
function addfacilities(mflcode,county,subcounty,facility,longitude,latitude,sitetype) {
   receiveddata = {
        _id: mflcode,
	facility:facility,
        county:county,
	subcounty:subcounty,
        latitude:latitude,
        longitude:longitude,
        sitetype:sitetype,
        completed: false
  };
  db.put(receiveddata, function callback(err, result) {
    if (!err) {
      console.log('facilities added succesfully');
    }
  });
}	

function updatefacilities(mflcode,county,subcounty,facility,longitude,latitude,sitetype) {
 
 db.get(mflcode).then(function (doc) {
        
  //doc.age = 4;
 
   if(mflcode!=='null' && mflcode!=='' ){
    doc._id=mflcode;
    doc.facility=facility;
        doc.county=county;
	doc.subcounty=subcounty;
        doc.latitude=latitude;
        doc.longitude=longitude;
        doc.sitetype=sitetype;
   //alert('called');
  // put them back
  return db.put(doc);
   }
});
 
 
}


//a function to load facilities data from the 



//========================SAVE TARGETS============================
//========================SAVE TARGETS============================

var targetsdb = new PouchDB('targets_rri3');
var remoteCouch = false;
var receivedtargets;



function addtargets(id,mflcode,year,positive_tg,treatment_tg,viralload_tg,timestamp,weeks) 
{
   receivedtargets = {
_id: id,	
mflcode:mflcode,
year:year,
positive_tg:positive_tg,
treatment_tg:treatment_tg,
viralload_tg:viralload_tg,
timestamp:timestamp,
weeks:weeks,
completed: false
  };
  targetsdb.put(receivedtargets, function callback(err, result) {
    if (!err) {
      //console.log('targets added succesfully');
    }
  });
}

function updatetargets(id,mflcode,year,positive_tg,treatment_tg,viralload_tg,timestamp,weeks){
  //console.log(id);
   targetsdb.get(id).then(function (doc) {
 
   if(mflcode!=='null' && mflcode!=='' ){
doc.mflcode=mflcode;
doc.year=year;
doc.positive_tg=positive_tg;
doc.treatment_tg=treatment_tg;
doc.viralload_tg=viralload_tg;
doc.timestamp=timestamp;
doc.weeks=weeks;
        
   //alert('called');
  // put them back
  return targetsdb.put(doc);
                                         }
});      
        
    
}




function gettargets(){
    
   
              $.ajax({
                    url:'duplicates',                            
                    type:'post',  
                    dataType: 'json',  
                    success: function(data) {
                   
                 //alert(data[0].facility_name);   
                 
                 var datayote=null;
                 
                 
                 
                 
                     for(var i=0;i<data.length;i++){
                         
                    datayote+="<tr id=\""+data[i].id+"\"><td>"+data[i].facilityname+"</td><td>"+data[i].modality+"</td><td>"+data[i].counsellor+"</td><td>"+data[i].enddate+"</td><td>"+data[i].tested+"</td><td>"+data[i].positive+"</td><td>"+data[i].linked_here+"</td><td>"+data[i].linked_else+"</td><td>"+data[i].declined+"</td><td>"+data[i].dead+"</td><td>"+data[i].tca+"</td></tr>";     
                         
                     }
                         
                       // console.log(data[i].facility_name) 
                        
                     
     $("#searchtabledivcns").html("<table id='searchtablecns' class='table table-striped table-bordered'><thead><tr><th>Facility</th><th>Modality</th><th>Counsellor</th><th>Date</th><th>Tested</th><th>Positive</th><th>Linked in this facility</th><th>Linked in another facility</th><th>Declined</th><th>Dead</th><th>TCA</th></tr></thead><tbody>"+datayote+"</tbody></table>");
         
	   $(document).ready(function() {
                
         /* $('#searchtable').DataTable({              
              "autoWidth": true,
              "paging": true,
              "pagingType": "full",
              "lengthChange": false,  "order": [[0,'desc']]                    
          }).makeEditable({sDeleteURL: "js/deleterecords.js"});
          **/
          //new code
          
     
    var table2 = $('#searchtablecns').DataTable({"autoWidth": true,
              "paging": true,
              "pagingType": "full",
              "lengthChange": false,  
              "order": [[0,'desc']]}); 
 
    $('#searchtablecns tbody').on( 'click', 'tr', function () {
        if ($(this).hasClass('selected') ) {
            $(this).removeClass('selected');
             $('#btnDeleteRow').hide();  
        }
        else {
            table2.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
           $('#btnDeleteRow').show();  
            }
    } );
 
    $('#btnDeleteRow').click( function () {
       
     var tablerowid1=table2.$('tr.selected').attr('id');
      
        
        if(ConfirmDeletecns()===true){
        
        deletecnsdata(tablerowid1);
        
        table2.row('.selected').remove().draw( false );
    }
        //call the delete function now
    } );

          
          
          
          
            
                                     } ); 
    
                                                          
                     
                       
                   
        
                                           }
                        
                         });
    
    
}

gettargets();






//=========================SAVE WEEKLY DATA========================

 
//This is a document to save all tables 
var dailydatadb = new PouchDB('weekly_data_rrisep3',{auto_compaction: true});
var remoteCouch = false;
var weeklydata;

//receive the artist, song title and lyrics text
function insertdailydata(id,facility,enddate,counselorname,modality,tested,positive_tg,positive,linked_here,linked_else,declined,dead,tca,timestamp,user, syncstatus) {
   
   
        dailydata = {
        _id: id, //made of startdate_enddate_facilitymfl_frequency //frequency could be _annual or _weekly
	facility:facility,
       // startdate:startdate,
       counselorname:counselorname,
       modality:modality,
	enddate:enddate,
tested:tested,
positive_tg:positive_tg,
positive:positive,
//newart:newart,
//treatment_tg:treatment_tg,
linked_here:linked_here,
linked_else:linked_else,
declined:declined,
dead:dead,
tca:tca,
//newpos_pmtct:newpos_pmtct,
//art_pmtct:art_pmtct,
//viralload_tg:viralload_tg,
//viralload:viralload,
//viralload_mothers:viralload_mothers,

        timestamp:timestamp,
        user:user,
        syncstatus:syncstatus,        
        completed: false
  };
  dailydatadb.put(dailydata, function callback(err, result) {
    if (!err) {
      console.log('daily data added succesfully');
      
    }
  });
}	



//prepare form data

//===================================================INSERT Dailty DATA===================================

  var facility=null;

 //var startdate=null;   
 var enddate=null;
 var counselorname=null;
 var modality=null;
var tested=null; 
var positive_tg=null; 
var positive=null; 
//var treatment_tg=null; 
var linked_herevar=null; 
var linked_else=null; 
var declined=null; 
var dead=null; 
var tca=null; 
//var viralload_tg=null; 
//var viralload=null; 
//var viralload_mothers=null; 

   
//var newart=null;
//var newpos_pmtct=null;
//var art_pmtct=null;
   
   //added 201605 
    var progressbarstoskip=[];
     var allindicatorsarray=[];
     var allnontargetindicatorsarray=[];
     var allcommentsarray=[];
     var allprogressbar_hiddentext_array=[];
     var hidetargetsui='yes';
function createdynamicinputs(){
    
    
     $(document).ready(function(){
         
       
   
         $.getJSON("indicators.json",function(result){
             
             
             
             var table="";
             var row1="";
             var row2="";
             var count=1;
             
             for(a=0;a< result.length; a++){
                 
             var indicatorname=result[a].IndicatorName;    
             var fullindicator=result[a].FullIndicator;    
             var indicatorid=result[a].IndicatorID;
             var label=result[a].Age;
             var level=result[a].Level;
             var inputtype=result[a].datainputtype;
             var minimum=result[a].Min;
             var maximum=result[a].Max;
             var onblur="";
             var onkey_up="autocalculate('"+indicatorid+"');";
             if(result[a].onblur!==null){
                 onblur="autocalculate('"+indicatorid+"');"+result[a].onblur;
             }
             var onkeypress=result[a].onkeypress;
             var tdclass=result[a].tdclass;
             var isrequired=result[a].Required;
             var isnewrow=result[a].newrow;
             var readonlyvar=result[a].readonly;
             console.log("Read only:"+result[a].readonly);
             
             var isreadonly="";
             allindicatorsarray.push(indicatorid);
             
             if(indicatorid.indexOf("target")===-1){
                 
              allnontargetindicatorsarray.push(indicatorid);   
             }
              var tabindex="";
             if(readonlyvar==="TRUE"){
                 
               isreadonly="readonly";
               tabindex=" tabindex='-1' style='background-color:#b1b1cd;' ";
             }
             var colspan=result[a].colspan;
            
             if(label==='Total' && tdclass==='col-xs-4' ){  }
             if(isnewrow===1)
             {
                 //dont show targets 
               if(hidetargetsui==='yes' && readonlyvar==="TRUE"  ){
                 row1="<tr class='hiderows' style='display:none;'> <td class='col-xs-12' colspan='3'> <div class='control-group'> <label  > <font color='red'> <b> * </b> </font> <span class='badge'> "+count+" </span>     "+indicatorname+"    <span class='badge' title='Indicator' data-toggle='popover' data-trigger='hover' data-content='"+fullindicator+"'>?</span> </label>  </div> </td> </tr>";
                 count++;
                 row2+=row1;   
                   
               }
               else {
                 row1="<tr> <td class='col-xs-12' colspan='3'> <div class='control-group'> <label  > <font color='red'> <b> * </b> </font> <span class='badge'> "+count+" </span>     "+indicatorname+"    <span class='badge' title='Indicator' data-toggle='popover' data-trigger='hover' data-content='"+fullindicator+"'>?</span> </label>  </div> </td> </tr>";
                 count++;
                 row2+=row1;
             }
             }
             else{
                 
                 row1="";
             }
              if(isnewrow===1 && count===2)
             {
               if(hidetargetsui==='yes' && readonlyvar==="TRUE"  ){
                     row2+=" <tr class='hiderows' style='display:none;'> ";   
               }   
               else {
                   
                     row2+=" <tr> ";   
                   
               }
                 
        
              }
              else  if(isnewrow===1 && count > 2 && count<=result.length){
                  
                   if(hidetargetsui==='yes' && readonlyvar==="TRUE"  ){
                       
                         row2+=" </tr> <tr class='hiderows' style='display:none;'> "; 
                         
                       } else {
                           
                        row2+=" </tr> <tr> ";      
                   }
                  
               
                  
              }
              
              
              row2+="<td class='"+tdclass+"' colspan='"+colspan+"' > <div class='control-group' > <label> "+label+" </label> <div class='controls'> <input onkeypress='return numbers(event);'  "+isreadonly+"  "+tabindex+" onblur=\""+onblur+"\"  onfocus='this.value = this.value;' type='"+inputtype+"' min ='"+minimum+"' max='"+maximum+"' maxlength='7' data-"+indicatorid+"='0' data-previous_"+indicatorid+"='0'  name='"+indicatorid+"' id='"+indicatorid+"' class='form-control'> </div> </div> </td> ";
            //IndicatorID	Age	IndicatorName	Level	datainputtype	Min	Max	onblur	onkeypress	Class	Required
    
     
     //now do an appending
                 
             }
             row2+=" </tr> ";   
            
            //alert(row2);
             $("#dynamicindicators").html(row2);
            
         $('[data-toggle="popover"]').popover();   
        
    // alert(result[0].IndicatorName);
    });// ned of input field loading
    
    
    //progress bar report section
    

    
         $.getJSON("progressbar.json",function(result){
             var table="";
             var row1="";
             var row2="";
             var count=1;
             for(a=0;a< result.length; a++){
              
            
             var indicatorname=result[a].IndicatorName;    
             var progressbarID=result[a].progressbarID;
             var label=result[a].Age;
             var Commentsid=result[a].Commentsid;            
             var isnewrow=result[a].newrow;
             var datafieldid=result[a].datavalueid;
             var progressbarredgreen =result[a].progressbarredgreen;
             if(progressbarredgreen==='no'){progressbarstoskip.push(progressbarID);}
             
             
             allprogressbar_hiddentext_array.push(datafieldid+"_in");
      
             
             
             if(isnewrow===1)
             {
               
                 row1="";
                 count++;
                 row2+=row1;
             }
             else{
                 
                 row1="";
             }
              if(isnewrow===1 && count===2)//first row
             {
             row2+=" <tr> <td class='col-xs-12'>";
              }
              else  if(isnewrow===1 && count > 2 && count<result.length){
              row2+=" </td> </tr> <tr> <td class='col-xs-12'>";    
                  
              }
              
              
              row2+=" <label> "+indicatorname+" <font color='orange'><b> "+label+" </b> <input data-"+datafieldid+"_in='0' type='hidden' id='"+datafieldid+"_in' /> </font> </label><div class='progress'> <div class='progress-bar progress-bar-info' id='"+progressbarID+"' role='progressbar' aria-valuenow='72' aria-valuemin='0' aria-valuemax='100' style='width: 100%;text-align:left;'> <span  id='"+datafieldid+"' style='color:black;'>No data</span></div>  </div> ";
            //IndicatorID	Age	IndicatorName	Level	datainputtype	Min	Max	onblur	onkeypress	Class	Required
    if(Commentsid!=='')
  {
      allcommentsarray.push(Commentsid);
     row2+="<label>Comments</label><textarea class='form-control' id='"+Commentsid+"'  onkeyup='savecomments(\""+Commentsid+"\");' name='"+Commentsid+"' ></textarea>";
  }
                //now do an appending
                 
             }//end of for loop
             row2+=" </tr> ";   
             row2+=" <tr><td colspan='1'><a id='finishbutton' href='#' style='margin-left: 50%;' onclick='setTimeout(delayedrefresh(),1500);clearcmtsandprcent();' class='btn btn-success btn-lg'>Finish</a></td></tr><tr><td colspan='1'> <div class='alert alert-success' id='message' style='display:none;'><button type='button' class='close' data-dismiss='alert'>×</button><span id='actiondone'></span></div></td></tr> ";   
            
            //alert(row2);
             $("#reportstable").html(row2);
             
    // alert(result[0].IndicatorName);
    });//end of getting json archive
    
    
        
         
  });   //end of checking if document is ready
    
    
}

createdynamicinputs();


function sumofindicators(sourceindicators,destinationindicator){
    var sourceindicatorsarray=sourceindicators.split("@");
  
   
    var destinationelement=destinationindicator;
    var total=0;
    for(b=0;b<sourceindicatorsarray.length;b++){
        //check if there
        if($("#"+sourceindicatorsarray[b]).val()!==''){
      total=parseInt(total)+parseInt($("#"+sourceindicatorsarray[b]).val()); 
        
            $("#"+destinationelement).val(total);
            }
        if(b===(sourceindicatorsarray.length-1)){
        
            yearlytotal(destinationindicator);    
            
        }                                       
        }
                                              
                                             
    
}



//=========================================set targets================================

//function settargets(facilitymfl){
function settargets(){
    
    var cur_enddate=$("#enddate").val();
    var targetyear='2017';
     var receivedvalues=$("#facilityname").val();
    if(cur_enddate!=='' && receivedvalues!==''){
       //call the loader for lastly entered data
       //console.log("facility is_____"+receivedvalues);
       var allfacs=receivedvalues.split("_");
       
       //seachlastcumulative(allfacs[1],cur_enddate);
        //console.log("seachlastcumulative("+allfacs[1]+","+cur_enddate+")");    
        var datearray=cur_enddate.split("-");
        var datekey= cur_enddate.replace(/-/g,""); 
       
        if(parseInt(datearray[1])>=10)
        {
            //the year is curyear plus one
           targetyear=parseInt(datearray[0])+parseInt(1); 
            
        }
        else {
            
          targetyear=parseInt(datearray[0]);  
            
        }
   
    
        console.log("target year is "+targetyear);
        
    
   
    
    var receivedvals=receivedvalues.split("_");
    
  
  var dateobject = new Date();
//var currentyear = dateobject.getFullYear(); 
var targetsfound=0;
  
    targetsdb.get(receivedvals[0]+'_'+targetyear).then(function (doc) {
        
  //doc.age = 4;
 //dat.doc.hiv_pos_target_child
targetsfound=1;
//currently we are dividing a target with 1, meaning we are geting the annual target. 
//depending on user need, we can devide the target with 
var targetdenom=1;
var targetdenom1=doc.weeks;

$("#positive_tg").val(Math.round(parseInt(doc.positive_tg)/parseInt(targetdenom)));
$("#treatment_tg").val(Math.round(parseInt(doc.treatment_tg)/parseInt(targetdenom)));
$("#viralload_tg").val(Math.round(parseInt(doc.viralload_tg)/parseInt(targetdenom)));
                                    
}).catch(function (err){
    
console.log("no data found "+err);

//alert("no targets available for the selected facility and year");

$("#positive_tg").val("");
$("#treatment_tg").val("");
$("#viralload_tg").val("");
    
});   
 //loadallpercents(); 
 }//end of checking if there is a blank  


}







function validateweeklydata(){
    //receive all the fields from the weekly data from
    facility=$("#facilityname").val();
   //No facility name should have an underscore since its a special key
   
//startdate=$("#startdate").val();   
enddate=$("#enddate").val();

counselorname=$("#counsellor").val(); 
modality=$("#modality").val(); 
     
 
tested=$("#tested").val();
positive_tg=$("#positive_tg").val();
positive=$("#positive").val();


linked_here=$("#linked_here").val();
linked_else=$("#linked_else").val();
declined=$("#declined").val();
dead=$("#dead").val();
tca=$("#tca").val();
//viralload_tg=$("#viralload_tg").val();
//viralload=$("#viralload").val();
//viralload_mothers=$("#viralload_mothers").val();

//newart=$("#newart").val();
//newpos_pmtct=$("#newpos_pmtct").val();

//art_pmtct=$("#art_pmtct").val();
    
    //var user=$("#username").val(); 
    var user="hsdsa"; 
    var timestamp = $.now();
    if(user===''){user='hsdsa';}
    
    var syncstatus='No';  
    
     var id=null;
          
     if(facility==='')
     {         
  
   alert('Select facility');
   //$("#facilityname select:first").focus();
   
   $("#facilityname").css('border-color','red');
    //$("select:first").focus();
     }
     
     else if(counselorname===''||counselorname==='select  Counsellor')
     {         
  
   alert('Select Counsellor');
   //$("#facilityname select:first").focus();
   
   $("#counsellor").css('border-color','red');
    //$("select:first").focus();
     }
     
     else if(modality==='')
     {         
  
   alert('Select Modality');
   //$("#facilityname select:first").focus();
   
   $("#modality").css('border-color','red');
    //$("select:first").focus();
     }
     
//     //startdate
//     else if (startdate==='')
//     {
//         
//     alert('Select week begining date');
//   $("#startdate").focus();    
//     }    
   //end date
      else if (enddate==='')
     {
         
     alert('Select Date');
   $("#enddate").focus();    
     } 
     
//      else  if(Date.parse(startdate) > Date.parse(enddate)){
//                    alert("Start date cannot be greater than end date.");   
//                    $("#enddate").focus();  
//                }
     
     //====added 201601==============================
       
    
  
             else if(tested==='')
      {
         
   alert('Enter # Tested');
   $("#tested").focus();    
     
       }
   
          else if(positive==='')
      {
         
   alert('Enter # HIV positive ');
   $("#positive").focus();    
     
       }   
     
//# HIV positive[cumulative]

//        else if(newart==='')
//      {
//         
//   alert('Enter # New on ART');
//   $("#newart").focus();    
//     
//       }
   
          else if(linked_here==='')
      {
         
   alert('Enter # Linked to this facility');
   $("#linked_here").focus();    
     
       } 




      else if(linked_else==='')
      {
         
   alert('Enter # Linked to other facilities');
   $("#linked_else").focus();    
     
       }
       
      else if(declined==='')
      {
         
   alert('Enter # Declined');
   $("#declined").focus();    
     
       }
   
          else if(dead==='')
      {
         
   alert('Enter # Number of Clients who Dead');
   $("#dead").focus();    
     
       }

//# TARGET NEW ON ART
 else if(tca==='')
      {
         
   alert('Enter # To come again');
   $("#tca").focus();    
     
       }
   
//          else if(newpos_pmtct==='')
//      {
//         
//   alert('Enter # PMTCT new Positive');
//   $("#newpos_pmtct").focus();    
//     
//       }


//STARTED ON ART

// else if(art_pmtct==='')
//      {
//         
//   alert('Enter # PMTCT started on ART');
//   $("#art_pmtct").focus();    
//     
//       }
   
//          else if(viralload==='')
//      {
//         
//   alert('Enter #  Viralload done');
//   $("#viralload").focus();    
//     
//       }
//          else if(viralload_mothers==='')
//      {
//         
//   alert('Enter #  Viralload done for mothers');
//   $("#viralload_mothers").focus();    
//     
//       }
       
//       else if(parseInt(positive) > parseInt(tested)){
//       alert('# positive ('+positive+') cannot be greater than # tested ('+tested+')');
//   $("#positive").focus();      
//           
//           
//       }
//  else if(parseInt(positive) < parseInt(newart)){
//       alert('# New on ART should be less than # Total positives');
//   $("#newart").focus();      
//           
//           
//       }
       
//  else if(parseInt(positive) < parseInt(newpos_pmtct)){
//       alert('# PMTCT new positive cannot be greater than # Total positives');
//   $("#newpos_pmtct").focus();      
//           
//           
//       }
       
   

else if((parseInt(tca)+ parseInt(dead)+ parseInt(declined)+ parseInt(linked_else)+ parseInt(linked_here))!==parseInt(positive)){
       alert('# Total positives should be equal to the sum of TCA , Dead , Declined , Linked in this facility , linked to other facility');
   $("#positive").focus();      
            
    
    
}

       
       
       else {
     var facilitynameandmfl=facility.split("_");        
    // var startd=startdate.replace('-','');      
    // var startd=startd.replace('-','');      
     var endd=enddate.replace('-','');      
     var endd=endd.replace('-',''); 
     var cns=counselorname.replace('-','');
     var mod=modality.replace('-','');
     
      id=facilitynameandmfl[0]+"_"+endd+"_"+cns+"_"+mod;
      //this should not be cleared
      $("#rowid").val(id);
      
     var facilityname=facilitynameandmfl[1];
            //save data to the db
            //we are now saving both weekly totals and annual cumulatives on the db
            //add a variable to distinguish the two
            //use _wk
            
  insertdailydata(id,facilitynameandmfl[1],enddate,counselorname,modality,tested,positive_tg,positive,linked_here,linked_else,declined,dead,tca,timestamp,user, syncstatus) ;
  console.log(id+" @ "+facilitynameandmfl[1]+" @ "+counselorname+" @ "+modality+" @"+enddate+" @ "+ tested+" @ "+positive_tg+" @ "+positive+" @ "+linked_here+" @ "+linked_else+" @ "+declined+" @ "+dead+" @ "+tca+" @ "+timestamp+" @ "+user+" @ "+ syncstatus) ;



 //selectsearchdata();
$("#message").show();
$("#actiondone").html("Data Saved Successfully");
//call the function that loads entered data
//$("#message").hide().delay(800).fade(400);


console.log('daily data entered');
//open reports tab
 //$('#reportsbutton').click();
 //$('#inpatient_uptake_cmts').focus();
 
setTimeout(delayedrefresh,1500);
 // delayedrefresh
 //delayedrefresh();
       }
       
    
}


function clickreportstab(){
   
 $('#reportsbutton').click();
}


//===========================================EMPTY WEEKLY DATA FIELDS AFTER INSERT============================================================

function cleardailyfields()
{
   // $("#facilityname").val("");
   //No facility name should have an underscore since its a special key
   
//$("#startdate").val("");   
$("#enddate").val("");
$("#modality").val("");
$("#counsellor").val("");

for(b=0;b<allindicatorsarray.length;b++){
    
  $("#"+allindicatorsarray[b]).val("");  
    
} 

//clear data values

//for(b=0;b<allnontargetindicatorsarray.length;b++){
//    
//  $("#"+allnontargetindicatorsarray[b]).attr("data-previous_"+allnontargetindicatorsarray[b],"0");  
//  $("#"+allnontargetindicatorsarray[b]).attr("data-"+allnontargetindicatorsarray[b],"0");  
//    
//} 

    
}

function clearcmtsandprcent(){
    
   clearcommentsonly();
   clearpercentsonly();
    
}

function clearpercentsonly(){
       //clear progress bar hidden fields too
   
  for(b=0;b<allprogressbar_hiddentext_array.length;b++){
    
  $("#"+allprogressbar_hiddentext_array[b]).val("");  
    
}  
    
}


function clearcommentsonly(){
    
        
       //comnts
 
     for(b=0;b<allcommentsarray.length;b++){
    
  $("#"+allcommentsarray[b]).val("");  
    
                                            }//end of for loop 
    
}



var dbdata="";
var dbdata1="";

//===================================================VIEW WEEKLY DATA============================================================
//a function to select a few search data that should appear in a data table
function selectsearchdata()
{
    
    
    
    //rread from weekly data db
    

  
    
  dailydatadb.allDocs({include_docs: true, ascending: true}).then( function(doc) { 
 
     
	   //console.log(doc);
	   for(b=0;b<doc.total_rows;b++)
           {
             
               var dat={};
               dat=doc.rows[b];
               
                 var myid=dat.doc._id;
               if(myid.indexOf("annual")===-1){
	   
	       
	      //console.log(dat.doc.facility);
              //how to reference each column 
              //alert(dat.doc.startdate);
              //dat.doc._id
              var statusicon="<i class='glyphicon glyphicon-cloud-upload' style='color:red;' title='data not exported'></i>*";
              if(dat.doc.syncstatus==="Yes"){
                 statusicon=""; 
                  
               }
	     
		 //dbdata+="<tr><td> "+dat.doc.startdate+" </td><td>"+dat.doc.syncstatus+"</td><td>"+dat.doc.facility+"</td><td><button class='btn-info' onclick='loadsaveddailydata(\""+dat.doc._id+"\",\""+dat.doc.facility+"\")'>Edit</button></td></tr>";
		 dbdata+="<tr id=\""+dat.doc._id+"\"><td> "+dat.doc.enddate+" </td><td><b>"+dat.doc.facility+"</b> <i>("+dat.doc.modality+")</i> done by "+dat.doc.counselorname+" </td><td><button class='btn-info' onclick='loadsaveddailydata(\""+dat.doc._id+"\",\""+dat.doc.facility+"\",\"no\")'>Edit "+statusicon+"</button></td></tr>";
          	    
                  }
            } //end of for loop
                    
	appendtabledata(dbdata);
			
  }).catch(function (err){console.log(err)});
    

    
    
    
    
    
    
    //read data from the db
    
  	  
    
    
}



function selectconsdata()
{
    
    
    
    //rread from weekly data db
    

  
    
  userdb.allDocs({include_docs: true, ascending: true}).then( function(doc) { 
 
     
	   //console.log(doc);
	   for(b=0;b<doc.total_rows;b++)
           {
             
               var dat={};
               dat=doc.rows[b];
               
                 var myid=dat.doc._id;
               if(myid.indexOf("annual")===-1){
	   
	       
	      //console.log(dat.doc.facility);
              //how to reference each column 
              //alert(dat.doc.startdate);
              //dat.doc._id
              var statusicon="<i class='glyphicon glyphicon-cloud-upload' style='color:red;' title='data not exported'></i>*";
              if(dat.doc.syncstatus==="Yes"){
                 statusicon=""; 
                  
               }
	     var fc=dat.doc.cfacil;
             var fcar=fc.split("_");
             
		 //dbdata+="<tr><td> "+dat.doc.startdate+" </td><td>"+dat.doc.syncstatus+"</td><td>"+dat.doc.facility+"</td><td><button class='btn-info' onclick='loadsaveddailydata(\""+dat.doc._id+"\",\""+dat.doc.facility+"\")'>Edit</button></td></tr>";
		 dbdata1+="<tr id=\""+dat.doc._id+"\"><td> "+fcar[1]+" </td><td>"+dat.doc.cname+"</td></tr>";
          	    
                  }
            } //end of for loop
                    
	appendtablecounsellordata(dbdata1);
			
  }).catch(function (err){console.log(err)});
    

    
    
    
    
    
    
    //read data from the db
    
  	  
    
    
}



selectconsdata();



//--------------------------------------------------------------------------------------------------------------------------------
//
function appendtablecounsellordata( dbdata1 ){
    
     $("#searchtabledivcns").html("<table id='searchtablecns' class='table table-striped table-bordered'><thead><tr><th style='width:50%;'>Facility</th><th style='width:50%;'>Counsellor Name</th></tr></thead><tbody>"+dbdata1+"</tbody></table>");
         
	   $(document).ready(function() {
                
         /* $('#searchtable').DataTable({              
              "autoWidth": true,
              "paging": true,
              "pagingType": "full",
              "lengthChange": false,  "order": [[0,'desc']]                    
          }).makeEditable({sDeleteURL: "js/deleterecords.js"});
          **/
          //new code
          
     
    var table2 = $('#searchtablecns').DataTable({"autoWidth": true,
              "paging": true,
              "pagingType": "full",
              "lengthChange": false,  
              "order": [[0,'desc']]});
 
    $('#searchtablecns tbody').on( 'click', 'tr', function () {
        if ($(this).hasClass('selected') ) {
            $(this).removeClass('selected');
             $('#btnDeleteRow').hide();  
        }
        else {
            table2.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
           $('#btnDeleteRow').show();  
            }
    } );
 
    $('#btnDeleteRow').click( function () {
       
     var tablerowid1=table2.$('tr.selected').attr('id');
      
        
        if(ConfirmDeletecns()===true){
        
        deletecnsdata(tablerowid1);
        
        table2.row('.selected').remove().draw( false );
    }
        //call the delete function now
    } );

          
          
          
          
            
                                     } ); 
    
                                                          }
                                                          
                                                         // appendtablecounsellordata( dbdata1 );
                                                          
//
//
//--------------------------------------------------------------------------------------------------------------------------------



//call the function that displays the data

function appendtabledata( dbdata ){
    
     $("#searchtablediv").html("<table id='searchtable' class='table table-striped table-bordered'><thead><tr><th style='width:30%;'>Date</th><th style='width:50%;'>Facility, Modality , Counsellor</th><th style='width:20%;'>Edit</th></tr></thead><tbody>"+dbdata+"</tbody></table>");
         
	   $(document).ready(function() {
                
         /* $('#searchtable').DataTable({              
              "autoWidth": true,
              "paging": true,
              "pagingType": "full",
              "lengthChange": false,  "order": [[0,'desc']]                    
          }).makeEditable({sDeleteURL: "js/deleterecords.js"});
          **/
          //new code
          
     
    var table = $('#searchtable').DataTable({"autoWidth": true,
              "paging": true,
              "pagingType": "full",
              "lengthChange": false,  
              "order": [[0,'desc']]});
 
    $('#searchtable tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
             $('#btnDeleteRow').hide();
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
             $('#btnDeleteRow').show();
        }
    } );
 
    $('#btnDeleteRow').click( function () {
        
     var tablerowid=table.$('tr.selected').attr('id');
        
        if(ConfirmDelete()===true){
        
        deletedata(tablerowid);
        
        table.row('.selected').remove().draw( false );
    }
        //call the delete function now
    } );

          
          
          
          
            
                                     } ); 
    
                                                          }

 selectsearchdata();

function showreports(){
    
     $("#reportsbutton").show();
}


function loadsaveddailydata(id,facility,openreportstab ){
    $("#reportsbutton").show();
    
  //  alert(id);
 //load from weekly db where id is as selected   
  var mflanddates=id.split('_');
        	
	dailydatadb.get(id).then(function (doc) {
    var rowid=id;    
    //populate div with respective content
    $("#rowid").val(id);
    
    
    
    $("#facilityname").val(mflanddates[0]+"_"+facility);
    //$('select#facilityname').find("option[value='"+mflanddates[0]+"_"+facility+"']").prop('selected', true); 
     //$("#startdate").val(doc.startdate);   
     $("#enddate").val(doc.enddate); 
     $("#counsellor").val(doc.counselorname); 
     $("#modality").val(doc.modality); 
     
      //seachlastcumulative(facility,doc.enddate);  

 $("#tested").val(doc.tested);
 $("#positive_tg").val(doc.positive_tg);
 $("#positive").val(doc.positive);
 //$("#newart").val(doc.newart);
 //$("#treatment_tg").val(doc.treatment_tg);
 $("#linked_here").val(doc.linked_here);
 $("#linked_else").val(doc.linked_else);
 $("#declined").val(doc.declined);
 $("#dead").val(doc.dead);
 $("#tca").val(doc.tca);
// $("#newpos_pmtct").val(doc.newpos_pmtct);
// $("#art_pmtct").val(doc.art_pmtct);
// $("#viralload_tg").val(doc.viralload_tg);
// $("#viralload").val(doc.viralload);
// $("#viralload_mothers").val(doc.viralload_mothers);
   
     $('#facilityname').select2(); 
     $('#counsellor').select2(); 
     //load all percentages
    // loadallpercents();
     //==========LOAD COMMENTS HERE ALSO=======

    
     //do the vice versa on saving the edited fields
    
        //$(".editdata").show();
     $("#savebutton").hide();
     
     $("#updatebutton").show();
     //$("#savenewbutton").show();
      checkids();
      
 $('#newdatabutton').html("<i class='glyphicon glyphicon-edit'></i>Edit Data");

  //if this is a request to show the unentered comments
  //open the reports tab and focus on the first unentered comment
    if(openreportstab.indexOf("yes")!==-1){
        
      var contentarray=openreportstab.split("@"); 
      //alert(contentarray[1]);
     
      clickreportstab();
 //     document.getElementById(contentarray[1]).focus();
 $("#"+contentarray[1]).focus();
               }
               else {
                $('#newdatabutton').click();    
                   
               }
  
});

 selectwidth();
}

$("#refreshpage" ).click(function() 
{
    window.location.reload();
    cleardailyfields();
   
});

$("#refr" ).click(function() 
{
    window.location.reload();
   // cleardailyfields();
});


$("#refr1" ).click(function() 
{
    window.location.reload();
   // cleardailyfields();
});

function delayedrefresh()
{
      window.location.reload();
    cleardailyfields();
}


function updateweeklydata()
{
 //this id will be used to update the entered data
   var id=$("#rowid").val();
   
  // var annualid=id.replace(/weekly/g,"annual");
   
           //receive all the fields from the weekly data from
    facility=$("#facilityname").val();
    counselorname=$("#counsellor").val();
    modality=$("#modality").val();
   //No facility name should have an underscore since its a special key
   
//startdate=$("#startdate").val();   
enddate=$("#enddate").val();
     
        
tested=$("#tested").val();
positive_tg=$("#positive_tg").val();
positive=$("#positive").val();
//newart=$("#newart").val();
//treatment_tg=$("#treatment_tg").val();
linked_here=$("#linked_here").val();
linked_else=$("#linked_else").val();
declined=$("#declined").val();
dead=$("#dead").val();
tca=$("#tca").val();
//newpos_pmtct=$("#newpos_pmtct").val();
//art_pmtct=$("#art_pmtct").val();
//viralload_tg=$("#viralload_tg").val();
//viralload=$("#viralload").val();
//viralload_mothers=$("#viralload_mothers").val();


        //viral_load_done_child_w=$("#viral_load_done_child").attr("data-viral_load_done_child");
    //alert(Date.parse(startdate));
    
   // var user=$("#username").val(); 
    var user="hsdsa"; 
    var timestamp = $.now();
    if(user===''){user='hsdsa';}
    
    var syncstatus='No';  
    
  
          
     if(facility==='')
     {         
  
   alert('Select facility');
   //$("#facilityname").focus();
   
     }
     
     
     else if(counselorname===''|| counselorname==='select  Counsellor')
     {         
  
   alert('Select Counsellor');
   //$("#facilityname select:first").focus();
   
   $("#counsellor").css('border-color','red');
    //$("select:first").focus();
     }
     
     else if(modality==='')
     {         
  
   alert('Select Modality');
   //$("#facilityname select:first").focus();
   
   $("#modality").css('border-color','red');
    //$("select:first").focus();
     }
     
     
     
//     //startdate
//     else if (startdate==='')
//     {
//         
//     alert('Select week begining date');
//   $("#startdate").focus();    
//     }    
   //end date
      else if (enddate==='')
     {
         
     alert('Select  date');
   $("#enddate").focus();    
     }
//      else  if(Date.parse(startdate) > Date.parse(enddate)){
//                    alert("Start date cannot be greater than end date.");   
//                    $("#enddate").focus();  
//                }
      //inpatient_adm  
         
     
     
             else if(tested==='')
      {
         
   alert('Enter # Tested');
   $("#tested").focus();    
     
       }
   
          else if(positive==='')
      {
         
   alert('Enter # HIV positive ');
   $("#positive").focus();    
     
       }   
     
//# HIV positive[cumulative]

//        else if(newart==='')
//      {
//         
//   alert('Enter # New on ART');
//   $("#newart").focus();    
//     
//       }
   
          else if(linked_here==='')
      {
         
   alert('Enter # Linked to this facility');
   $("#linked_here").focus();    
     
       } 




      else if(linked_else==='')
      {
         
   alert('Enter # Linked to other facilities');
   $("#linked_else").focus();    
     
       }
       
      else if(declined==='')
      {
         
   alert('Enter # Declined');
   $("#declined").focus();    
     
       }
   
          else if(dead==='')
      {
         
   alert('Enter # Number of Clients who Dead');
   $("#dead").focus();    
     
       }

//# TARGET NEW ON ART
 else if(tca==='')
      {
         
   alert('Enter # To come again');
   $("#tca").focus();    
     
       }
   
//          else if(newpos_pmtct==='')
//      {
//         
//   alert('Enter # PMTCT new Positive');
//   $("#newpos_pmtct").focus();    
//     
//       }

//
////STARTED ON ART
//
// else if(art_pmtct==='')
//      {
//         
//   alert('Enter # PMTCT started on ART');
//   $("#art_pmtct").focus();    
//     
//       }
   
//          else if(viralload==='')
//      {
//         
//   alert('Enter #  Viralload done');
//   $("#viralload").focus();    
//     
//       }
//          else if(viralload_mothers==='')
//      {
//         
//   alert('Enter #  Viralload done for mothers');
//   $("#viralload_mothers").focus();    
//     
//       }
       
//       else if(parseInt(positive) > parseInt(tested)){
//       alert('# positive ('+positive+') cannot be greater than # tested ('+tested+')');
//   $("#positive").focus();      
//           
//           
//       }
//  else if(parseInt(positive) < parseInt(newart)){
//       alert('# New on ART should be less than # Total positives');
//   $("#newart").focus();      
//           
//           
//       }
       
//  else if(parseInt(positive) < parseInt(newpos_pmtct)){
//       alert('# PMTCT new positive cannot be greater than # Total positives');
//   $("#newpos_pmtct").focus();      
//           
//           
//       }
       
   

else if((parseInt(tca)+ parseInt(dead)+ parseInt(declined)+ parseInt(linked_else)+ parseInt(linked_here))!==parseInt(positive)){
       alert('# Total positives should be equal to the sum of TCA , Dead , Declined , Linked in this facility , linked to other facility');
   $("#positive").focus();      
            
    
    
}

       
  
        
        
   //====added 201601==============================
       
    
       
       else {
           
     var facilitynameandmfl=facility.split("_");        
    // var startd=startdate.replace('-','');      
     //var startd=startd.replace('-','');      
     var endd=enddate.replace('-','');      
     var endd=endd.replace('-','');      
     var cns=counselorname.replace('-','');      
     var mod=modality.replace('-','');      
         
     var facilityname=facilitynameandmfl[1];
            //save data to the db
  saveweeklyupdates(id,facilitynameandmfl[1],enddate,counselorname,modality, tested,positive_tg,positive,linked_here,linked_else,declined,dead,tca,timestamp,user, syncstatus) ;
        

//call refressh code here

 //selectsearchdata();
$("#message").show();
$("#actiondone").html("Data Updated Successfully");
//call the function that loads entered data

console.log('weekly data updated');

//$('#reportsbutton').click();
//$('#inpatient_uptake_cmts').focus();
setTimeout(delayedrefresh,1800);
//delayedrefresh();
       }
       
    
}
   
function saveweeklyupdates(id,facility,enddate,counselorname,modality, tested,positive_tg,positive,linked_here,linked_else,declined,dead,tca,timestamp,user, syncstatus) {
 
 
 
 
 dailydatadb.get(id).then(function (doc) {
        
  //doc.age = 4;
 //alert(id);
   if(id!=='null' && id!=='' ){
        //doc._id=id;
        doc.facility=facility;
       // doc.startdate=startdate;
	doc.enddate=enddate;
        
	doc.counselorname=counselorname;
	doc.modality=modality;
        
	doc.tested=tested;
	doc.positive_tg=positive_tg;
	doc.positive=positive;
	//doc.newart=newart;
	//doc.treatment_tg=treatment_tg;
	doc.linked_here=linked_here;
	doc.linked_else=linked_else;
	doc.declined=declined;
	doc.dead=dead;
	doc.tca=tca;
	//doc.newpos_pmtct=newpos_pmtct;
	//doc.art_pmtct=art_pmtct;
	//doc.viralload_tg=viralload_tg;
	//doc.viralload=viralload;
	//doc.viralload_mothers=viralload_mothers;
            
        doc.timestamp=timestamp;
        doc.user=user;
        doc.syncstatus=syncstatus; 
   //alert('called');
  // put them back
  return dailydatadb.put(doc);
   }
});
 
 
} 
    
  
//==================function to import data

// $('#exportbutton').on('click',function() {
    $("#exportbutton").prop("disabled",false);
     $(this).removeClass('btn-lg btn-default').addClass('btn btn-success');
//});

var syncstatusarray=[];
function importdata(){
    
   // $('#exportbutton').on('click',function() {
    $("#exportbutton").prop("disabled",true);
    $("#exportbutton").removeClass('btn-lg btn-success').addClass('btn btn-default');

                //read db files that have not been synced
    
  $("#exportbutton").hide();
  $("#exportmsg").show();
   $("#exportresponse").append("<b><font color='orange'>Exporting data.. please wait response.</b><br/>");
  
  dailydatadb.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 syncstatusarray=[];
      //read where sync is 0
	   var skipexporting=0;
	   for(c=0;c<doc.total_rows;c++){
               $("#exportbutton").hide();
               $("#exportmsg").show();
               //a variable to check if all comments are added for percents below 80 percent and not amongest the indicators that can be skipped.
             
            var missingcomment="";
	   var dat={};
	   dat=doc.rows[c];
	     // console.log(dat.doc.facility);
              //how to reference each column 
              
              var idyangu=dat.doc._id;
		  var num=parseInt(c)-1;
	var missingcommentid="";
        if(dat.doc.syncstatus==="No" || dat.doc.syncstatus==="0" || dat.doc.syncstatus==="no")
                        {
//            //now do an export via ajax
//            console.log(" Exporting data for "+dat.doc.facility+" percent="+dat.doc._id+"*  and comments ="+dat.doc.eid_done_cmts+"*");
//            //
//          // if(((parseInt(dat.doc.hiv_pos_care_perc_child)< 90 && parseInt(dat.doc.hiv_pos_care_perc_child)!==0 && dat.doc.hiv_pos_care_perc_child!=="" ) || (parseInt(dat.doc.hiv_pos_care_perc_adult)< 90 && parseInt(dat.doc.hiv_pos_care_perc_all)!==0 && dat.doc.hiv_pos_care_perc_all!=="" )|| (parseInt(dat.doc.hiv_pos_care_perc_all)< 90 && parseInt(dat.doc.hiv_pos_care_perc_child)!==0 && dat.doc.hiv_pos_care_perc_child!=="" )) && dat.doc.hiv_pos_care_cmts==="" ){missingcommentid="@hiv_pos_care_cmts";skipexporting++; missingcomment+="percentage HIV positive enrolled on care <br/>";}
//           if((  (parseInt(dat.doc.hiv_pos_care_perc_all)< 90 && parseInt(dat.doc.hiv_pos_care_perc_child)!==0 && dat.doc.hiv_pos_care_perc_child!=="" )) && dat.doc.hiv_pos_care_cmts==="" ){missingcommentid="@hiv_pos_care_cmts";skipexporting++; missingcomment+="percentage HIV positive enrolled on care <br/>";}
//            //else if(( (parseInt(dat.doc.started_art_perc_child)< 90 && parseInt(dat.doc.started_art_perc_child)!==0 && dat.doc.started_art_perc_child!=="" ) || (parseInt(dat.doc.started_art_perc_adult)< 90 && parseInt(dat.doc.started_art_perc_adult)!==0 && dat.doc.started_art_perc_adult!=="" ) || ( parseInt(dat.doc.started_art_perc_all)< 90 && parseInt(dat.doc.started_art_perc_all)!==0 && dat.doc.started_art_perc_all!=="" ) ) && dat.doc.started_art_cmts==="" ){missingcommentid="@started_art_cmts";skipexporting++; missingcomment+="percentage of target started on ART <br/>";}
//            else if(( ( parseInt(dat.doc.started_art_perc_all)< 90 && parseInt(dat.doc.started_art_perc_all)!==0 && dat.doc.started_art_perc_all!=="" ) ) && dat.doc.started_art_cmts==="" ){missingcommentid="@started_art_cmts";skipexporting++; missingcomment+="percentage of target started on ART <br/>";}
//           // else if(( (parseInt(dat.doc.viral_test_perc_child)< 90  && parseInt(dat.doc.viral_test_perc_child)!==0 && dat.doc.viral_test_perc_child!=="" ) || ( parseInt(dat.doc.viral_test_perc_adult)< 90 && parseInt(dat.doc.viral_test_perc_adult)!==0 && dat.doc.viral_test_perc_adult!=="" ) || ( parseInt(dat.doc.viral_test_perc_all)< 90 &&  parseInt(dat.doc.viral_test_perc_all)!==0 && dat.doc.viral_test_perc_all!==""  ) ) && dat.doc.viral_test_cmts==="" ){missingcommentid="@viral_test_cmts";skipexporting++; missingcomment+="percentage viral load tests done against target <br/>";}
//            else if(( ( parseInt(dat.doc.viral_test_perc_all)< 90 &&  parseInt(dat.doc.viral_test_perc_all)!==0 && dat.doc.viral_test_perc_all!==""  ) ) && dat.doc.viral_test_cmts==="" ){missingcommentid="@viral_test_cmts";skipexporting++; missingcomment+="percentage viral load tests done against target <br/>";}
//            //else if(( (parseInt(dat.doc.ipt_done_perc_child)< 90 &&  parseInt(dat.doc.ipt_done_perc_child)!==0 && dat.doc.ipt_done_perc_child!=="" ) || ( parseInt(dat.doc.ipt_done_perc_adult)< 90 &&  parseInt(dat.doc.ipt_done_perc_adult)!==0 && dat.doc.ipt_done_perc_adult!=="" ) || ( parseInt(dat.doc.ipt_done_perc_all)< 90 &&  parseInt(dat.doc.ipt_done_perc_all)!==0 && dat.doc.ipt_done_perc_all!=="" )) && dat.doc.ipt_done_cmts==="" ){missingcommentid="@ipt_done_cmts";skipexporting++; missingcomment+="percentage IPT done against target <br/>";}
//            else if((   ( parseInt(dat.doc.ipt_done_perc_all)< 90 &&  parseInt(dat.doc.ipt_done_perc_all)!==0 && dat.doc.ipt_done_perc_all!=="" )) && dat.doc.ipt_done_cmts==="" ){missingcommentid="@ipt_done_cmts";skipexporting++; missingcomment+="percentage IPT done against target <br/>";}
//           // else if(( (parseInt(dat.doc.tested_perc_child)< 90 &&  parseInt(dat.doc.tested_perc_child)!==0 && dat.doc.tested_perc_child!=="" )|| ( parseInt(dat.doc.tested_perc_adult)< 90 &&  parseInt(dat.doc.tested_perc_adult)!==0 && dat.doc.tested_perc_adult!==""  ) || ( parseInt(dat.doc.tested_perc_all)< 90 &&  parseInt(dat.doc.tested_perc_all)!==0 && dat.doc.tested_perc_all!=="" ) ) && dat.doc.tested_cmts==="" ){missingcommentid="@tested_cmts"; skipexporting++; missingcomment+="percentage Tested against target <br/> ";}
//            else if(( ( parseInt(dat.doc.tested_perc_all)< 90 &&  parseInt(dat.doc.tested_perc_all)!==0 && dat.doc.tested_perc_all!=="" ) ) && dat.doc.tested_cmts==="" ){missingcommentid="@tested_cmts"; skipexporting++; missingcomment+="percentage Tested against target <br/> ";}
//            //else if(  (parseInt(dat.doc.eid_done_perc)< 90 &&  parseInt(dat.doc.eid_done_perc)!==0 && dat.doc.tested_perc_child!=="" ) && dat.doc.eid_done_cmts==="" ){missingcommentid="@eid_done_cmts";skipexporting++; missingcomment+="percentage EID done test done against target <br/>";}
//            else if(  (parseInt(dat.doc.eid_done_perc)< 90 &&  parseInt(dat.doc.eid_done_perc)!==0 && dat.doc.tested_perc_child!=="" ) && dat.doc.eid_done_cmts==="" ){missingcommentid="@eid_done_cmts";skipexporting++; missingcomment+="percentage EID done test done against target <br/>";}
//           // else if( (parseInt(dat.doc.viral_load_mothers_perc)< 90 &&  parseInt(dat.doc.viral_load_mothers_perc)!==0 && dat.doc.viral_load_mothers_perc!=="" ) && dat.doc.viral_load_mothers_cmts==="" ){ missingcommentid="@viral_load_mothers_cmts"; skipexporting++; missingcomment=+"percentage viral load tests done for mothers against target <br/>";}
//            //else if( (parseInt(dat.doc.viral_load_mothers_perc)< 90 &&  parseInt(dat.doc.viral_load_mothers_perc)!==0 && dat.doc.viral_load_mothers_perc!=="" ) && dat.doc.viral_load_mothers_cmts==="" ){ missingcommentid="@viral_load_mothers_cmts"; skipexporting++; missingcomment=+"percentage viral load tests done for mothers against target <br/>";}
//            else {skipexporting=0;}
           
              var hrf=" <button class='btn-sm button-info' data-dismiss='modal' onclick=\"loadsaveddailydata('"+dat.doc._id+"','"+dat.doc.facility+"','no"+missingcommentid+"'); \"> Enter Comments</button>";
           

        
        if(skipexporting===0){
            
            updatesyncstatus(dat.doc._id);
        
        
            
             $.ajax({
                         url:hostname+':8080/hsdsarri/importweeklydata',                            
                        type:'post', 
data:{id:dat.doc._id,
facilityname:dat.doc.facility,
//startdate:dat.doc.startdate,
enddate:dat.doc.enddate,
counselor:dat.doc.counselorname,
modality:dat.doc.modality,

tested:dat.doc.tested,        
positive_tg:dat.doc.positive_tg,        
positive:dat.doc.positive,        
//newart:dat.doc.newart,        
//treatment_tg:dat.doc.treatment_tg,        
linked_here:dat.doc.linked_here,        
linked_else:dat.doc.linked_else,        
declined:dat.doc.declined,        
dead:dat.doc.dead,        
tca:dat.doc.tca,        
//newpos_pmtct:dat.doc.newpos_pmtct,        
//art_pmtct:dat.doc.art_pmtct,        
//viralload_tg:dat.doc.viralload_tg,        
//viralload:dat.doc.viralload,        
//viralload_mothers:dat.doc.viralload_mothers,        
            
          timestamp:dat.doc.timestamp,
          user:dat.doc.user },
          dataType: 'html',  
                    success: function(data) {
                       
                       
                       
                        $("#exportresponse").append("<b>*"+data+'</b><br/>');
                         
                if(c===parseInt(doc.total_rows)){
                  //$("#exportbutton").show();
                 //$("#exportmsg").hide();
                 //$("#exportresponse").append("<b><font color='orange'>Exporting Completed.</b>");
  
                      }
                         
                   //doc.syncstatus="Yes"; 
   //alert('called');
  // put them back
                   // return dailydatadb.put(doc);   
        
                                        }
                        
                         });
            
                        }//end of if skipp exporting === 0
                        //for annual exports, dont sync and dont show alert
                        else if (skipexporting!==0 && idyangu.indexOf("annual")>=0) {
                       //dont show export failure message     
                            
                        }
            else {
                
                
                $("#exportresponse").append("<br/><b>NOTE:</b><font color='red'> Data for <b>"+dat.doc.facility+"</b> not uploaded due to missing comment(s) on section <b><i>"+missingcomment+"</i></b></font> "+hrf+" <br/>");
            }
                        }
        
                 
                 
                 //if its last loop show
                 
           
                  
             
            
          	    } //end of for loop
	 
	
		
  }).then(function (){
     // alert('export complete');
     
           // if(c===parseInt(doc.total_rows)){
                
              // for(var s=0;s<syncstatusarray.length;s++){
//                    
               //  updatesyncstatus(syncstatusarray[s]);
                
          // }
     
  }).catch(function (err){ console.log(err); });
          
  //$("#exportbutton").show();
  //$("#exportmsg").hide();	
   //refresh number of uninmported sites.
   //unsynceddata()
        
        
}



function updatesyncstatus(id){
  
dailydatadb.get(id).then(function (doc1) {
      console.log(id+" sync status updated");
 doc1.syncstatus='Yes';
 return dailydatadb.put(doc1);
 
});

	
    
}//end of function





function unsynceddata(){
    
    
    dailydatadb.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 
          
      //read where sync is 0
	  var cnt1=0;
	   for(c=0;c<doc.total_rows;c++){
               
                var dat={};
	   dat=doc.rows[c];
           var cid=dat.doc._id;
               if((dat.doc.syncstatus==="No"||dat.doc.syncstatus==="0"||dat.doc.syncstatus==="no") && cid.indexOf("_annual")===-1 )
                        {
                            
                         cnt1++;   
                            
                        }
               var displaytext=cnt1+" records";
               if(cnt1===1){
                   
                    displaytext=cnt1+" record";
               }
              
          	                    } //end of for loop
	 
	$("#unexportedno").html("<br/>( "+displaytext+" )");
        if(cnt1>0){
            $("#exportdataanchor1").show();
            $("#exportdataanchor2").show();
            
        }
		
  }).catch(function (err){console.log(err)});
          
  //$("#exportbutton").show();
  //$("#exportmsg").hide();	
    
    
    
}//end of function


unsynceddata();


function closeapp() 
{
      //navigator.app.exitApp();   // Closes the new window
}


</script>
<script>


//========================================201605 custom percentage calculator======================================


function fillprogressbar(denominator_is_value,numer,denomin,progressbarid,datavalueid,cmts){
    
        //console.log(datavalueid+" "+datavalueid.indexOf("adult"));
       // console.log(" "+cmts);
  //Date : 12th Oct 2016 
  //Change: show a default  of weekly performance for users.
  //however, submit the annual and weekly percentage
  //devide the annual  target with 52
        var applycoloronbar="yes";
        
        for(a=0;a<progressbarstoskip.length;a++){
            
            if(progressbarstoskip[a]===progressbarid){
                
                
                applycoloronbar="no";
            }
        }
     //for weekly performance, we were using input values but for annual we are using data-previous attribute   
    var weeklynumerator=$("#"+numer).val();//since we have weekly values on input field and annual cumulatives as data attributes fields
    var annualdenominator=$("#"+denomin).val();//since we have annual targets as values on input fields and not weekly targets
    
    var weeklydenominator="";//may be a value for a certain indicator or a predetermined target 
    
    var annualnumerator=$("#"+numer).attr("data-"+numer);// numerator for the whole year is the current number enterd plus total for previous year
    //var denominator=$("#"+denomin).val();
     
     if(denominator_is_value!=='yes'){
       //this section was meant to be used in annual performance calculator. for cases where the denom is  a value for another indic e.g no positive/ no tested  
       annualdenominator=$("#"+denomin).attr("data-"+denomin);
       //this denominator should not be devide by weeks/quartes/months 
       weeklydenominator=$("#"+denomin).val();
     }
     else {
         //devide target with number of weeks/quarters/months in a year
         if(annualdenominator!==''){
         
         if(annualdenominator<=52 ){ annualdenominator=52;} //to avoid geting decimal points targets
        weeklydenominator=Math.round(parseInt(annualdenominator)/52);
        
         }
         
          }
    
      if(weeklydenominator!==''&&weeklynumerator!==''){  
    //console.log(denomin+" "+denominator);
    //console.log(numer+" "+numerator);
    var numeratordenominatorvalues=weeklynumerator+"/"+weeklydenominator;
    //var numeratordenominatorvalues=weeklynumerator+"/"+weeklydenominator;
    var weeklyperc="0";
    var annualperc="0";
    //weekly percentage
    if(weeklydenominator==='0'){
        
        weeklyperc=0;
        
                        }
    else if(weeklydenominator===''|| weeklynumerator===''){
        
        weeklyperc=0;
    }
    else {
        
        weeklyperc=Math.round((parseInt(weeklynumerator)/parseInt(weeklydenominator))*100);
       
    }
    
    
    //annual percentage
    
     if(annualdenominator==='0'){
        
        annualperc=0;
        
                        }
    else if(annualdenominator===''|| annualnumerator===''){
        
        annualperc=0;
    }
    else {
        
        annualperc=Math.round((parseInt(annualnumerator)/parseInt(annualdenominator))*100);
        
      
    }
    console.log("Annual Percentage "+annualperc);
    //call save percents
     savepercents(weeklyperc,annualperc,datavalueid);
    //edit graph for display
    //if den and num are not blanks
    if(weeklynumerator!=='' && weeklydenominator!=='')
    {
    $("#"+progressbarid).width(weeklyperc+'%');
    $("#"+datavalueid).html(numeratordenominatorvalues+" = ("+weeklyperc+"%)");
    $("#"+datavalueid+"_in").val(weeklyperc);
    
    if(applycoloronbar==='yes'){
    if(weeklyperc>=90){
     $("#"+progressbarid).removeClass('progress-bar-info progress-bar-danger').addClass('progress-bar-success');
     
     if(datavalueid.indexOf("adult")===-1 && datavalueid.indexOf("child")===-1 ){
     $("#"+cmts).css('border-color','gray');
       }
                }
                   
 else if(weeklyperc < 90 && weeklyperc !==0) {
       $("#"+progressbarid).removeClass('progress-bar-info progress-bar-success').addClass('progress-bar-danger');
       
       if(datavalueid.indexOf("adult")===-1 && datavalueid.indexOf("child")===-1 ){
       $("#"+cmts).css('border-color','red');
                         }
  
                    }
                }
                    
     }
    
    
    }
}//end of function





//===================This function excecutes all percent calculation functions on loading and editin module  
function loadallpercents(){
    for(c=0;c<allindicatorsarray.length;c++){
      
            if(allindicatorsarray[c].indexOf("total")===-1){
                
            //call the functions in the onblur method
           // $("#"+allindicatorsarray[c]).trigger("blur");
            $("#"+allindicatorsarray[c]).blur();
          
                                                            }
        
        
                                            }
    
    
    
    
                        }





//a function to save comments after a user enters them


function savecomments(commentname){

 $("#finishbutton").prop('disabled',true);
  var id=$("#rowid").val();
  var mids=id.replace("_weekly","");
  var idarray=[mids+"_weekly",mids+"_annual"];
  for(v=0;v<idarray.length;v++){
  var comments=$("#"+commentname).val();
 
 console.log(comments);
 
   dailydatadb.get(idarray[v]).then(function (doc) {
  
   //if(comments!==''){
       
       if(commentname==='hiv_pos_yield_cmts'){
        doc.hiv_pos_yield_cmts=comments;   
       }
       else if (commentname==='hiv_pos_care_cmts'){
           doc.hiv_pos_care_cmts=comments;
                }

            else if (commentname==='started_art_cmts'){
           doc.started_art_cmts=comments;
                }
                
                else if (commentname==='viral_test_cmts'){
           doc.viral_test_cmts=comments;
                }
                
                else if (commentname==='ipt_done_cmts'){
           doc.ipt_done_cmts=comments;
                }
                
                else if (commentname==='tested_cmts'){
           doc.tested_cmts=comments;
                }
                
                else if (commentname==='pmtct_hiv_pos_cmts'){
           doc.pmtct_hiv_pos_cmts=comments;
                }
                
                else if (commentname==='eid_done_cmts'){
           doc.eid_done_cmts=comments;
                }
                
                else if (commentname==='viral_load_mothers_cmts'){
           doc.viral_load_mothers_cmts=comments;
                }
  

    

  return dailydatadb.put(doc);
   //}
  
    
});
//updatesyncstatus(id);    

}
   
    
}// end of save comments function

function disablefinish(){
    
     $("#finishbutton").prop('disabled',true);
    // alert('disable');
     //setTimeout(enablefinish(),2000);
}

function enablefinish(){
    
     $("#finishbutton").prop('disabled',false);
}

function savepercents(weeklypercent,annualpercent,percentname){
 
 
  var id=$("#rowid").val();
  

 
   //dailydatadb.get(id).then(function (doc) {
  
   if(weeklypercent!=='' && weeklypercent!=='NaN'){
     // alert(percent+" "+percentname);
     console.log(""+"data-"+percentname+"_in = "+annualpercent);
        //doc.inpatient_uptake_perc=percentagevalue;
        $("#"+percentname).val(weeklypercent);
        $("#"+percentname+"_in").attr("data-"+percentname+"_in",annualpercent);//data-"+datafieldid+"_in
      
       
   }
  //});

    
}// end of save comments function



function isuseradded(){
   var cnt=0;
        var username="";
    
     //if(username===''){    
    
//}
        
userdb.allDocs({include_docs:true,ascending: true}).then(function (doc) 
{
    
    if(doc.total_rows===0){
        
        $('#adduserbutton').click()
    }

 username=doc.username;

});
  
}

isuseradded();



   function numbers(evt){
      
var charCode=(evt.which) ? evt.which : evt.keyCode
 console.log(charCode);
 /*
if(charCode > 31 && (charCode < 48 || charCode>57)){
return false;
}
*/
//43=+  9=TAB 8=BACKSPACE 
 if( charCode===43 ||  charCode===9 ||  charCode===8 || charCode===46 || ( charCode >= 48 && charCode<=57)){
    
 return true;   
}
else {
return false;
}
}

//Codes to prevent default form submission

$("#userform").submit(function(e){
    return false;
});

$("#weeklydataform").submit(function(e){
    return false;
});


$("#exportdataform").submit(function(e){
    return false;
});

$("#reportsform").submit(function(e){
    return false;
});

$("#excelreportsfom").submit(function(e){
    return false;
});

 $('input').css('border-color','#337ab7');


//prevent numbers scrolling

$('form').on('focus', 'input[type=number]', function (e) {
  $(this).on('mousewheel.disableScroll', function (e) {
    e.preventDefault()
  })
});
$('form').on('blur', 'input[type=number]', function (e) {
  $(this).off('mousewheel.disableScroll')
});



function selectwidth(){
  
   
      $("#facilityname").width('74%');
    
}

function selectwidth100(){
  
   
      $("#facilityname").width('100%');
    
}

selectwidth100();

 
   
             

</script>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover(); 
    
  
    
});


	$('#unexportedno').each(function() {
    var elem = $(this);
    setInterval(function() {
        if (elem.css('visibility') == 'hidden') {
            elem.css('visibility', 'visible');
        } else {
            elem.css('visibility', 'hidden');
        }    
    }, 500);
});




function getreport(){
    
    
//    var exelstart=$("#startdaterpt").val();
//    var exelend=$("#enddaterpt").val();
    
     var exelstart="2018-08-06";
    var exelend="2018-09-30";
    
    var countyrpt=$("#rpt_county").val();
    var rpttypeurl=$("#rpt_type").val();   
        if (exelstart==='')
     {
         
     alert('Select report begining date');
   $("#startdaterpt").focus();    
     }    
   //end date
      else if (exelend==='')
     {
         
     alert('Select report ending date');
   $("#enddaterpt").focus();    
     } 
     
      else  if(Date.parse(exelstart) > Date.parse(exelend)){
                    alert(" Report Start date cannot be greater than end date.");   
                    $("#enddaterpt").focus();  
                }
                else {
                    //call the report generation page
                 downloadrpt(exelstart,exelend,countyrpt,rpttypeurl) ;  
                    
                }
        
    
}



  function downloadrpt(startdate,enddate,cnty,rpttypeurl){
      
                $('.loading').show();
                $('#excelreportbtn').hide();
               
                //?startdate=" + startdate + "&enddate=" + enddate + "&cbos=" + cbos
             
                var ur=hostname+":8080/hsdsarri/"+rpttypeurl+"?startdate=" + startdate + "&enddate=" + enddate+ "&county=" + cnty ;
 console.log(ur);
                $.fileDownload(ur).done(function () { $('.loading').hide(); $('#excelreportbtn').show(); $('#excelreportbtn').html("<i class='glyphicon glyphicon-ok'></i> Report Generated"); }).fail(function () { alert('Report generation failed, kindly try again!'); $('.loading').hide(); $('#excelreportbtn').show(); });
 
                //$('.loading').hide();
            }



  function resetgeneratebutton(){
    
   $("#excelreportbtn").removeClass('btn-lg btn-success active').addClass('btn-lg btn-info active');  
    
}




function checkids(){
    
   
     facility=$("#facilityname").val();
     //startdate=$("#startdate").val();   
     enddate=$("#enddate").val();
     console.log("facility___"+facility);
      if(facility!==''  && facility!==null ){
     
 var facilitynameandmfl=facility.split("_");        
     //var startd=startdate.replace('-','');      
    // var startd=startd.replace('-','');      
     var endd=enddate.replace('-','');      
     var endd=endd.replace('-','');      
      id=facilitynameandmfl[0]+"_"+endd+"_";
      //this should not be cleared
      var newid = $("#rowid").val();   
    
    console.log(newid +" **** "+id);
    if(newid!=='' && id!=='' && id!=='Select Facility Name__'){
    
    if(newid.indexOf(id)>-1){
        //hide the save as new 
        //$("#savenewbutton").hide();
        
                  }
        else if(newid.indexOf(id)===-1){
        //hide the save as new 
       // $("#savenewbutton").show();
       // $("#updatebutton").hide();
        
                           } 
                  
        }
        
    }
                 }


//confirm delete data


function ConfirmDelete()
    {
      var x = confirm("Are you sure you want to delete the selected data?");
      if (x)
          return true;
      else
        return false;
    }


function ConfirmDeletecns()
    {
      var y = confirm("Are you sure you want to delete the selected counsellor?");
      if (y)
          return true;
      else
        return false;
    }





function deletedata(id){
    
    //a function to delete entered data
console.log("______"+id);
dailydatadb.get(id).then(function(doc) {
  return dailydatadb.remove(doc);
}).then(function (result) {
    unsynceddata();
  // handle result
}).catch(function (err) {
  console.log(err);
});

  
    
}

function deletecnsdata(id){
    
    //a function to delete entered data
console.log("Id niii"+id);
userdb.get(id).then(function(doc) {
  return userdb.remove(doc);
}).then(function (result) {
  
  // handle result
}).catch(function (err) {
  console.log(err);
});

  
    
}



function togglehidding(){
    
  console.log("hidding called"); 
 if($('#hidetargets:checkbox:checked').length > 0){
  //showtargets 

   $(".hiderows").hide();
   hidetargetsui='yes';
 }
 else 
 {
      $(".hiderows").show();
      hidetargetsui='no';
 }
    
}








// a function to autosum



function autocalculate(indicator){
    var calculation=$("#"+indicator).val();
   // var calculation=document.getElementById(indicator).value;
 var isblank="no";
 
 if(calculation===''){isblank="yes";}
    console.log(calculation);
    //var calculation1=calculation.replace("+","@");
    var sourcearray=calculation.split("+");
  //___
    var total=0;
     var b=0;     
    for(b=0;b<sourcearray.length;b++){
        //check if there
        if(sourcearray[b].trim()===''){sourcearray[b]=0;}
        
        if(sourcearray[b]!=='')
        {
           total=parseInt(total)+parseInt(sourcearray[b]); 
           if(isblank==="yes"){
               
               
                $("#"+indicator).val("");
           }
           else if(isblank==="no"){
           $("#"+indicator).val(total);
           console.log("Total___"+total);
                 }
           
        }
                                               
       if(b===(sourcearray.length-1)){
           
         yearlytotal(indicator);  
           
       } 
    }
  //initiate the check for previous months data here
  
  
}//end of auto calculate

//this fuction should sum and update the current value of the 

function yearlytotal(indicator){
  //  
    var currentvalue=$("#"+indicator).val(); 
    var previous=$("#"+indicator).attr("data-previous_"+indicator);
    var newtotal=$("#"+indicator).data(""+indicator);
    
    
    
   var afteradding=0;
   if(currentvalue!==''){
       
   afteradding=parseInt(previous)+parseInt(currentvalue);
   
   }
   
        //----update the excel values
      $("#"+indicator).attr( "data-"+indicator , afteradding);  //data-total_hiv_pos_child
      //$("#"+indicator).val(afteradding);  //the total that appears on the input field
      console.log("before adding "+previous+" After adding "+afteradding);  
        
}



//____LOAD LAST CUMULATIVE RECORDS PRIOR TO THE SELECTED MONTH____

  //in this function we are only looking for the id for the last entereed record.
  //if no valid id found, a 0 is passed

function validatemodalities(){
    
    
 var ispns= $("#facilityname").find(':selected').data("pns");   
    //alert("facil "+$("#facilityname").val()+" pns="+ispns);
    var modalitiesoption="<option value=''>Select Modality</option>";
        modalitiesoption+="<option value='Optimized Testing IPD'>Optimized Testing IPD</option>";
        modalitiesoption+="<option value='Optimized Testing OPD'>Optimized Testing OPD</option>";
        
   if(ispns===1){
   modalitiesoption+="<option value='PNS'>PNS</option>";
        modalitiesoption+="<option value='Index Testing'>Index Testing</option>";    
       
   } 
   else {
       
    
        modalitiesoption+="<option value='Index Testing'>Index Testing</option>";   
   }
    
   $("#modality").html(modalitiesoption); 
    
    
}

//validatemodalities();

</script>

	</body>
</html>
