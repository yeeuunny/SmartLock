<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="smartlock.license.vo.LicenseManagerVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="softwareUser" />
</jsp:include>

<div class="container">
		<!-- Service Panels -->
		<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">라이선스 요청</h1>
				<!--
				<ol class="breadcrumb">
					<li><a href="License_user.html">라이선스 발급현황</a></li>
					<li><a href="License_user_request.html">라이선스 요청현황</a></li>
				</ol>
				-->
			</div>
			<!-- 검색필터-->
			<div class="row">
				
				<div class="col-md-4"></div>
				<div class="col-md-4">

					<div class="panel text-center">
						<div class="panel-body" align="left">
						<h4>프로그램 사용을 위한 라이선스를 요청합니다.</h4>
							<hr>
							<form>
								<label>회사명</label><br>
								<div class="input-group">
									<select name="corp_name" id="corp_name"
										style="width:335px; height: 35px;">
										<option value="">${software.corp_name }</option>
									</select>
								</div>
								<br>
								<label>소프트웨어명</label>
								<div class="input-group">
									<select name="sw_name" id="sw_name"
										style="width: 335px; height: 35px;">
										<option value="">${software.sw_name }</option>
									</select>
								</div>
								<br>
								<label>종류</label><br>
								<div class="input-group">
									<select name="state" id="state"
										style="width: 335px; height: 35px;">
										<option value="0">종류</option>
										<option value="1">정식 버젼</option>
										<option value="2">데모 버젼</option>
									</select>
								</div>
								
							<br>
							</form>
							<div align="center">
							<a class="btn btn-lg btn-default btn-block" onclick="request();" style="width:180px">라이선스
								요청하기</a>
								</div>
						</div>
					</div>

				</div>
			</div>

			<!-- 검색필터-->
		</div>
</div>
<!-- /.container -->
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />


<script>
	function request(){
		var tmp = document.getElementById("state");
		var state = tmp.options[tmp.selectedIndex].value;
		if(state == 0){
			//alert("라이선스 형태를 선택해주세요.");
			swal({
	  			text: "라이선스 형태를 선택해주세요.",
	  			icon: "warning",	//error, success, info, warning
	  			button : {
				  confirm : "확인",
			  },
	  		  dangerMode: false,
			});
		} else {
			//var result = confirm("요청하시겠습니까?");
			swal({
	  			text: "요청하시겠습니까?",
	  			icon: "info",	//error, success, info, warning
	  			buttons : {
				  	cancel : "취소",
	  				confirm : "확인",
			  },
	  		  dangerMode: false,
			}).then(function(isConfirm){
				if(isConfirm == true){
					$.ajax({
						url:"/software/user/request/final",
						type:"POST",
						contentType: "application/json",
					 	data : JSON.stringify({
					 		corp_name : '${software.corp_name}',
					 		sw_name : '${software.sw_name}',
					 		sw_id : '${sw_id}', 
					 		state : state
					}),
		         success : function (data) {
		        	 window.location = "/software/user/request/final";
		         },
		         error : function(data, textStatus, errorThrown) {
		             console.log(data);
		         }
				});
				} else {
					//alert("요청을 취소합니다.");
					swal({
			  			text: "요청을 취소합니다.",
			  			icon: "info",	//error, success, info, warning
			  			button : {
			  				confirm : "확인",
					  },
					  dangerMode: false,
					});
					window.location="/software/user";
				}
			});
		}
	}
</script>
<jsp:include page="include/_jslib.jsp" />
