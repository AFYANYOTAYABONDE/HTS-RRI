<%-- 
    Document   : index
    Created on : Mar 17, 2016, 3:17:19 PM
    Author     : Emmanuel E
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<!--<html  manifest="htsrriv1.appcache">-->
<!--<html  >-->
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>DWL</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
                <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
                <link href="css/jquery.dataTables.min.css" rel="stylesheet">
		<link href="css/bootstrap.css" rel="stylesheet">
                <link href="css/bootstrap-datepicker.min.css" rel="stylesheet">
                <link rel="stylesheet" href="css/select2.css">
                <link rel="shortcut icon" href="images/fwl.png">
                  
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">
                                <style type='text/css'>
input:focus {
    border-color: red;
    }
    .control-group .select2-container {
  position: relative;
  z-index: 2;
  float: left;
  width: 100%;
  margin-bottom: 0;
  display: table;
  table-layout: fixed;
}


@media screen and (min-width: 600px) and (max-width: 1199px)  {
  #weeklydataform {
    margin-left:20%;
    margin-right:20%;
  }
}

@media screen and (min-width: 1200px) {
  #weeklydataform {
    margin-left:30%;
    margin-right:30%;
  }
}

.form-control input {
border-color: #5cb85c; 
border:#5cb85c;
    
}



</style>

                
	</head>
	<body>
<!-- header -->
<div id="top-nav" class="navbar navbar-inverse navbar-static-top">
    <div class="container-fluid">
        
        <div class="navbar-header">
            <button id="toolid" style="float:left;color:white;" class="navbar-toggle btn btn-default" > <i class="glyphicon glyphicon-stats"></i>  Daily Facility WorkLoad Summary</button>
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
          
                
                 <li><a title="Add Widget" id="adduserbutton" data-toggle="modal" href="#userdetails"><i class="glyphicon glyphicon-user"></i><span id="usernamelabel"> Update user</span></a></li>
                  <li><a id="clearcachebtn"  title=""   href="" onclick='clearsws();'<i class="glyphicon glyphicon-log-in"></i> Clear Cache</a></li>
                  <li><a id="cleardatabtn"  title=""    onclick='cleardata();'<i class="glyphicon glyphicon-fire"></i>Delete all Data</a></li>
                 <li ><a  title="Add Widget" data-toggle="modal"  id="exportdataanchor2" href="#addWidgetModal1"><i class="glyphicon glyphicon-cloud-upload"></i> Export all Data</a></li>
                 <!--<li ><a  title="Add Widget" data-toggle="modal"  id="zeroreportanchor" href="#zeroreportmodal"><i class="glyphicon glyphicon-remove-circle"></i> Submit Zero report</a></li>-->
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

            
            
           

     
          <div class="row">
                <!-- center left-->
                
          <div class="col-md-12" style="padding-left:3px;padding-right:3px;">
                    

                  

                    <div class="btn-group btn-group-justified">
                        <a href="#" id='refreshpage' class="btn btn-success col-sm-2">
                            <i class="glyphicon glyphicon-stats"></i>
                             Facility WorkLoad Summary
                        </a>
                       
                         
                            
                            <a  class="btn btn-success col-sm-2" id="exportdataanchor1" style="display:none;" title="Add Widget" data-toggle="modal" href="#addWidgetModal">
                                <i class="glyphicon glyphicon-cloud-upload"></i> Export Data 
                                <label id="unexportedno" style="color:yellow;">(0 records )</label>
                            </a>
                             
                       
<!--                         <a href="indextesting.jsp" class="btn btn-primary col-sm-2">
                            <i class="glyphicon glyphicon-link"></i>
                            <br>Index Testing <br/>/ PNS
                        </a>-->
                        
                        <!--<a href="#" class="btn btn-primary col-sm-3">
                            <i class="glyphicon glyphicon-cog"></i>
                            <br> Settings
                        </a>-->
                      
                        
<!--                        <a class="btn btn-primary col-sm-2" title="Excel report" href="https://hsdsacluster2.fhi360.org:8443/Reports/rri.jsp">
                            <i class="glyphicon glyphicon-stats"></i>
                            <br> Excel Report
                        </a> -->
                    </div>

                    <hr>


                   

                    <!--tabs-->
                    <div class="panel">
                        <ul class=" nav nav-tabs " id="myTab">
                            <li class="active newdata col-xs-4"><a href="#dataentry" id="newdatabutton" data-toggle="tab">  <i class="glyphicon glyphicon-plus"></i> Data</a></li>
                            <!--<li class="active editdata" style='display:none;' ><a href="#dataentry" id="newdatabutton" data-toggle="tab">  <i class="glyphicon glyphicon-edit"></i> Edit Data</a></li>-->
                            <!--<li><a href="#reports" style="display:none;" id="reportsbutton" data-toggle="tab"> <i class="glyphicon glyphicon-stats"></i> Report</a></li>--> 
                            <li class='col-xs-4'><a href="#searchdata" data-toggle="tab"> <i class="glyphicon glyphicon-edit"></i> Edit</a></li> 
                           <!-- <li><a href="#export" data-toggle="tab"> <i class="glyphicon glyphicon-cloud-upload"></i> Data Export</a></li>-->
                           
                            <li class='col-xs-4'><a href="#viewcounsellors" data-toggle="tab"> <i class="glyphicon glyphicon-bishop"></i>Users</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active well col-md-12" style='padding:0px;' id="dataentry">
                                
                                
                              <!--Data entry code-->
                    <div class="panel panel-default">
                       
                        <div class="panel-body" style="width:100%;padding:2px;">
                            <form class="form form-vertical" action="#" method="post" id="weeklydataform">
                                
                                
<!--                                <table class='table table-responsive table-bordered'  style="overflow-x: hidden ;" >
                                
                                <tr><th class="col-xs-12" style="text-align:center" id="headerid"><b>Enter HTS Data</b></th></tr>
                                </table>-->
<!--                                <tr><td class="col-xs-12">
                                <div class="control-group">
                                    <label><font color="red"><b>*</b></font> Date </label>
                                    <div class="controls">
                                        <input type="text" onchange="checkids();" name ="startdate" id="startdate" data-date-end-date="0d" autocomplete="off" class="form-control dates" readonly placeholder="e.g yyyy-mm-dd">
                                        
                                    </div>
                                </div>
                                        </td></tr>-->
                                
<!--                                <tr>
                                    <td class="col-xs-12">-->

                           <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: solid; border-right-style: solid; border-bottom-style: none; border-left-style: solid;">
                                    <label  class="col-xs-4" style="padding-top:20px;padding-left:2px;">Date </label>
                                    <div class="controls col-xs-8" style="padding-bottom:5px;padding-top:20px;">
                                        <input type="text" onchange="checkids();" onblur="" name="enddate" id="enddate" data-date-end-date="0d" autocomplete="off"  class="form-control dates" required="true" readonly placeholder="e.g yyyy-mm-dd">
                                   <input type="hidden"  name ="rowid" id="rowid"  />
                                   <input type="hidden"  name ="unexported" id="unexported"  />
                                    </div>
                                </div>

      
                                  <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
                                    <label style="padding-left:2px;" class="col-xs-4">Facility</label>
                                    <div class="controls col-xs-8" style="padding-bottom:5px;padding-top:5px;">
                                        <select  onchange="checkids();" style='width:100%;'   name="facilityname" id="facilityname" class="form-control" >
                                            <option>Select Facility Name</option>
                                           
                                        </select>
                                    </div>
                                </div>
                                


        
                                        
                                        
<!--                                </td>
                                </tr>-->
                                
                                  <!--<tr><td class="col-xs-12">-->
                                
                                
                                
                              
                          
                                
              

  <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:2px;" class="col-xs-6">OPD Attendance<span class='badge' title='OPD' data-toggle='popover' data-trigger='hover' data-content='Opd Attendance on the date above'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onblur="runValidation('screened','opd_t','opd_t');" required="true" onkeypress='return numbers(event);' onkeyup="percent('screened','opd_t','screenrate'); removeFirstZero('opd_t');" name="opd_t" id="opd_t"  autocomplete="off"  class="form-control" title="enter OPD attendants on the date above"  placeholder="OPD Attendance">
 </div>
 </div>
             

  <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:1px;" class="col-xs-6">OPD Screened <span class='badge' title='Screened' data-toggle='popover' data-trigger='hover' data-content='# OPD Clients Screened'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('screened','opd_t','screenrate'); removeFirstZero('opd_t');" onblur="runValidation('opd_eligible','screened','screened');runValidation('screened','opd_t','screened');" required="true" name="screened" id="screened"  autocomplete="off"  class="form-control" title="enter Screened on the date above"  placeholder="# Screened">
 </div>
 </div>
                                
  <div class="control-group col-xs-12"  style="display:none;border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:0px;" class="col-xs-6">Screening Rate <span class='badge' title='Screening Rate' data-toggle='popover' data-trigger='hover' data-content='% of the OPD Clients Screened'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" readonly onkeypress='return numbers(event);' onblur="" name="screenrate" id="screenrate"  autocomplete="off"  class="form-control" title="enter Screened on the date above"  placeholder="%OPD Screened">
 </div>
 </div>                               
        
                                
  <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:1px;" class="col-xs-6">OPD Eligible <span class='badge' title='Eligible' data-toggle='popover' data-trigger='hover' data-content='# of OPD Clients Eligible for Testing'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="removeFirstZero('opd_eligible');" onblur="runValidation('opd_eligible','screened','opd_eligible');runValidation('opd_tested','opd_eligible','opd_eligible');" required="true" name="opd_eligible" id="opd_eligible"  autocomplete="off"  class="form-control" title="enter Screened on the date above"  placeholder="#OPD Eligible">
 </div>
 </div>                               
                                
  <div class="control-group col-xs-12" style="background-color: #EBEBEB; border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:1px;" class="col-xs-6">OPD Tested <span class='badge' title='Tested' data-toggle='popover' data-trigger='hover' data-content='# of OPD Clients Tested'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('opd_positive','opd_tested','opd_Yield');removeFirstZero('opd_tested');" onblur="runValidation('opd_positive','opd_tested','opd_tested');runValidation('opd_tested','opd_eligible','opd_tested');" required="true" name="opd_tested" id="opd_tested"  autocomplete="off"  class="form-control" title="enter # Tested on the date above"  placeholder="#OPD Tested">
 </div>
 </div>                                 
   
                                
 <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:1px;" class="col-xs-6">OPD Positive <span class='badge' title='Positive' data-toggle='popover' data-trigger='hover' data-content='# of OPD Clients Tested & HIV +ve'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('opd_positive','opd_tested','opd_Yield');removeFirstZero('opd_positive');" onblur="runValidation('opd_positive','opd_tested','opd_positive');" required="true" name="opd_positive" id="opd_positive"  autocomplete="off"  class="form-control" title="enter # Tested on the date above"  placeholder="#OPD Positive">
 </div>
 </div>  
                                
                                
<div class="control-group col-xs-12"  style="display:none;border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:0px;" class="col-xs-6">OPD Yield <span class='badge' title='OPD Yield' data-toggle='popover' data-trigger='hover' data-content='% of the OPD Positives out of the tests'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" readonly onkeypress='return numbers(event);' onblur="" name="opd_Yield" id="opd_Yield"  autocomplete="off"  class="form-control" title=""  placeholder="%OPD Yield">
 </div>
 </div>  
                                
                                
                                
                                
                                
                                <!----PMTCT------>
                                
                                
                                <div class="control-group col-xs-12" style="background-color: #EBEBEB; border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:1px;" class="col-xs-6">PMTCT Tested <span class='badge' title='Tested' data-toggle='popover' data-trigger='hover' data-content='# of PMTCT Clients Tested'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('pmtct_positive','pmtct_tested','pmtct_Yield');removeFirstZero('pmtct_tested');" onblur="runValidation('pmtct_positive','pmtct_tested','pmtct_tested');" required="true" name="pmtct_tested" id="pmtct_tested"  autocomplete="off"  class="form-control" title="enter # Tested on the date above"  placeholder="# PMTCT Tested">
 </div>
 </div>                                 
   
                                
 <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:1px;" class="col-xs-6">PMTCT Positive <span class='badge' title='Positive' data-toggle='popover' data-trigger='hover' data-content='# of PMTCT Clients Tested & HIV +ve'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('pmtct_positive','pmtct_tested','pmtct_Yield');removeFirstZero('pmtct_positive');" onblur="runValidation('pmtct_positive','pmtct_tested','pmtct_positive');" required="true" name="pmtct_positive" id="pmtct_positive"  autocomplete="off"  class="form-control" title="enter # Tested on the date above"  placeholder="# PMTCT Positive">
 </div>
 </div>  
                                
                                
<div class="control-group col-xs-12"  style="display:none;border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:0px;" class="col-xs-6">PMTCT Yield <span class='badge' title='PMTCT Yield' data-toggle='popover' data-trigger='hover' data-content='% of the PMTCT Positives out of the tests'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" readonly onkeypress='return numbers(event);' onblur="" name="pmtct_Yield" id="pmtct_Yield"  autocomplete="off"  class="form-control" title=""  placeholder="%PMTCT Yield">
 </div>
 </div>  
  
<!--                                
                                --VCT----
                                
                                <hr style="color:#EBEBEB ;">
                                <div class="control-group col-xs-12" style="background-color: #EBEBEB; border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style=" padding-left:1px;" class="col-xs-6">VCT Tested <span class='badge' title='Tested' data-toggle='popover' data-trigger='hover' data-content='# of VCT Clients Tested'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('vct_positive','vct_tested','vct_Yield');removeFirstZero('vct_tested');" onblur="runValidation('vct_positive','vct_tested','vct_tested');" required="true" name="vct_tested" id="vct_tested"  autocomplete="off"  class="form-control" title="enter # Tested on the date above"  placeholder="# VCT Tested">
 </div>
 </div>                                 
   
                                
 <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:1px;" class="col-xs-6">VCT Positive <span class='badge' title='Positive' data-toggle='popover' data-trigger='hover' data-content='# of VCT Clients Tested & HIV +ve'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('vct_positive','vct_tested','vct_Yield');removeFirstZero('vct_positive');" onblur="runValidation('vct_positive','vct_tested','vct_positive');" required="true" name="vct_positive" id="vct_positive"  autocomplete="off"  class="form-control" title="enter # Tested on the date above"  placeholder="# VCT Positive">
 </div>
 </div>  
                                
                                
<div class="control-group col-xs-12"  style="display:none;border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:0px;" class="col-xs-6">VCT Yield <span class='badge' title='VCT Yield' data-toggle='popover' data-trigger='hover' data-content='% of the VCT Positives out of the tests'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" readonly onkeypress='return numbers(event);' onblur="" name="vct_Yield" id="vct_Yield"  autocomplete="off"  class="form-control" title=""  placeholder="%VCT Yield">
 </div>
 </div>                                  -->
                                
  
                                
                                 <!----VCT------>
                                
                                <!--<hr style="color:#EBEBEB ;">-->
                                <div class="control-group col-xs-12" style="background-color: #EBEBEB; border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style=" padding-left:1px;" class="col-xs-6">PNS Tested <span class='badge' title='Tested' data-toggle='popover' data-trigger='hover' data-content='# of Clients tested through PNS including Biological children'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('index_positive','index_tested','index_yield');removeFirstZero('index_tested');" onblur="runValidation('index_positive','index_tested','index_tested');" required="true" name="index_tested" id="index_tested"  autocomplete="off"  class="form-control" title="enter # Tested on the date above"  placeholder="# PNS Tested">
 </div>
 </div>                                 
   
                                
 <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:1px;" class="col-xs-6">PNS Positive <span class='badge' title='Positive' data-toggle='popover' data-trigger='hover' data-content='# of of Clients tested through PNS & HIV +ve'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
     <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('index_positive','index_tested','index_yield');removeFirstZero('index_positive');" onblur="runValidation('index_positive','index_tested','index_positive');" required="true" name="index_positive" id="index_positive"  autocomplete="off"  class="form-control" title="enter # Positive on the date above"  placeholder="# PNS Positive">
 </div>
 </div>  
                                
                                
<div class="control-group col-xs-12"  style="display:none;border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:0px;" class="col-xs-6">PNS Yield <span class='badge' title='PNS Yield' data-toggle='popover' data-trigger='hover' data-content='% of the PNS Positives out of the tests'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" readonly onkeypress='return numbers(event);' onblur="" name="index_yield" id="index_yield"  autocomplete="off"  class="form-control" title=""  placeholder="%PNS Yield">
 </div>
 </div>                                 
  
                                
  <div class="control-group col-xs-12" style="background-color: #EBEBEB; border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style=" padding-left:1px;" class="col-xs-6">Self Test <span class='badge' title='Self Tested' data-toggle='popover' data-trigger='hover' data-content='# of Clients self tested '>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="removeFirstZero('self_test');" required="true" name="self_test" id="self_test"  autocomplete="off"  class="form-control" title="enter # Self Tested on the date above"  placeholder="# Self Tested">
 </div>
 </div>                                    

<div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style=" padding-left:1px;" class="col-xs-6">Initiated on prep <span class='badge' title='Prep' data-toggle='popover' data-trigger='hover' data-content='# of Clients initiated on Prep '>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' required="true" onkeyup="removeFirstZero('Referred_Prep');" onblur="" name="Referred_Prep" id="Referred_Prep"  autocomplete="off"  class="form-control" title="enter # Initiated On Pre on the date above"  placeholder="# Prep">
 </div>
</div>                                
 
                                
 <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style=" padding-left:1px;" class="col-xs-6">GBV Cases <span class='badge' title='gbv' data-toggle='popover' data-trigger='hover' data-content='# of GBV Cases Reported '>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' required="true" onkeyup="removeFirstZero('Referred_Prep');" onblur="" name="gbv" id="gbv"  autocomplete="off"  class="form-control" title="enter # GBV cases on the date above"  placeholder="# GBV">
 </div>
</div>                                
                                
                                
 <div class="control-group col-xs-12" style="background-color: #EBEBEB; border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style=" padding-left:1px;" class="col-xs-6">Total Tested <span class='badge' title='Tested' data-toggle='popover' data-trigger='hover' data-content='Total # of Newly HIV tested clients'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
     <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('Total_Positive','Total_Tested','Total_Yield');removeFirstZero('Total_Tested');" onblur="runValidation('Total_Positive','Total_Tested','Total_Tested');" required="true" name="Total_Tested" id="Total_Tested"  autocomplete="off"  class="form-control" title="enter # Tested on the date above"  placeholder="# Total Tested">
 </div>
 </div>                                 
   
                                
 <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
  <label style="padding-left:1px;" class="col-xs-6">Total Positive <span class='badge' title='Positive' data-toggle='popover' data-trigger='hover' data-content='Total # of Newly HIV tested clients & HIV +ve'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('Total_Positive','Total_Tested','Total_Yield');removeFirstZero('Total_Positive');" onblur="runValidation('Total_Positive','Total_Tested','Total_Positive');" required="true" name="Total_Positive" id="Total_Positive"  autocomplete="off"  class="form-control" title="enter # Positive on the date above"  placeholder="# Total Positive">
 </div>
 </div>   
                                
 <div class="control-group col-xs-12" style="border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
 <label style="padding-left:1px;" class="col-xs-6 ">Total Linked <span class='badge' title='Linked' data-toggle='popover' data-trigger='hover' data-content='# of Clients linked to ART'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" onkeypress='return numbers(event);' onkeyup="percent('Total_Linked','Total_Positive','Total_Linkage');removeFirstZero('Total_Linked');" required="true" onblur="" name="Total_Linked" id="Total_Linked"  autocomplete="off"  class="form-control" title="enter # Positive on the date above"  placeholder="# Total Linked">
 </div>
 </div>                               
                                
                                
<div class="control-group col-xs-12"  style="display:none;border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
 <label style="padding-left:0px;" class="col-xs-6">Overall Yield <span class='badge' title='Overall Yield' data-toggle='popover' data-trigger='hover' data-content='% of the Total Positives out of the tests'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" readonly onkeypress='return numbers(event);' onblur="" name="Total_Yield" id="Total_Yield"  autocomplete="off"  class="form-control" title=""  placeholder="%Overall Yield">
 </div>
</div>                                  


<div class="control-group col-xs-12"  style="display:none;border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
 <label style="padding-left:0px;" class="col-xs-6">Overall Linkage <span class='badge' title='Overall Linkage' data-toggle='popover' data-trigger='hover' data-content='% of the Total Linked out of the Total Positives'>?</span> </label>
 <div class="controls col-xs-6" style="padding-bottom: 5px;">
 <input type="text" maxlength="4" readonly onkeypress='return numbers(event);' onblur="" name="Total_Linkage" id="Total_Linkage"  autocomplete="off"  class="form-control" title=""  placeholder="%Overall Linkage">
 </div>
</div>                                  
 
                                
                                
                                <div class="control-group col-xs-12" style="background-color:#EBEBEB ;border-width: 0.15px ; border-color:  #EBEBEB;  border-top-style: none; border-right-style: solid; border-bottom-style: none; border-left-style: solid;" >
                                    <label style="padding-left:2px;" class="col-xs-4">Uploaded By</label>
                                    <div class="controls col-xs-8" style="padding-bottom:5px;padding-top:5px;">
                                        <select  onchange="" required  name="counsellor" id="counsellor" class="form-control" >
                                            <option value=''>Select user</option>

                                        </select>
                                    </div>
                                </div>
                                
<!--
facilityname
counsellor
opd_attendance
screened
screenrate
opd_eligible
opd_tested
opd_positive
opd_Yield

pmtct_tested
pmtct_positive
pmtct_Yield

vct_tested
vct_positive
vct_Yield

index_tested
index_positive
index_yield

self_test
Referred_Prep

Total_Tested
Total_Positive
Total_Linked
Total_Linkage
-->

                                      
                                        
<!--                                </td>
                                </tr> -->
                                 
                                 
                                 
                                
<!--                                    </table>
                                         <table class='table table-striped table-bordered' id="dynamicindicators"  > -->
                                   
                                <!------INDICATORS----->
                                                                 
                                  
                                  
                                     
                                <table class="table table-striped table-bordered">
                                       <tr><td colspan="3" class="col-xs-12">               
                                <div class="control-group col-xs-12">
                               <div id="utumani" class="alert-info">Note: Please enter data for all input fields.</div>
                                   <br/>
                                    <div class="controls">
                                        <button type="submit" id='savebutton' onmouseover="setrowid();" onclick="validateweeklydata();" style="margin-left: 0%;" class="btn-lg btn-success active">
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
                        <!--/panel content-->
                    </div>
                    <!--/panel-->

                              
                              <!--Data entry code-->
                            
                            </div>
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
                            
                            <div class="tab-pane well" id="searchdata">
                                 <button id="btnDeleteRow" style='display:none;' value="cancel">Delete selected Row</button>
                                <div id="searchtablediv">
                                  
                                </div>    
                               <!--- Data export---->
                            </div>
                            
                            <div class="tab-pane well" id="viewcounsellors">
                                 <button id="btnDeleteRowcns" style='display:none;' value="cancel">Delete selected User</button>
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

<footer class="text-center"> &copy; AfyaNyota | USAID </footer>

<div class="modal" id="addWidgetModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" id="refr1" aria-hidden="true">x</button>
                <h4 class="modal-title">Data Export</h4>
            </div>
            <div class="modal-body">
                <form id="exportdataform">
                   
                    <button class=" btn-lg btn-success" style="text-align: center;" id="exportbutton" onclick="importdata();"> Click here to Export Data</button>
              
              
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












<div class="modal" id="addWidgetModal1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" id="refr11" aria-hidden="true">x</button>
                <h4 class="modal-title">Data Re-Export</h4>
            </div>
            <div class="modal-body">
                <form id="exportdataform">
                   
                    <button class=" btn-lg btn-success" style="text-align: center;" id="exportbutton1" onclick="exportalldata();"> Click here to Re-Export Data</button>
              
              
              <button class=" btn-lg btn-info" style="display:none;text-align: center;"  id="exportmsg" > Exporting Data..</button>
              <p id="exportresponse1"> </p>
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





<div class="modal" id="zeroreportmodal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" id="refr11" aria-hidden="true">x</button>
                <h4 class="modal-title">Submit zero report</h4>
            </div>
            <div class="modal-body">
              <form id="zeroreportform">
                  <div class="control-group col-xs-12" >
               <label class="col-xs-12"> <font color="red"><b>*</b></font>  Date:</label>
               <div class="controls col-xs-12" style="padding-bottom: 15px;">
              <input type="text" onchange="" onblur="" name="zeroreportdate" id="zeroreportdate" data-date-end-date="0d" autocomplete="off" class="form-control dates" readonly="" placeholder="datepicker" style="border-color: rgb(51, 122, 183);">
                </div>
                </div>
               <div class="control-group col-xs-12" >
                                    <label class="col-xs-12"> <font color="red"><b>*</b></font>  Facility Name:</label>
                                    <div class="controls col-xs-12" style="padding-bottom: 15px;">
                                        <select  onchange="" style='width:100%;'   name="facilityname_zerorpt" id="facilityname_zerorpt" class="form-control" >
                                        <option>Select Facility Name</option>
                                           
                                        </select>
                                    </div>
                                </div>
              
              <button class=" btn-sm btn-success" style="text-align: center;" id="savezeroreportbutton" onclick="savezeroreport();">Submit</button>
              
              
              <button class=" btn-lg btn-info" style="display:none;text-align: center;"   > Exporting Data..</button>
              <p id="savezeromsg"> </p>
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








<div class="modal" id="userdetails">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" id="saveuserbtn" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">System User Details</h4>
            </div>
            <div class="modal-body">
                <form action="#" id="userform" method="post">
                 <div class="control-group">
                                    <label><font color="red"><b>*</b></font>Enter  Full Name</label>
                                    <div class="controls">
                                        <input  maxlength='30' placeholder="eg John Ndoe"   required name="counsellorreg" id="counsellorreg" class="form-control" />
                                    
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
                                    <label>Facility Name</label>
                                    <div class="controls">
                                        <select  name="counsellorfacil" id="counsellorfacil" style="width:100%;" class="form-control">
                                            <option value="">Select Facility</option>
                                            
                                           
                                            
                                           
                                        </select>
                                    </div>
                                </div>
                    
                    
                    
                                <div class="control-group">
                                    <label></label>
                                    <div class="controls">
                                        <button onclick=" updateuser();"  type="submit" style="margin-left: 50%;"  class="btn-lg btn-success active">
                                            Update
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
                <button type="button"  class="close" data-dismiss="modal" aria-hidden="true">x</button>
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
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title">Help</h4>
            </div>
            <div class="modal-body">
                <p>This  application is created for aiding users in collecting Facility Attendance Tool</p>
                    <h3>Activating User</h3>
                 <p> The first time of installing/running the application,You should specify the name of the system users from the availed list.</p>
                
                <h3>Data Elements</h3>
                <p>The specific elements that we are interested in are;</p>
                <ul>

<li> Date Test Conducted </li>
<li> Facility Name </li>
<li> Name of Counsellor- Name of HTS Counsellor</li>
<li> Register Number - <i>Refers to the number allocated to the HTS register, e.g. 01, 02, 03 etc. Meaning each HTS register being used at the facility should be allocated a number different from the other</i></li>
<li> Patient Serial Number -<i>Is the number given to the client in the HTS register based on annual serialization system in the HTS register (column a).</i> </li>
<li> Age </li>
<li> Sex </li>
<li> HTS Testing Modality - The Modality where client was tested in. This does not include the PMTCT</li>
<li> HTS Test Results <i>(Positive/Negative)</i> </li>
<li> Is the Patient Linked </li> 
<li> The Facility where the patient is linked in </li>
<li> The Patient CCC number</li>
<li>Reason why Patient is not linked</li>
<li> If patient Declined to be linked, give reason</li>
<li> If Patient was not linked because of death, give reason for death</li>




                </ul>
                
                <h3>Test and Start</h3>
                <p>This section will help you to enter data started ART details. For the records that where linked within our Project health facilities, you can search their ccc numbers and if you do not find them, type the ccc numbers and fill the date tested and the Date started on ART details  </p>
                
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








<div class="modal" id="whatsappform" style='height:99%;'>
    <div class="modal-dialog">
        <div class="modal-content">
<!--            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" id="refr11" aria-hidden="true">x</button>
            <label id='tumawp' class='btn btn-info'>Share <i class='glyphicon glyphicon-share'></i></label>
            </div>-->
            <div class="modal-body">
              
            <form id="whatsapp">
               
                  <table border='0px' class='table table-condensed' style='font-size:9px;'>
<tr style='color:white;background-color:gray;'><th colspan='4' style='font-size:11px;text-align:center;'> <b><label id='lbl_facility' ></label></b> : <label id='lbl_date_tested'></label></th></tr>

<tr><td style='border:1px solid gray;' rowspan='7'><b>OPD</b></td><td style='text-align:left;'><b>Attendance:</b> </td><td><label id='lbl_opd_t'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>No. screened:</b> </td><td><label id='lbl_screened'></label></td><td></td></tr>
<tr style='background-color:gray;color:white;'><td style='text-align:left;'><b>Screening rate (%)</b> </td><td><label id='lbl_screenrate'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>Eligible for testing:</b> </td><td><label id='lbl_opd_eligible'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>No. tested:</b> </td><td><label id='lbl_opd_tested'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>No. positive:</b> </td><td><label id='lbl_opd_positive'></label></td><td></td></tr>
<tr style='background-color:gray;color:white;'><td style='text-align:left;'><b>Positive yield (%)</b> </td><td><label id='lbl_opd_Yield'></label></td><td></td></tr>
<tr><td rowspan='3' style='border:1px solid gray;'><b>PMTCT</b></td><td style='text-align:left;'><b>No. tested:</b> </td><td><label id='lbl_pmtct_tested'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>No. positive:</b> </td><td><label id='lbl_pmtct_positive'></label></td><td></td></tr>
<tr style='background-color:gray;color:white;'><td style='text-align:left;'><b>Positive yield (%)</b> </td><td><label id='lbl_pmtct_Yield'></label></td><td></td></tr>
<tr><td style='border:1px solid gray;' rowspan='3'><b>PNS</b></td><td style='text-align:left;'><b>No. tested:</b> </td><td><label id='lbl_index_tested'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>No. positive:</b> </td><td><label id='lbl_index_positive'></label></td><td></td></tr>
<tr style='background-color:gray;color:white;'><td style='text-align:left;'><b>Positive yield (%)</b> </td><td><label id='lbl_index_yield'></label></td><td></td></tr>
<tr><td style='border:1px solid gray;' rowspan='9'><b>OVERALL</b></td><td style='text-align:left;'><b>HTS SELF Tests:</b> </td><td><label id='lbl_self_test'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>Initiated On Prep:</b> </td><td><label id='lbl_Referred_Prep'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>No. GBV Cases:</b> </td><td><label id='lbl_gbv'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>Tested:</b> </td><td><label id='lbl_Total_Tested'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>Positive:</b> </td><td><label id='lbl_Total_Positive'></label></td><td></td></tr>
<tr style='background-color:gray;color:white;'><td style='text-align:left;'><b>Positive yield (%)</b> </td><td><label id='lbl_Total_Yield'></label></td><td></td></tr>
<tr><td style='text-align:left;'><b>Total Linked:</b> </td><td><label id='lbl_Total_Linked'></label></td><td></td></tr>
<tr style='background-color:gray;color:white;'><td style='text-align:left;'><b>Linkage Rate (%)</b> </td><td><label id='lbl_Total_Linkage'></label></td><td></td></tr>
<tr style='border:1px solid gray;'><td style='text-align:left;'><b>Submitted By:</b> </td><td><label id='lbl_counsellor'></label></td><td></td></tr>


  
  <tr><td><div alt='' id='pisa' ></div></td></tr>


</table>
              
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








	<!-- script references -->
                <script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/scripts.js"></script>
                <script src="js/bootstrap-datepicker.min.js"></script>
                
<!--                <script type="text/javascript" src="select/selectstyle.js"></script>  
                <link href="select/selectstyle.css" rel="stylesheet">-->
    
          
                
                <script src="js/select2.js"></script>
                <script src="js/pouchdb-7.1.1.js"></script>
                 
                <script type="text/javascript" src="js/jquery.fileDownload.js"></script>
                <script type="text/javascript" src="js/datatables.min.js"></script>
                <script type="text/javascript" src="js/html2canvas.js"></script>
                <script type="text/javascript" src="js/FileSaver.js"></script>
                <!--<script type="text/javascript" src="js/screenshot.js"></script>-->
                
<!--                   <script type="text/javascript" charset="utf-8" src="cordova-1.5.0.js"></script>  -->
                <script>
              //var hostname="https://hsdsacluster2.fhi360.org:8443/htsrri/";
              var hostname="";
//var hostname="http://localhost/hsdsarri";

     // todayHighlight: true, daysOfWeekDisabled: "0,6",clearBtn: true, autoclose: true,format: "yyyy-mm-dd",
                </script>
                <script type="text/javascript">
  $(document).ready(function(){
      
          
                         $('.dates').datepicker({
                             todayHighlight: true, clearBtn: true, autoclose: true,format: "yyyy-mm-dd",
     });
      
  $('#facilityname').select2();
  
  
  $('#rowid').val("");  
  
  });   
                 </script>


<script>
   
  var user="hsdsa";  
//load data from the cloud server 
   
//load data from the cloud server 
   function getFacilitiesJson(){
       
      
       
        var facilities="<option value=''>Select Facility</option>";
        
              $.ajax({
                    url:'sites2.json',                            
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
                      $("#facilityname_zerorpt").html(facilities);
                      
                      
                   $(document).ready(function() {
            //$('#lyricstable').DataTable();
              $('#facilityname').select2();
              $('#counsellorfacil').select2(); 
              $('#facilityname_zerorpt').select2(); 
              
            //   $('#facilityname').chosen();
            //  $('#facilityname').trigger("chosen:updated");
//               $('#counsellorfacil').chosen();
//             $('#counsellorfacil').trigger("chosen:updated");
             
             
                                 } );
                     
                      }});
   
   }
   
   getFacilitiesJson();
   
    
    
      
    
    //PouchDB.debug.enable('*');
    //PouchDB.debug.disable();
    var userdb = new PouchDB('activecounsellordetails');
var remoteCouch = false;
var userdetails;

//receive the artist, song title and lyrics text
function adduser(code,cname,cfacil,fullname) {
   userdetails = {
        _id: ""+code, //this is static since we cant have two users using the same phone
	cname:cname,
        fullname:fullname,
        cfacil:cfacil,        
        completed: false
  };
  userdb.put(userdetails, function callback(err, result) {
    if (!err) {
      console.log('counsellor added succesfully');
    }
    else{
        console.log(err);
        
    }
    
    setTimeout(delayedrefresh,1500);
  });
}	


  function updateuser(){
   //alert("save called");   
   var counsname=$("#counsellorreg").val();   
   var counsfacil=$("#counsellorfacil").val().replace("'","");
   var fullname=$("#counsellorreg").find(':selected').data("fullname");
   var code=$("#counsellorreg").find(':selected').data("code");
   
   if(counsname===''){alert("Enter Counsellor name");}
   else if(counsfacil===''){alert("Enter Counsellor facility");}
   else 
   {
      
    adduser(code,counsname,counsfacil,fullname); 
   showuser();   
       
   }
   
  }  
    
   function showuser(){
       
userdb.allDocs({include_docs: true, ascending: true}).then(function (da) {
if(da.total_rows===0){
    //activatecounsellors();
$("#usernamelabel").html("Activate a User");
$("#usernamelabel").click();
$("#usernamelabel").click();

                      }
     else {
       
            var counsellors="<option value=''>select  Counsellor</option>";
            var a;
     for(a=0;a<da.total_rows;a++){
                var dat={}; 
           
	       dat=da.rows[a].doc;
                
            if(dat.cname!=='')
            {
                if(da.total_rows===1){
          counsellors="<option value='"+dat.cname+"'>"+dat.cname+"</option>";
           $("#facilityname").val(dat.cfacil);
           $("#facilityname_zerorpt").val(dat.cfacil);
        
            $('#facilityname').select2();
            $('#facilityname_zerorpt').select2();
           
           $("#usernamelabel").html("Hi "+dat.cname);
           
           // validatemodalities();
                                     
                                     }
       else {
           counsellors+="<option value='"+dat.cname+"'>"+dat.cname+" ["+dat.cfacil+"]</option>";
           
            }
           
           $("#counsellor").html(counsellors);
          $('#counsellor').select2(); 

          
           user=dat.cname;
            }
            else {
             counsellors="<option value=''>Activate a User</option>";
             $("#counsellor").html(counsellors);
     }
   

     }//end of row

        }
}).catch(function (err){console.log("makosa ni :"+err.reason);   if(err.reason==='QuotaExceededError'){alert("Your device has run out of space.Please create space by deleting unwanted videos,photos or large documents");}  });
	} //end of function
        
        
     showuser();
     
   function loaduser()
   {
   //alert("save called");   
   var cname=$("#counsellorreg").val().replace("'","");   
   var cfacil=$("#counsellorfacil").val();   
   var fullname=$("#counsellorreg").find(':selected').data("fullname"); 
   var code=$("#counsellorreg").find(':selected').data("code"); 
        adduser(code,cname,cfacil,fullname); 
        
        
  }  
      
    
//This is a document to save all facilities for offline use 
var db = new PouchDB('facilities');
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

var counsellorslistdb = new PouchDB('counsellorslist_rriv2');
var remoteCouch = false;
var receivedcounsellors;



function addcounsellorslist(active,code,gender,county,cadre,facility,mflcode,fullname,Currentfacility,Currentmflcode,RRI_Name) 
{
   receivedcounsellors = {
_id: code,	
isactive:active,
gender:gender,
county:county,
cadre:cadre,
facility:facility,
mflcode:mflcode,
fullname:fullname,
Currentfacility:Currentfacility,
Currentmflcode:Currentmflcode,
RRI_Name: RRI_Name
  };
  counsellorslistdb.put(receivedcounsellors, function callback(err, result) {
    if (!err) {
      //console.log('targets added succesfully');
    }
  });
}

function updatecounsellorslist(active,code,gender,county,cadre,facility,mflcode,fullname,Currentfacility,Currentmflcode,RRI_Name){
  //console.log(id);
   counsellorslistdb.get(code).then(function (doc) {
 
   if(code!=='null' && code!=='' ){
       

doc.isactive =active;
doc.gender =gender;
doc.county =county;
doc.cadre =cadre;
doc.facility =facility;
doc.mflcode =mflcode;
doc.fullname =fullname;
doc.Currentfacility =Currentfacility;
doc.Currentmflcode =Currentmflcode;
doc.RRI_Name = RRI_Name;
        
   //alert('called');
  // put them back
  return counsellorslistdb.put(doc);
                                         }
});      
        
    
}




function getcounsellorslist(){
    
   
              $.ajax({
                    url:'getcancellors',                            
                    type:'get',  
                    dataType: 'json',  
                    success: function(data) {
                   
                 //alert(data[0].facility_name);    
                     for(var i=0;i<data.length;i++){
                         
                       // console.log(data[i].facility_name) 
                        
                        addcounsellorslist( data[i].active,data[i].code,data[i].gender,data[i].county,data[i].cadre,data[i].facility,data[i].mflcode,data[i].fullname,data[i].Currentfacility,data[i].Currentmflcode,data[i].RRI_Name);
                        updatecounsellorslist( data[i].active,data[i].code,data[i].gender,data[i].county,data[i].cadre,data[i].facility,data[i].mflcode,data[i].fullname,data[i].Currentfacility,data[i].Currentmflcode,data[i].RRI_Name);
                        
                      if(i===data.length-2){
                          activatecounsellors();
                          
                      } 
                     }
                       
                   
        
                                           }
                                           
                                              ,
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        activatecounsellors();
        //alert('offline');
	$('#exportbutton').hide();
       // alert("failed");
        $("#exportresponse").html("<b><font color='orange'>Connect to internet to export data </b><br/>");
    }
                        
                         });
    
    
}

//getcounsellorslist();





function checkinternet()
{
    
  console.log(" is internet available?");  
    
$('#exportbutton').hide();
 $("#exportresponse").html("<b><font color='orange'>checking for internet..</b><br/>");
    
   
              $.ajax({
             url:'validateAccess',                            
            type:'get',  
            dataType: 'html',  
           
    success: function(data) {
                             //alert('offline');
	$('#exportbutton').show();
	$('#savezeroreportbutton').show();
       // alert("failed");
        $("#exportresponse").html("");
        $("#savezeromsg").html("");
   
    }
                                           
    ,
    error: function(XMLHttpRequest, textStatus, errorThrown) 
    {
        //alert('offline');
	$('#exportbutton').hide();
	$('#savezeroreportbutton').hide();
       // alert("failed");
        $("#exportresponse").html("<b><font color='orange'>Connect to internet to export data </b><br/>");
        $("#savezeromsg").html("<b><font color='orange'>Connect to internet to submit zero report</b><br/>");
    }
                        
                         });
    
    

    
}





//=========================SAVE WEEKLY DATA========================

 
//This is a document to save all tables 
var dailydatadb = new PouchDB('workload_client_data',{auto_compaction: true});
var remoteCouch = false;
var weeklydata;

//receive the artist, song title and lyrics text
function insertdailydata(id,facilityname,counsellor,date_tested,opd_t,screened,screenrate,opd_eligible,opd_tested,opd_positive,opd_Yield,pmtct_tested,pmtct_positive,pmtct_Yield,index_tested,index_positive,index_yield,self_test,Referred_Prep,gbv,Total_Tested,Total_Positive,Total_Yield,Total_Linked,Total_Linkage,timestamp,user, syncstatus) {
   
   
        dailydata = {
       _id: id, //made of startdate_enddate_facilitymfl_frequency //frequency could be _annual or _weekly
       facility:facilityname,
       counselorname:counsellor,      
       date_tested:date_tested,
       opd_t:opd_t,
       screened:screened,
       screenrate:screenrate,
       opd_eligible:opd_eligible,
       opd_tested:opd_tested,
       opd_positive:opd_positive,
       opd_Yield:opd_Yield,
       pmtct_tested:pmtct_tested,
       pmtct_positive:pmtct_positive,
       pmtct_Yield:pmtct_Yield,
       index_tested:index_tested,
       index_positive:index_positive,
       index_yield:index_yield,
       self_test:self_test,
       Referred_Prep:Referred_Prep,
       gbv:gbv,
       Total_Tested:Total_Tested,
       Total_Positive:Total_Positive,
       Total_Yield:Total_Yield,
       Total_Linked:Total_Linked,
       Total_Linkage:Total_Linkage,
       timestamp:timestamp,
       user:user,
       syncstatus:syncstatus,        
       completed: false
  };
  dailydatadb.put(dailydata, function callback(err, result) {
      
      console.log("Result:  "+result+" error: "+err);
      
    if (!err) 
    {
      console.log('daily data added succesfully');
      
    }
    else {
        
       $("#headerid").html("<font color='red'><b>Record Not Saved. You have already entered another record with similar serial number, register no. and modality</b></font>");
         alert("Duplicate Error!.You have already entered data for that date. Consider editing the data");
        
            console.log('Saving Error: Data for that data has been entered ');   
        
         }
  });
}	



//prepare form data

//===================================================INSERT Dailty DATA===================================

var id=null;
var facility=null;
var counsellor=null;

var date_tested=null;

var user=null;
var timestamp=null;
var datestartedart=null;


var opd_t=null;
var screened=null;
var screenrate=null;
var opd_eligible=null;
var opd_tested=null;
var opd_positive=null;
var opd_Yield=null;

var pmtct_tested=null;
var pmtct_positive=null;
var pmtct_Yield=null;

var index_tested=null;
var index_positive=null;
var index_yield=null;

var self_test=null;
var Referred_Prep=null;
var gbv=null;

var Total_Tested=null;
var Total_Positive=null;
var Total_Yield=null;
var Total_Linked=null;
var Total_Linkage = null;

   //added 201605 
    var progressbarstoskip=[];
     var allindicatorsarray=["rowid","facilityname","enddate","counsellor","opd_t","screened","screenrate","opd_eligible","opd_tested","opd_positive","opd_Yield","pmtct_tested","pmtct_positive","pmtct_Yield","index_tested","index_positive","index_yield","self_test","Referred_Prep","gbv","Total_Tested","Total_Positive","Total_Yield","Total_Linked","Total_Linkage"];
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
              
              
              row2+="<td class='"+tdclass+"' colspan='"+colspan+"' > <div class='control-group' > <label> "+label+" </label> <div class='controls'> <input onkeypress='return numbers(event);'  "+isreadonly+"  "+tabindex+" onblur=\""+onblur+"\"  onfocus='this.value = this.value;' type='"+inputtype+"' min ='"+minimum+"' max='"+maximum+"' maxlength='7' data-"+indicatorid+"='0' data-previous_"+indicatorid+"='0'  name='"+indicatorid+"' id='"+indicatorid+"' autocomplete='off' class='form-control'> </div> </div> </td> ";
            //IndicatorID	Age	IndicatorName	Level	datainputtype	Min	Max	onblur	onkeypress	Class	Required
    
     
     //now do an appending
                 
             }
             row2+=" </tr> ";   
            
            //alert(row2);
            // $("#dynamicindicators").html(row2);
            
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
             row2+=" <tr><td colspan='1'><a id='finishbutton' href='#' style='margin-left: 50%;' onclick='setTimeout(delayedrefresh(),1500);clearcmtsandprcent();' class='btn btn-success btn-lg'>Finish</a></td></tr><tr><td colspan='1'> <div class='alert alert-success' id='message' style='display:none;'><button type='button' class='close' data-dismiss='alert'>x</button><span id='actiondone'></span></div></td></tr> ";   
            
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
//function activatecounsellors(){
//
//counsellorslistdb.allDocs({include_docs: true, ascending: true}).then(function (da) {
//if(da.total_rows===0){
////getcounsellorslist();
////alert("No loaded list of counsellors");
//
//                      }
//     else {
//       
//            var counsellors="<option value=''>select  Counsellor(s)</option>";
//            var a;
//     for(a=0;a<da.total_rows;a++){
//                var dat={}; 
//           
//	       dat=da.rows[a].doc;
//                
//            if(dat.RRI_Name!==''){
//                if(1===1){
//               // if(dat.isactive===1){
//                    
//           counsellors+="<option data-code='"+dat._id+"' data-fullname=\""+dat.fullname+"\" value='"+dat.RRI_Name+"'>"+dat.fullname+"-"+dat._id+" ["+dat.Currentfacility+"]</option>"
//           
//           
//         
//                                     
//                                     }
//     
//           
//           $("#counsellorreg").html(counsellors);
//          $('#counsellorreg').select2(); 
//          $('#counsellorreg').css('width','100%'); 
//
//        
//            }
//            else {
//             //alert("");
//             console.log("Skipped Counsellor without rri name "+dat.RRI_Name);
//     }
//   
//
//     }//end of row
//
//        }
//});
//
//}







function validateweeklydata(){
    setrowid();
    
    //receive all the fields from the weekly data from
id=$("#rowid").val();

facility=$("#facilityname").val();

counsellor=$("#counsellor").val();

opd_t=$("#opd_t").val();
screened=$("#screened").val();
screenrate=$("#screenrate").val();
opd_eligible=$("#opd_eligible").val();
opd_tested=$("#opd_tested").val();
opd_positive=$("#opd_positive").val();
opd_Yield=$("#opd_Yield").val();
pmtct_tested=$("#pmtct_tested").val();
pmtct_positive=$("#pmtct_positive").val();
pmtct_Yield=$("#pmtct_Yield").val();
index_tested=$("#index_tested").val();
index_positive=$("#index_positive").val();
index_yield=$("#index_yield").val();
self_test=$("#self_test").val();
Referred_Prep=$("#Referred_Prep").val();
gbv=$("#gbv").val();
Total_Tested=$("#Total_Tested").val();
Total_Positive=$("#Total_Positive").val();
Total_Yield=$("#Total_Yield").val();

Total_Linked=$("#Total_Linked").val();
Total_Linkage=$("#Total_Linkage").val();


date_tested=$("#enddate").val();

var user="hsdsa"; 

var currentdate = new Date();
    
var mn=""+(currentdate.getMonth()+1) ;

var dt=""+currentdate.getDate();
    var hr=""+currentdate.getHours();
    var min=""+currentdate.getMinutes();
    var sc=""+currentdate.getSeconds();
    if(mn.length===1){mn='0'+mn;}
    if(dt.length===1){dt='0'+dt;}
    if(hr.length===1){hr='0'+hr;}
    if(min.length===1){min='0'+min;}
    if(sc.length===1){sc='0'+sc;}
    
    
    var timestamp = "" + currentdate.getFullYear() + "-"+ mn + "-"+ dt + " "+ hr+ ":" + min+ ":"+ sc;
    
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
     
     else if(counsellor===''||counsellor==='select  Counsellor')
     {         
  
   alert('Select User');
   //$("#facilityname select:first").focus();
   
   $("#counsellor").css('border-color','red');
    //$("select:first").focus();
     }
     
      else if(checktotaltests()===false){
     
     
     
 }
     
     
 else if(checktotalpositives()===false){
     
     
     
 }
     

else if(date_tested==='') { alert(' Select date tested');  $('#enddate').focus(); }
    
       else {
     var facilitynameandmfl=facility.split("_");        
    // var startd=startdate.replace('-','');      
    // var startd=startd.replace('-','');      
     var endd=enddate.replace('-','');      
     var endd=endd.replace('-',''); 
     var cns=counsellor.replace('-','');
    
   
     id=$("#rowid").val();
      
     var facilityname=facilitynameandmfl[1];
            //save data to the db
            //we are now saving both weekly totals and annual cumulatives on the db
            //add a variable to distinguish the two
            //use _wk
            
  insertdailydata(id,facilityname,counsellor,date_tested,opd_t,screened,screenrate,opd_eligible,opd_tested,opd_positive,opd_Yield,pmtct_tested,pmtct_positive,pmtct_Yield,index_tested,index_positive,index_yield,self_test,Referred_Prep,gbv,Total_Tested,Total_Positive,Total_Yield,Total_Linked,Total_Linkage,timestamp,user, syncstatus) ;
  console.log(id+" @ "+facilityname+" @ "+counsellor+" @ "+ date_tested+" @ "+opd_t+" @ "+screened+" @ "+screenrate+" @ "+opd_eligible+" @ "+opd_tested+" @ "+opd_positive+" @ "+opd_Yield+" @ "+pmtct_tested+" @ "+pmtct_positive+" @ "+pmtct_Yield+" @ "+index_tested+" @ "+index_positive+" @ "+index_yield+" @ "+self_test+" @ "+Referred_Prep+" @ "+gbv+" @ "+Total_Tested+" @ "+Total_Positive+" @ "+Total_Yield+" @ "+Total_Linked+" @ "+Total_Linkage+"@"+ timestamp+"@"+ user+"@"+ syncstatus+"@") ;

 //selectsearchdata();
$("#message").show();
$("#actiondone").html("Data Saved Successfully");
//call the function that loads entered data
//$("#message").hide().delay(800).fade(400);


//console.log('daily data entered');
//open reports tab
 //$('#reportsbutton').click();
 //$('#inpatient_uptake_cmts').focus();
 window.scrollTo(0,0);
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
              var statusicon="<i class='glyphicon glyphicon-cloud-upload' style='color:red;' title='data not exported'></i>";
              if(dat.doc.syncstatus==="Yes"){
                 statusicon=""; 
                  
               }
	     
		 //dbdata+="<tr><td> "+dat.doc.startdate+" </td><td>"+dat.doc.syncstatus+"</td><td>"+dat.doc.facility+"</td><td><button class='btn-info' onclick='loadsaveddailydata(\""+dat.doc._id+"\",\""+dat.doc.facility+"\")'>Edit</button></td></tr>";
		 dbdata+="<tr id=\""+dat.doc._id+"\"><td> "+dat.doc.date_tested+" </td><td> Facility: <b>"+dat.doc.facility+"</b> OPD Att: <b>"+dat.doc.opd_t+"</b> Total Tes: <b>"+dat.doc.Total_Tested+" </b> Total Pos#: <b>"+dat.doc.Total_Positive+"Total Linked:</b> "+dat.doc.Total_Linked+" </td><td><button class='btn-info' onclick='loadsaveddailydata(\""+dat.doc._id+"\",\""+dat.doc.facility+"\",\"no\")'>Edit "+statusicon+"</button><a onclick='loadwhatsappdata(\""+dat.doc._id+"\",\""+dat.doc.facility+"\")'  data-toggle='modal'  href='#whatsappform' class='btn btn-default' ><img src='images/wp.png' style='height:22px;'></a></button></td></tr>";
          	    
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
function appendtablecounsellordata( dbdata1 ) 
{
    
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
             $('#btnDeleteRowcns').hide();  
        }
        else {
            table2.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
           $('#btnDeleteRowcns').show();  
            }
    } );
 
    $('#btnDeleteRowcns').click( function () {
       
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
    
     $("#searchtablediv").html("<table id='searchtable' class='table table-striped table-bordered'><thead><tr><th style='width:30%;'>Date</th><th style='width:50%;'>Summary</th><th style='width:20%;'>Edit</th></tr></thead><tbody>"+dbdata+"</tbody></table>");
         
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
$("#counsellor").val(doc.counselorname);

$("#enddate").val(doc.date_tested);

$("#opd_t").val(doc.opd_t);
$("#screened").val(doc.screened);
$("#screenrate").val(doc.screenrate);
$("#opd_eligible").val(doc.opd_eligible);
$("#opd_tested").val(doc.opd_tested);
$("#opd_positive").val(doc.opd_positive);
$("#opd_Yield").val(doc.opd_Yield);
$("#pmtct_tested").val(doc.pmtct_tested);
$("#pmtct_positive").val(doc.pmtct_positive);
$("#pmtct_Yield").val(doc.pmtct_Yield);
$("#index_tested").val(doc.index_tested);
$("#index_positive").val(doc.index_positive);
$("#index_yield").val(doc.index_yield);
$("#self_test").val(doc.self_test);
$("#Referred_Prep").val(doc.Referred_Prep);
$("#gbv").val(doc.gbv);
$("#Total_Tested").val(doc.Total_Tested);
$("#Total_Positive").val(doc.Total_Positive);
$("#Total_Linked").val(doc.Total_Linked);
$("#Total_Linkage").val(doc.Total_Linkage);

   
     //$('#facilityname').select2(); 
 $('#facilityname').select2();
 $('#counsellor').select2(); 
 $("#counsellor").css('width','100%');
 $("#facilityname").css('width','100%');
 $(".select2-container").css('width','100%');
     
     
     $("#savebutton").hide();
     
     $("#updatebutton").show();
     //$("#savenewbutton").show();
      checkids();
      
//      asklinkage();
//whichfacility();
//specifyFacilityLinked();
//isshowdiedordeclined();
//isshowdeclinedother();
//isshowdeadother();
      
      
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



<!-------------------------------------------------------------->


function loadwhatsappdata(id,facility){
     
      	
	dailydatadb.get(id).then(function (doc) {
  
$('#lbl_date_tested').html(doc.date_tested);
$('#lbl_facility').html(facility);


$('#lbl_opd_t').html(""+doc.opd_t);
$('#lbl_screened').html(""+doc.screened);
$('#lbl_screenrate').html(""+doc.screenrate+" ");
$('#lbl_opd_eligible').html(""+doc.opd_eligible);
$('#lbl_opd_tested').html(""+doc.opd_tested);
$('#lbl_opd_positive').html(""+doc.opd_positive);
$('#lbl_opd_Yield').html(""+doc.opd_Yield);
$('#lbl_pmtct_tested').html(""+doc.pmtct_tested);
$('#lbl_pmtct_positive').html(""+doc.pmtct_positive);
$('#lbl_pmtct_Yield').html(""+doc.pmtct_Yield);
$('#lbl_index_tested').html(""+doc.index_tested);
$('#lbl_index_positive').html(""+doc.index_positive);
$('#lbl_index_yield').html(""+doc.index_yield);
$('#lbl_self_test').html(""+doc.self_test);
$('#lbl_Referred_Prep').html(""+doc.Referred_Prep);
$('#lbl_gbv').html(""+doc.gbv);
$('#lbl_Total_Tested').html(""+doc.Total_Tested);
$('#lbl_Total_Positive').html(""+doc.Total_Positive);

$('#lbl_Total_Yield').html(""+doc.Total_Yield);
$('#lbl_Total_Linked').html(""+doc.Total_Linked);
$('#lbl_Total_Linkage').html(""+doc.Total_Linkage);
$('#lbl_counsellor').html(""+doc.counselorname);


  
});


}

<!-------------------------------------------------------------->






$("#refreshpage" ).click(function() 
{
    window.location.reload();
    cleardailyfields();
   
});

$("#exportdataanchor1" ).click(function() 
{
    checkinternet();
   
});
$("#zeroreportanchor" ).click(function() 
{
    checkinternet();
   
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
id=$("#rowid").val();
facility=$("#facilityname").val();
counsellor=$("#counsellor").val();

date_tested=$("#enddate").val();

opd_t=$("#opd_t").val();
screened=$("#screened").val();
screenrate=$("#screenrate").val();
opd_eligible=$("#opd_eligible").val();
opd_tested=$("#opd_tested").val();
opd_positive=$("#opd_positive").val();
opd_Yield=$("#opd_Yield").val();
pmtct_tested=$("#pmtct_tested").val();
pmtct_positive=$("#pmtct_positive").val();
pmtct_Yield=$("#pmtct_Yield").val();
index_tested=$("#index_tested").val();
index_positive=$("#index_positive").val();
index_yield=$("#index_yield").val();
self_test=$("#self_test").val();
Referred_Prep=$("#Referred_Prep").val();
gbv=$("#gbv").val();
Total_Tested=$("#Total_Tested").val();
Total_Positive=$("#Total_Positive").val();
Total_Yield=$("#Total_Yield").val();
Total_Linked=$("#Total_Linked").val();
Total_Linkage=$("#Total_Linkage").val();


//user=$("#user").val();
timestamp=$("#timestamp").val();


    var user="hsdsa"; 

    var currentdate = new Date();
    
   var mn=""+(currentdate.getMonth()+1) ;
    var dt=""+currentdate.getDate();
    var hr=""+currentdate.getHours();
    var min=""+currentdate.getMinutes();
    var sc=""+currentdate.getSeconds();
    if(mn.length===1){mn='0'+mn;}
    if(dt.length===1){dt='0'+dt;}
    if(hr.length===1){hr='0'+hr;}
    if(min.length===1){min='0'+min;}
    if(sc.length===1){sc='0'+sc;}
    
    
    var timestamp = "" + currentdate.getFullYear() + "-"+ mn + "-"+ dt + " "+ hr+ ":" + min+ ":"+ sc;
    
    
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
     
     else if(counsellor===''||counsellor==='select  Counsellor')
     {         
  
   alert('Select User');
   //$("#facilityname select:first").focus();
   
   $("#counsellor").css('border-color','red');
    //$("select:first").focus();
     }
 
      else if (enddate==='')
     {
         
     alert('Select Reporting Date');
   $("#enddate").focus();    
     } 
     
   else if(checktotaltests()===false){
     
     
     
 }
     
     
 else if(checktotalpositives()===false){
     
     
     
 }

   
       else {
           
     var facilitynameandmfl=facility.split("_");        
    // var startd=startdate.replace('-','');      
     //var startd=startd.replace('-','');      
     var endd=enddate.replace('-','');      
     var endd=endd.replace('-','');      
     var cns=counsellor.replace('-','');
        
     var facilityname=facilitynameandmfl[1];
            //save data to the db
 // saveweeklyupdates(id,facilitynameandmfl[1],enddate,counselorname,modality, tested,positive_tg,positive,linked_here,linked_else,declined,dead,tca,timestamp,user, syncstatus) ;
        
            //________________________________
          
     id=$("#rowid").val();
  
 saveweeklyupdates(id,facilityname,counsellor,date_tested,opd_t,screened,screenrate,opd_eligible,opd_tested,opd_positive,opd_Yield,pmtct_tested,pmtct_positive,pmtct_Yield,index_tested,index_positive,index_yield,self_test,Referred_Prep,gbv,Total_Tested,Total_Positive,Total_Yield,Total_Linked,Total_Linkage,timestamp,user, syncstatus) ;
  
            //
            //________________________________
            
            
            

//call refressh code here

 //selectsearchdata();
$("#message").show();
$("#actiondone").html("Data Updated Successfully");
//call the function that loads entered data
window.scrollTo(0,0);
console.log('weekly data updated');

//$('#reportsbutton').click();
//$('#inpatient_uptake_cmts').focus();
setTimeout(delayedrefresh,1800);
//delayedrefresh();
       }
       
    
}
   
function saveweeklyupdates(id,facilityname,counsellor,date_tested,opd_t,screened,screenrate,opd_eligible,opd_tested,opd_positive,opd_Yield,pmtct_tested,pmtct_positive,pmtct_Yield,index_tested,index_positive,index_yield,self_test,Referred_Prep,gbv,Total_Tested,Total_Positive,Total_Yield,Total_Linked,Total_Linkage,timestamp,user, syncstatus) {
 
 
 
 
 dailydatadb.get(id).then(function (doc) {
        
  //doc.age = 4;
 //alert(id);
   if(id!=='null' && id!=='' ){
        //doc._id=id;
  
doc.facility=facilityname;
doc.counselorname=counsellor;
doc.date_tested=date_tested;

doc.opd_t=opd_t;
doc.screened=screened;
doc.screenrate=screenrate;
doc.opd_eligible=opd_eligible;
doc.opd_tested=opd_tested;
doc.opd_positive=opd_positive;
doc.opd_Yield=opd_Yield;
doc.pmtct_tested=pmtct_tested;
doc.pmtct_positive=pmtct_positive;
doc.pmtct_Yield=pmtct_Yield;
doc.index_tested=index_tested;
doc.index_positive=index_positive;
doc.index_yield=index_yield;
doc.self_test=self_test;
doc.Referred_Prep=Referred_Prep;
doc.gbv=gbv;
doc.Total_Tested=Total_Tested;
doc.Total_Positive=Total_Positive;
doc.Total_Yield=Total_Yield;
doc.Total_Linked=Total_Linked;
doc.Total_Linkage=Total_Linkage;


doc.user=user;
doc.timestamp=timestamp;
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
    
    var returnedresponses=0;
   // $('#exportbutton').on('click',function() {
    $("#exportbutton").prop("disabled",true);
    $("#exportbutton").removeClass('btn-lg btn-success').addClass('btn btn-default');

var recordsunexported=$("#unexported").val();
                //read db files that have not been synced
    
  $("#exportbutton").hide();
  $("#exportmsg").show();
   $("#exportresponse").append("<b><font color='orange'>Exporting data.. please wait for response.</b><br/>");
  
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

           
        var hrf=" <button class='btn-sm button-info' data-dismiss='modal' onclick=\"loadsaveddailydata('"+dat.doc._id+"','"+dat.doc.facility+"','no"+missingcommentid+"'); \"> Enter Comments</button>";
           

        
 if(skipexporting===0)
 {
            
  updatesyncstatus(dat.doc._id,'Yes');
        
        
            
    $.ajax({
                        url:'importworkload',                            
                        type:'get', 
data:{

id:dat.doc._id,
facility:dat.doc.facility,
counselorname:dat.doc.counselorname,
date_tested:dat.doc.date_tested,
opd_t:dat.doc.opd_t,
screened:dat.doc.screened,
screenrate:dat.doc.screenrate,
opd_eligible:dat.doc.opd_eligible,
opd_tested:dat.doc.opd_tested,
opd_positive:dat.doc.opd_positive,
opd_Yield:dat.doc.opd_Yield,
pmtct_tested:dat.doc.pmtct_tested,
pmtct_positive:dat.doc.pmtct_positive,
pmtct_Yield:dat.doc.pmtct_Yield,
index_tested:dat.doc.index_tested,
index_positive:dat.doc.index_positive,
index_yield:dat.doc.index_yield,
self_test:dat.doc.self_test,
Referred_Prep:dat.doc.Referred_Prep,
gbv:dat.doc.gbv,
Total_Tested:dat.doc.Total_Tested,
Total_Positive:dat.doc.Total_Positive,
Total_Yield:dat.doc.Total_Yield,
Total_Linked:dat.doc.Total_Linked,
Total_Linkage:dat.doc.Total_Linkage,


user:dat.doc.user,
timestamp:dat.doc.timestamp
},
dataType:'html',  
                    success: function(data) {
                       
                       returnedresponses++;
                       
                        $("#exportresponse").append("<b>*"+data+'</b><br/>');
                         
                
                         
                   //doc.syncstatus="Yes"; 
   //alert('called');
  // put them back
                   // return dailydatadb.put(doc); 
                   console.log(parseInt(returnedresponses)+" vs "+parseInt(recordsunexported));
                   
                   if(parseInt(returnedresponses)===parseInt(recordsunexported)){
                 $("#exportbutton").show();
                 $("#exportmsg").hide();
                 if(returnedresponses<1000){
                 $("#exportresponse").append("<br/>.<br/>.<br/>.<br/><b><font color='green'><b>"+returnedresponses+" records</b> completed successfully. </b>"); 
                 
                 
                 if(parseInt(recordsunexported)===1)
                 {     
                  
                    $("#screenshotwp").click();                        
                                            
                 }
                 
             //setTimeout(delayedrefresh,2000);
            }
             else {
                      $("#exportresponse").append("<b><font color='orange'>Exporting did not complete successfully.</b>"); 
                 
             }
                       
                   }
        
                                        },
                                 error:function(xhr, s, e){
                                     
                                     console.log("Could not export data");
                                     
                                     $("#exportresponse").append("<b><font color='red'>Exporting did not complete successfully  .</b>"+e); 
                // updatesyncstatus(dat.doc._id,'No');
                                  returnedresponses=1000;   
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
                 
           
                  
             
            if(c===(doc.total_rows-1)){
//                  //$("#exportbutton").show();
//                 //$("#exportmsg").hide();
//                 $("#exportresponse").append("<b><font color='orange'>Exporting Completed.</b>");
  
                      }
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



function exportalldata(){
    
    var returnedresponses=0;
   // $('#exportbutton').on('click',function() {
    $("#exportbutton1").prop("disabled",true);
    $("#exportbutton1").removeClass('btn-lg btn-success').addClass('btn btn-default');

 $("#exportbutton").prop("disabled",true);
 $("#exportbutton").removeClass('btn-lg btn-success').addClass('btn btn-default');

var recordsunexported=$("#unexported").val();
                //read db files that have not been synced
    
  $("#exportbutton1").hide();
  $("#exportmsg1").show();
   $("#exportresponse1").append("<b><font color='orange'>Exporting all data.. please wait response.</b><br/>");
  
  
   $("#exportbutton").hide();
  $("#exportmsg").show();
   $("#exportresponse").append("<b><font color='orange'>Exporting all data.. please wait response.</b><br/>");
  
  
  
  dailydatadb.allDocs({include_docs: true, descending: true}).then( function(doc) { 
 syncstatusarray=[];
      //read where sync is 0
	   var skipexporting=0;
	   for(c=0;c<doc.total_rows;c++){
               $("#exportbutton1").hide();
               $("#exportmsg1").show();
               
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
        if(dat.doc.syncstatus==="No" || dat.doc.syncstatus==="0" || dat.doc.syncstatus==="no"  || dat.doc.syncstatus==='Yes')
                        {

           
              var hrf=" <button class='btn-sm button-info' data-dismiss='modal' onclick=\"loadsaveddailydata('"+dat.doc._id+"','"+dat.doc.facility+"','no"+missingcommentid+"'); \"> Enter Comments</button>";
           

        
        if(skipexporting===0){
            
            updatesyncstatus(dat.doc._id,'Yes');
        
        
            
             $.ajax({
                         url:'importworkload',                            
                        type:'get', 
data:{

id:dat.doc._id,
facility:dat.doc.facility,
counselorname:dat.doc.counselorname,
date_tested:dat.doc.date_tested,

opd_t:dat.doc.opd_t,
screened:dat.doc.screened,
screenrate:dat.doc.screenrate,
opd_eligible:dat.doc.opd_eligible,
opd_tested:dat.doc.opd_tested,
opd_positive:dat.doc.opd_positive,
opd_Yield:dat.doc.opd_Yield,
pmtct_tested:dat.doc.pmtct_tested,
pmtct_positive:dat.doc.pmtct_positive,
pmtct_Yield:dat.doc.pmtct_Yield,
index_tested:dat.doc.index_tested,
index_positive:dat.doc.index_positive,
index_yield:dat.doc.index_yield,
self_test:dat.doc.self_test,
Referred_Prep:dat.doc.Referred_Prep,
gbv:dat.doc.gbv,
Total_Tested:dat.doc.Total_Tested,
Total_Positive:dat.doc.Total_Positive,
Total_Yield:dat.doc.Total_Yield,
Total_Linked:dat.doc.Total_Linked,
Total_Linkage:dat.doc.Total_Linkage,

user:dat.doc.user,
timestamp:dat.doc.timestamp
},
dataType: 'html',  
                    success: function(data) {
                       
                       returnedresponses++;
                       
                        $("#exportresponse1").append("<b>*"+data+'</b><br/>');
                        $("#exportresponse").append("<b>*"+data+'</b><br/>');
                         
                
                         
                   //doc.syncstatus="Yes"; 
   //alert('called');
  // put them back
                   // return dailydatadb.put(doc); 
                   console.log(parseInt(returnedresponses)+" vs "+parseInt(doc.total_rows));
                   
                 if(parseInt(returnedresponses)===parseInt(doc.total_rows)){
                 $("#exportbutton1").show();
                 $("#exportmsg1").hide();
                 if(returnedresponses<1000)
            {
             $("#exportresponse1").append("<br/>.<br/>.<br/>.<br/><b><font color='green'><b>"+returnedresponses+" records</b> completed successfully. </b>"); 
             $("#exportresponse").append("<br/>.<br/>.<br/>.<br/><b><font color='green'><b>"+returnedresponses+" records</b> completed successfully. </b>"); 
             //setTimeout(delayedrefresh,2000);
            }
             else 
             {
             $("#exportresponse1").append("<b><font color='orange'>Exporting did not complete successfully.</b><br/>"); 
             $("#exportresponse").append("<b><font color='orange'>Exporting did not complete successfully.</b><br/>"); 
                 
             }
                       
                   }
        
                                        },
                                 error:function(xhr, s, e)
                                 {
                                     
                   console.log("Could not export data");
                                     
                   $("#exportresponse1").append("<b><font color='red'> Exporting did not complete successfully  .</b><br/>"+e); 
                   $("#exportresponse").append("<b><font color='red'> Exporting did not complete successfully  .</b><br/>"+e); 
                // updatesyncstatus(dat.doc._id,'No');
                                  returnedresponses=1000;   
                                 }       
                        
                         });
            
                        }//end of if skipp exporting === 0
                        //for annual exports, dont sync and dont show alert
                        else if (skipexporting!==0 && idyangu.indexOf("annual")>=0) {
                       //dont show export failure message     
                            
                        }
            else {
                
                
                $("#exportresponse1").append("<br/><b>NOTE:</b><font color='red'> Data for <b>"+dat.doc.facility+"</b> not uploaded due to missing comment(s) on section <b><i>"+missingcomment+"</i></b></font> "+hrf+" <br/>");
                $("#exportresponse").append("<br/><b>NOTE:</b><font color='red'> Data for <b>"+dat.doc.facility+"</b> not uploaded due to missing comment(s) on section <b><i>"+missingcomment+"</i></b></font> "+hrf+" <br/>");
            }
                        }
        
                 
                 
                 //if its last loop show
                 
           
                  
             
            if(c===(doc.total_rows-1)){
//                  //$("#exportbutton").show();
//                 //$("#exportmsg").hide();
//                 $("#exportresponse").append("<b><font color='orange'>Exporting Completed.</b>");
  
                      }
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




function updatesyncstatus(id,st){
  
dailydatadb.get(id).then(function (doc1) {
      console.log(id+" sync status updated");
 doc1.syncstatus=st;
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
	$("#unexported").val(cnt1);
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
$("#zeroreportform").submit(function(e){
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
    
     var exelstart="2018-10-01";
    var exelend="2019-09-30";
    
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
             
                var ur=hostname+""+rpttypeurl+"?startdate=" + startdate + "&enddate=" + enddate+ "&county=" + cnty ;
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


function ConfirmDeleteever()
    {
      var y = confirm("Are you sure you want to delete all the data from this device ?");
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


//for PNS supported facilities



function validateAge(){
    
     var miakangapi=$("#age").val();
     
     if(miakangapi.startsWith("0")){
     $("#age").val("");    
         
     }
     //alert(miakangapi);
    
                      }

//validatemodalities();

//$("#counsellorfacil").show();










function setrowid(){
    var id="";
    
    var f=$("#facilityname").val();
    var mfl=f.split("_")[0];
    var dt=$("#enddate").val();
    dt=dt.replace('-','');
    
    var id=mfl+"_"+dt;
    
    $("#rowid").val(id);
    
   console.log(" id sasa ni "+id); 
}






function autobackup(){
//alert("save called");   
var  kunainternet="";  



$.ajax({
                 url:'validateAccess',                            
            type:'get',  
            dataType: 'html',  
            success: function(data) {
   var unexported=0;

         var cii;
          dailydatadb.allDocs({include_docs: true, descending: true}).then( function(doc) { 

   for(cii=0;cii<doc.total_rows;cii++){


   var dat={};
   dat=doc.rows[cii];


if(dat.doc.syncstatus==="No" || dat.doc.syncstatus==="0" || dat.doc.syncstatus==="no")
                {
                unexported++;
                console.log("Ni mara ya "+unexported);
                if(unexported===20){
                 $('#exportdataanchor1').click();
                 $('#exportbutton').click();

break;


                }
                }

                                        }

                                        }).then(function (){




}).catch(function (err){ console.log(err); });




            },

       error: function(XMLHttpRequest, textStatus, errorThrown) {
// alert(errorThrown);

}

    });



}


autobackup();



function setmflcode(){
 //If someone is linked in the currently selected facility, autofill the mflcode
//cccno
//check current facil
    var fullfacil=$("#facilityname").val();
    var facilmfl="";
   
    
    if(fullfacil!==''){
          facilmfl=fullfacil.split("_")[0]+'-';
                }
    
    var linked_here=$("#linked_site").val();
    
    if(linked_here==='This Facility'  && $("#cccno").val()===''){
        
     $("#cccno").val(""+facilmfl);   
    }
    
    
    
    
    
}

//$("#counsellorfacil").show();

function clearsws(){
    
    //caches.delete(/*name*/);
  navigator.serviceWorker.getRegistrations()
  .then(registrations => {
    registrations.forEach(registration => {
      registration.unregister();
    }) ;
  });
  console.log("clearing cache");
 
// let id = "your-cache-id";
//        
//  caches.open(id)
//.then(cache => cache.keys()
//  .then(keys => {
//    for (let key of keys) {
//      cache.delete(key);
//    }
//  }));


(function (){
  var rep = /.*\?.*/,
      links = document.getElementsByTagName('link'),
      scripts = document.getElementsByTagName('script'),
      process_scripts = false;
  for (var i=0;i<links.length;i++){
    var link = links[i],
        href = link.href;
    if(rep.test(href)){
      link.href = href+'&'+Date.now();
    }
    else{
      link.href = href+'?'+Date.now();
    }

  }
  if(process_scripts){
    for (var i=0;i<scripts.length;i++){
      var script = scripts[i],
          src = script.src;
      if(rep.test(src)){
        script.src = src+'&'+Date.now();
      }
      else{
        script.src = src+'?'+Date.now();
      }

    }
  }
})();
Cache.delete();
   location.reload(true);
//   window.location.reload();
}



$('#clearcachebtn').click(function() {
    $.ajax({
        url: "",
        context: document.body,
        success: function(s,x){

            $('html[manifest=htsrriv1.appcache]').attr('content', '');
                $(this).html(s);
        }
    }); 
});




function cleardata()
{
    
    if(ConfirmDeleteever()===true){
    
    dailydatadb.destroy(function (err, response) {
   if (err) {
      return console.log(err);
   } else {
      console.log ("Data Database Deleted");
     // $("#resetdbbtn").hide();
      $("#cleardatabtn").html("Data deleted successful!");
      window.location.reload();
      
   }
                                        });
    
        }
}




function validatemodalitiesbygender(){
    
  var sex=$("#gender").val();
  
  if(sex==='Male'){  
$("#modality option[value='anc1']").attr("disabled",true); 
$("#modality option[value='anc2']").attr("disabled",true);
$("#modality option[value='ld']").attr("disabled",true); 
$("#modality option[value='pnc']").attr("disabled",true); 

$("#modality option[value='vmmc']").attr("disabled",false);
                  }
  else if(sex==='Female')
                  {  
$("#modality option[value='vmmc']").attr("disabled",true);
  
$("#modality option[value='anc1']").attr("disabled",false); 
$("#modality option[value='anc2']").attr("disabled",false);
$("#modality option[value='ld']").attr("disabled",false); 
$("#modality option[value='pnc']").attr("disabled",false);  
        
                  }
    
}





   var zeroreportdb = new PouchDB('htszeroreports');
var remoteCouch = false;
var blankreportde;

//receive the artist, song title and lyrics text
function savezeroreport()
{
    
    var datee=$("#zeroreportdate").val();
    var facilitii=$("#facilityname_zerorpt").val();
    
    
        if(facilitii===''){ alert("Select Facilty");}
        else if(datee===''){ alert("Select Date");}
        
        else{
    $.ajax({
        url:'submitZero',
        type:'get',
        data:{ 
            date:datee,
            facil:facilitii },
        dataType:'html',
        success: function(data) {
        {
    
        $("#savezeromsg").html(data);
            
        }
        
        
                                 }

});
}
    
//blankreportde = 
//           {
//            _id:""+datee+facilit, //this is static since we cant have two users using the same phone
//	    date:datee,
//        facility:facilit,
//            zero:0,        
//       completed:false
//           };
//  zeroreportdb.put(blankreportde, function callback(err, result) {
//    if (!err) {
//      console.log('zero report submitted succesfully');
//              }
//          else{
//        console.log(err);
//              }
//    
//    //setTimeout(delayedrefresh,1500);
//  });
  
  
  
}


</script>

<script>



          if ('serviceWorker' in navigator) {
  window.addEventListener('load', function() {
    navigator.serviceWorker.register('sw1.js').then(function(registration) {
      // Registration was successful
      console.log('HTS ServiceWorker registration successful with scope: ', registration.scope);
    }, function(err) {
      // registration failed :(
      console.log('ServiceWorker registration failed: ', err);
    });
  });
}





if($("#toolid").is(":visible")){
                    $("#refreshpage").hide();
                } else{
                   $("#refreshpage").show();
                }
                
                
                
                
                 function percent(num,den,destination){
           
         var rptd=$("#"+num).val();
         var vrfd=$("#"+den).val();
           
           if(rptd!=='' && rptd!==null && vrfd!=='' && vrfd!==null && !isNaN(rptd) && !isNaN(vrfd)){
            //get the variance between the two..   
           // var largest=Math.Max(val1,val2); 
           rptd=parseInt(rptd);
           vrfd=parseInt(vrfd);
         
            if(vrfd===0){vrfd=1;}
            
            var conc= Math.round(((rptd/vrfd)*100));
            if(isNaN(conc)){
                
               conc=0; 
            }
            
            
            $("#"+destination).val(conc+"%");
             //alert(conc);
           }
           
           
           
       }
       
       //percent removeFirstZero
       // var difference = function (val1, val2) { return Math.abs(val1 - val2); };
       
       function removeFirstZero(elem){
           
           
           var vl=$("#"+elem).val();
           
           if(vl.length>=2 && vl.startsWith("0"))
           {
               
               vl=vl.replace("0","");
               $("#"+elem).val(vl);
                  // alert(vl);
           }
           
       
           
       }
       
       
     function runValidation(num,den,destination){
           
         var nume=$("#"+num).val();
         var denom=$("#"+den).val();
           
           if(nume!=='' && nume!==null && denom!=='' && denom!==null && !isNaN(nume) && !isNaN(denom)){
            //get the variance between the two..   
           // var largest=Math.Max(val1,val2); 
           nume=parseInt(nume);
           denom=parseInt(denom);
         var haserror=false;
            if(nume>denom){haserror=true;
                
            $("#"+destination).focus();
             $("#"+num).css({"border-color": "red"});
             $("#"+den).css({"border-color": "red"});
            $("#utumani").html("<font color='red' style='height:45px;'>"+num+" cannot be greater than "+den+"</font>");
            
            }
            else {
                
              $("#"+num).css({"border-color": "#337ab7"});
             $("#"+den).css({"border-color": "#337ab7"});  
              $("#utumani").html("Note: Please enter data for all input fields");
          
             
            }
            
         
          
            
             //alert(conc);
           }
           
           
          
           
           
       }  
       
     
    function checktotaltests()
    {        
     
     var retvl=true;
     
            var opdts=$("#opd_tested").val();
            var pmtctts=$("#pmtct_tested").val();   
//            var vctts=$("#vct_tested").val();   
            var pnsts=$("#index_tested").val();  
            var totalts=$("#Total_Tested").val();  
             
//            if(opdts===""){}
               if(opdts==='' || opdts===null || isNaN(opdts)){ opdts=0; }
           if(pmtctts==='' || pmtctts===null || isNaN(pmtctts)){ pmtctts=0; }
//          else if(vctts==='' || vctts===null || isNaN(vctts)){ vctts=0; }
           if(pnsts==='' || pnsts===null || isNaN(pnsts)){ pnsts=0; }
           if(totalts==='' || totalts===null || isNaN(totalts)){ totalts=0; }
               if(parseInt(totalts)<(parseInt(opdts)+parseInt(pmtctts)+parseInt(pnsts))){
                   
             $("#Total_Tested").focus();
             $("#Total_Tested").css({"border-color": "red"});
            
            $("#utumani").html("<font color='red' style='height:45px;'>Total Tested cannot be less than Tested for Index, OPD and PMTCT Modalities</font>");
            alert("Total Tested cannot be less than sum of Clients tested under PMTCT , OPD , PNS Tested");
            retvl=false;
            }
            else {
                
              $("#Total_Tested").css({"border-color": "#337ab7"});              
              $("#utumani").html("Note: Please enter data for all input fields");
          retvl=true;
             
            }
               //compare with sum of all tests
               return retvl;
           
    }
    
     function checktotalpositives()
    {        
     var retvl=true;
            var opdts=$("#opd_positive").val();
            var pmtctts=$("#pmtct_positive").val();   
           // var vctts=$("#vct_positive").val();   
            var pnsts=$("#index_positive").val();  
            var totalts=$("#Total_Positive").val();  
             
            
               if(opdts==='' || opdts===null || isNaN(opdts)){ opdts=0; }
           if(pmtctts==='' || pmtctts===null || isNaN(pmtctts)){ pmtctts=0; }
         // else if(vctts==='' || vctts===null || isNaN(vctts)){ vctts=0; }
           if(pnsts==='' || pnsts===null || isNaN(pnsts)){ pnsts=0; }
           if(totalts==='' || totalts===null || isNaN(totalts)){ totalts=0; }
               if(parseInt(totalts)<(parseInt(opdts)+parseInt(pmtctts)+parseInt(pnsts))){
                   
                   console.log("totalts "+totalts+" vs opdts ("+opdts+") + pmtctts ("+pmtctts+") + pnsts ("+pnsts+")");
                   
             $("#Total_Positive").focus();
             $("#Total_Positive").css({"border-color": "red"});
            
            $("#utumani").html("<font color='red' style='height:45px;'>Total Positive cannot be less than sum of Positive for OPD , PMTCT , PNS </font>");
            alert("Total Positive cannot be less than sum of Positive for OPD , PMTCT , PNS ");
            
            retvl=false;
            
            }
            else {
                
              $("#Total_Positive").css({"border-color": "#337ab7"});              
              $("#utumani").html("Note: Please enter data for all input fields");
          
             retvl=true;
            }
               //compare with sum of all tests
           return retvl;
    }
     
  
    
// $(function() { 
    $("#tumawp").click(function() { 
    
    html2canvas(document.querySelector('#whatsappform')).then(canvas => {
    $('#visa').html(canvas);
});




    
//        getScreenshotOfElement($("#whatsappform"), 0, 0, 100, 100, function(data) {
//    // in the data variable there is the base64 image
//    // exmaple for displaying the image in an <img>
//     saveAs(data, "Facility_Workload.png");
//    $("#pisa").attr("src", "data:image/png;base64,"+data);
//});
        
        
//        html2canvas($("#whatsappform"), {
//            onrendered: function(canvas) {
//                var theCanvas = canvas;
//                canvas.toBlob(function(blob) {
//                    saveAs(blob, "Facility_Workload.png"); 
//                });
//            }
//        });
    });
//});
   
  
function getScreenshotOfElement(elem, posX, posY, width, height, callback) {
    html2canvas(elem, {
        onrendered: function (canvas) {
            var context = canvas.getContext('2d');
            var imageData = context.getImageData(posX, posY, width, height).data;
            var outputCanvas = document.createElement('canvas');
            var outputContext = outputCanvas.getContext('2d');
            outputCanvas.width = width;
            outputCanvas.height = height;

            var idata = outputContext.createImageData(width, height);
            idata.data.set(imageData);
            outputContext.putImageData(idata, 0, 0);
            callback(outputCanvas.toDataURL().replace("data:image/png;base64,", ""));
        },
        width: width,
        height: height,
        useCORS: true,
        taintTest: false,
        allowTaint: false
    });
}





</script>
 <!--
facilityname
counsellor
opd_attendance
screened
screenrate
opd_eligible
opd_tested
opd_positive
opd_Yield

pmtct_tested
pmtct_positive
pmtct_Yield



index_tested
index_positive
index_yield

self_test
Referred_Prep
gbv
Total_Tested
Total_Positive
Total_Yield
Total_Linked
Total_Linkage
 
 vct_tested
vct_positive
vct_Yield
 
-->
	</body>
</html>
