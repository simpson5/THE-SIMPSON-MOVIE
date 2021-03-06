
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/reset/common.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/content.css" />
    
    <script src="<%= request.getContextPath() %>js/jquery-3.6.0.js"></script>
    <script src="<%= request.getContextPath() %>js/jquery.easing.1.3.js"></script>
    <title>Find My Info</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
     <script src= "https://unpkg.com/sweetalert/dist/sweetalert.min.js"> </script> 
    
</head>    
<body id="KOR" data-device="0" oncontextmenu="return false" onselectstart="return false" ondragstart="return false"> <!-- KOR / ENG / JPN / CHN-CN / CHN-TW -->
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%
			String pwd = (String)request.getAttribute("password");
		
%>
<style>
   .header_common {
      color : black;
      position : static;
      margin-left: 0;
      width: 1024px
   }
   
   .header_common a {
      color : black;
   }
   
   .scroll_menu {
      margin-top: -10vh;
      width: 1024px
   }
   
   .scroll_menu ul{
   	  margin-left: 244px;
   }
   
   .screen-poster-container {
   	 margin-top: 5vh;
   	 width: 1024px
   }
   
   input{
   
   color : black;
   }
</style>
	
    
    <!-- mast body -->
    <div id="mast-body">
        <div class="container">
            <!-- toparea -->
            <div class="toparea">
                <h2 class="title">
                    <br>
                    &emsp;?????? ????????? ???????????? ????????? ?????????!<!-- ?????????????????? -->
                </h2>
                <div class="headline">
                    &emsp;???????????? ??????
                    <br />
                    <br />
           
                   
                </div>
            </div>
            
<form id="memberFindFrm" method="GET" >     
  	<section class="findIfo">
            <div class="contents">
    
                <!-- section : ???????????? ?????? -->
                <div class="section __half">
                    
                     <!--??? ???????????? -->
                    <div class="row" id="div-pswd">
                        <div class="col-md">
                            <label> ????????? <br><br></label> 
                            <span> ?????? </span> 
                        </div>
                        <div class="col-md">
                             <div class="inner">
                                   <div class="ui-input active">
                                       <input input type="text" placeholder="?????????" name="member_id" size=30 > 
                                   </div>
                            	</div>
                            	<div class="inner">
                                   <div class="ui-input active" style="margin: 15px 5px;">
                                       <input type="text" placeholder="??????" name="member_name" size=30  > 
                                   </div>
                                   <div class="inner">                                 
										<input type="button" value="???????????? ??????" id="find" style="width:60px%; background-color: #ffd509; border: 1px solid #ffd509;" />
                                  </div> 
                            	</div>
                           </div>
                       </div>

                    
                    <!-- <div class="description"></div> -->
                        <div class="btn_btm_wrap">
                            <a href="<%= request.getContextPath()%>/member/login" class="btn_col3 ty6 open3"  style="background-color: #1793ff; border: 1px solid #1793ff;">?????????</a>
                            <a href="<%= request.getContextPath()%>/member/enroll" class="btn_col3 ty6 open"  style="background-color: #ffd509; border: 1px solid #ffd509;">????????????</a>
                        </div>
                    </div>
                </div>              
    		</section>
 		</form>
	</div>
</div>
 	
    
<style>
.footer{margin-top : 10vh;}
</style>
<script>


	var $password = "<%=pwd%>";
	
	

	
$("#find").click(function(){
	
	$("#memberFindFrm")
	.attr("action","<%=request.getContextPath() %>/member/findPassword")
	.submit();
	
	
	 
});


	
if($password!= ""){
	 
	 swal({
		  title: "???????????? ???????????????",
		  text: $password+"?????????.",
		  icon: "info",
		  buttons: true,
		  dangerMode: true,
		}).then((willDelete)=> {
		if (willDelete) {
		$(document.memberDelFrm).submit();
		swal("????????????", {
		icon: "success",
		});
		} else {
		swal("????????? ????????????!");
		}
	});
}


</script>
 
  <%@ include file="/WEB-INF/views/common/footer.jsp"%>