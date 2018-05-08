<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="smartlock.license.vo.LicenseManagerReqVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="license" />
</jsp:include>

<!-- Header Carousel -->
<div class="container" id="pageContainer">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				라이선스 관리 <small>발급 대기 현황</small>
			</h1>
			<ol class="breadcrumb">
				<li class="active">발급 대기 현황</li>
				<li><a href="/license/manager?order=DEFAULT"
				data-toggle="tooltip" data-placement="bottom" title="발급 완료 현황">발급 완료 현황</a></li>
				<li><a href="/license/manager/request?order=DEFAULT&state=REFUSE"
				data-toggle="tooltip" data-placement="bottom" title="발급 거절 현황">발급 거절 현황</a></li>
			</ol>
		</div>
	</div>
	
	<c:choose>
		<c:when test = "${empty swNameList}">
			<div class="row">
				<div class="col-lg-12">
					<br><br><br>
					<img class="img-responsive" style="margin-left: auto; margin-right: auto; display: block;"
			 			width="100px"  src="/front/img/no_result.png" alt="">
					<h3 align="center">요청받은 라이센스가 존재하지 않습니다.</h3>
				</div>
				<br><br>
			</div>
		</c:when>
		<c:when test = "${!empty swNameList}">
			<div class="row">
				<div class="row">
					<div class="col-sm-12">
						<div class="col-sm-2">
							<div class="input-group">
								<select id="sw_list" style="width: 180px; height: 35px;" data-toggle="tooltip" data-placement="bottom" title="소프트웨어">
									<option value="">소프트웨어명</option>
									<c:forEach var="sw" items="${swNameList}" varStatus="count">
										<option value="${swIdList[count.count-1]}">${sw}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="input-group">
								<select id="order" style="width: 180px; height: 35px;" data-toggle="tooltip" data-placement="bottom" title="만료 날짜">
									<option value=0>신청 날짜</option>
									<option value=1>오름차순</option>
									<option value=2>내림차순</option>
								</select>
							</div>
						</div>
		
						<div class="col-sm-6">
							<!-- <input type="text" class="col-md-4" placeholder="검색어를 입력하세요"
								id="searchField" style="width: 300px; height: 35px;">&nbsp;&nbsp; -->
							<button class="btn btn-primary" type="button" id="searchButton" onclick="search();"
								data-loading-text="Searching.." data-toggle="tooltip" data-placement="bottom" title="검색">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
		
				</div>
				<br>
				<!-- 검색필터-->
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h2 class="text-center"></h2>
					</div>
					<div id="no-more-tables">
						<table
							class="col-sm-12 table-bordered table-striped table-condensed cf">
							<thead class="cf" align="center">
								<tr>
									<td width="10px"><h4>
											<b>No. 
										</h4></td>
									<td width="250px"><h4>
											<b>소프트웨어명
										</h4></td>
									<td width="100px"><h4>
											<b>이름
										</h4></td>
									<td width="100px"><h4>
											<b>신청날짜
										</h4></td>
									<td width="150px"><h4>
											<b>분류
										</h4></td>
									<td width="100px"><h4>
											<b>상세보기
										</h4></td>
								</tr>
							</thead>
							<tbody align="center">
								<c:set var="cnt" value="1"/>
								<c:forEach var="license" items="${licenseManagerReqList}"
									varStatus="count">
									<c:if test="${license.state ne 3}">
									<tr>
										<td data-title="No.">${cnt}</td>
										<td data-title="소프트웨어">${license.sw_name }</td>
										<td data-title="이름">${license.user_name}</td>
										<td data-title="신청날짜"><fmt:formatDate
												value="${license.request_date}" pattern="yyyy-MM-dd" /></td>
										<c:choose>
											<c:when test="${license.state eq 1 }">
												<td data-title="분류"><span class="label label-success"
												data-toggle="tooltip" data-placement="bottom" title="정식 라이선스 요청">
														정식 라이선스 요청 </span></td>
											</c:when>
											<c:when test="${license.state eq 2}">
												<td data-title="분류"><span class="label label-warning"
												data-toggle="tooltip" data-placement="bottom" title="데모 라이선스 요청">
														데모 라이선스 요청</span></td>
											</c:when>
										</c:choose>
										<td data-title="요청처리"><span class="label"
											style="background-color: indianred; color: white; cursor: pointer;"
											onclick="licenseOk('${license.sw_name}', '${license.sw_id }','${license.state }', '${license.id }');"
											data-toggle="tooltip" data-placement="bottom" title="라이선스 발급">
											발급하기 </span>&nbsp;
											<span class="label"
											style="background-color: darkgray; color: black; cursor: pointer;"
											onclick="licenseReject('${license.sw_name}', '${license.sw_id }', '${license.id }');"
											data-toggle="tooltip" data-placement="bottom" title="라이선스 거절"> 
											거절하기 </span></td>
									</tr>
									<c:set var="cnt" value="${cnt + 1}"/>
									</c:if>
								</c:forEach>
		
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:when>
	</c:choose>
	
	<jsp:include page="include/_footer_content.jsp" />
</div>
<!-- /.container -->
<!-- Footer -->


<jsp:include page="include/_jslib.jsp" />

<script>
	function licenseReject(swName, sw_id, id) {
		//var check = confirm(swName + " 에 대한 라이선스를 거절하시겠습니까?"+ id);
		swal({
	  			text: swName + " 에 대한 라이선스를 거절하시겠습니까?",
	  			icon: "info",	//error, success, info, warning
	  			buttons : {
				  cancel : "취소",
				  confirm : "확인",
			  },
	  		  dangerMode: false,
	  		}).then(function(isConfirm){
	  			if(isConfirm == true){
	  				$.ajax({
	  					url:"/reject",
	  					type:"POST",
	  					contentType: "application/json",
	  				 	data : JSON.stringify({
	  					swName : swName ,
	  					sw_id : sw_id,
	  					id : id
	  				}),
	  	   			success : function (data) {
	  	   				//alert("거절을 완료했습니다.");
	  	   			swal({
	  		  			text: "거절을 완료했습니다.",
	  		  			icon: "success",	//error, success, info, warning
	  		  			button : {
	  					  confirm : "확인"
	  				  },
	  		  		  dangerMode: false,
	  		  		});
	  	   		setTimeout(function(){
	   					window.location = "/license/manager/request?name";
					}, 3000);
	  	 	  			},
	  	 			error : function(data, textStatus, errorThrown) {
	  	       			console.log(data);
	  	   				}
	  				});
	  			} else {
	  				swal({
	  		  			text: "취소합니다.",
	  		  			icon: "info",	//error, success, info, warning
	  		  			button : {
	  					  confirm : "확인"
	  				  },
	  		  		  dangerMode: false,
	  		  		});
	  			}
	  		});
	}
	function licenseOk(swName, id, state, req_id) {
		//var check = confirm(swName + " 에 대한 라이선스를 발급하시겠습니까?");
		swal({
  			text: swName + " 에 대한 라이선스를 발급하시겠습니까?",
  			icon: "info",	//error, success, info, warning
  			buttons : {
			  cancel : "취소",
			  confirm : "확인",
		  },
  		  dangerMode: false,
  		}).then(function(isConfirm){
  			if(isConfirm == true){
  				if(state == 1 || state == 3){
  					$.ajax({
  						url:"/permit/full",
  						type:"POST",
  						contentType: "application/json",
  					 	data : JSON.stringify({
  						swName : swName ,
  						id : id,
  						req_id : req_id,
  						state : state
  					}),
  		   			success : function (data) {
  		   				//alert(swName + " 에 대한 정식버전 라이선스를 발급했습니다.");
  		   				swal({
		    				text: swName + " 에 대한 정식버전 라이선스를 발급했습니다.",
		    				icon: "success",	//error, success, info, warning
		    				buttons : {
		  			 		confirm : "확인",
		  		 			},
		    		  		dangerMode: false,
		    			});
  		   				setTimeout(function(){
  		   					window.location = "/license/manager/request?name";
  						}, 3000);
  		   				
  		 	  			},
  		 			error : function(data, textStatus, errorThrown) {
  		       			console.log(data);
  		   				}
  					});
  				} else {
  					$.ajax({
  						url:"/permit/demo",
  						type:"POST",
  						contentType: "application/json",
  					 	data : JSON.stringify({
  						swName : swName ,
  						id : id,
  						req_id : req_id
  					}),
  		   			success : function (data) {
  		   				//alert(swName + " 에 대한 데모버젼 라이선스를 발급했습니다.");
  		   				swal({
  		    				text: swName + " 에 대한 데모버젼 라이선스를 발급했습니다.",
  		    				icon: "success",	//error, success, info, warning
  		    				buttons : {
  		  			 		confirm : "확인",
  		  		 			},
  		    		  		dangerMode: false,
  		    			});
  		   				setTimeout(function(){
  		   					window.location = "/license/manager/request?name";
  						}, 3000);
  		 	  			},
  		 			error : function(data, textStatus, errorThrown) {
  		       			console.log(data);
  		   				}
  					});
  				} 
  			} else {
  				//alert("라이선스 발급을 취소합니다.");
  				swal({
	    				text: "라이선스 발급을 취소합니다.",
	    				icon: "info",	//error, success, info, warning
	    				buttons : {
	  			 		confirm : "확인",
	  		 			},
	    		  		dangerMode: false,
	    			});
  			}
  		});
	}
	
	function search() {
		var sw_id = $("#sw_list option:selected").val();
    	var sw_name = $("#sw_list option:selected").text();
    	var orderIndex = $("#order option").index($("#order option:selected"));
    	var order = "";
		
    	if(orderIndex == 1) {
    		order = "ASC";
    	} else if(orderIndex == 2) {
    		order = "DESC";
    	} else if (orderIndex == 0) {
    		order = "DEFAULT";
    	}
    	
    	$.ajax({
			url:"/license/manager/request",
			type:"GET",
			contentType: "application/json",
		 	data : {
			sw_id : sw_id,
			order : order
		},
         success : function (data) {
        	 $("#pageContainer").html(data);
        	 $(".dropdown-toggle").dropdown();
         },
         error : function(data, textStatus, errorThrown) {
             console.log(data);
         }
		});
	}
</script>