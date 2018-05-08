<%@ page import="smartlock.license.vo.LicenseUserVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="license" />
</jsp:include>

<!-- Page Content -->
<div class="container" id="pageContainer">
	<!-- Service Panels -->
	<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">라이선스 발급현황</h1>
			<ol class="breadcrumb">
				<li class="active">라이선스 발급현황</li>
				<li><a href="/license/user/request?order=DEFAULT">라이선스 요청현황</a></li>
			</ol>
		</div>
		<!-- 검색필터-->
		
			<c:choose>
				<c:when test="${empty swNameList}">
					<div class="row">
						<div class="col-lg-12">
							<br>
							<br>
							<br> <img class="img-responsive"
								style="margin-left: auto; margin-right: auto; display: block;"
								width="100px" src="/front/img/no_result.png" alt="">
							<h3 align="center">보유한 라이센스가 존재하지 않습니다.</h3>
						</div>
						<br>
						<br>
					</div>
				</c:when>
				<c:when test="${!empty swNameList}">
				<div class="row">
					<div class="col-sm-12">
						<div class="col-sm-2">
							<div class="input-group">
								<select name="" id="sw_list" style="width: 180px; height: 35px;">
									<option value="">소프트웨어명</option>
									<c:forEach var="sw" items="${swNameList}" varStatus="count">
										<option value="${swIdList[count.count-1]}">${sw}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="input-group">
								<select name="" id="order" style="width: 180px; height: 35px;">
									<option value=0>만료 날짜</option>
									<option value=1>오름차순</option>
									<option value=2>내림차순</option>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<!-- <input type="text" class="col-md-4" placeholder="검색어를 입력하세요"
										id="searchField" style="width: 300px; height: 35px;">&nbsp;&nbsp; -->
							<button class="btn btn-primary" type="button" id="searchButton"
								onclick="search();">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</div>
				<br>
					<div class="container">
						<div class="col-md-12">
							<h2 class="text-center"></h2>
						</div>
						<div id="no-more-tables">
							<table
								class="col-sm-12 table-bordered table-striped table-condensed cf">
								<thead class="cf" align="center">
									<tr>
										<td width="10px"><h4>
												<b>No. </b>
											</h4></td>
										<td width="200px"><h4>
												<b>소프트웨어 </b>
											</h4></td>
										<td width="120px"><h4>
												<b>회사명 </b>
											</h4></td>
										<td width="150px"><h4>
												<b>시작일 </b>
											</h4></td>
										<td width="150px"><h4>
												<b>만료일 </b>
											</h4></td>
										<td width="80px"><h4>
												<b>상태 </b>
											</h4></td>
										<td width="130px"><h4>
												<b>등록 가능 단말기 수</b>
											</h4></td>
									</tr>
								</thead>
								<tbody align="center">
									<c:forEach var="license" items="${licenseUserList}"
										varStatus="count">
										<tr>
											<td data-title="No.">${count.count }</td>
											<td data-title="소프트웨어">${license.sw_name}</td>
											<td data-title="회사명">${license.corp_name}</td>
											<td data-title="시작일"><fmt:formatDate
													value="${license.start_date}" pattern="yyyy-MM-dd" /></td>
											<td data-title="만료일"><fmt:formatDate
													value="${license.end_date}" pattern="yyyy-MM-dd" /></td>
											<c:choose>
												<c:when test="${license.state eq 1 }">
													<td data-title="상태"><span class="label label-success">
															발급 완료 </span></td>
												</c:when>
												<c:when test="${license.state eq 2}">
													<td data-title="상태"><span id="${count.count }" class="label label-info"
														style="cursor: pointer;"
														onmouseout="this.innerText='데모 버전';"
														onmouseover="this.innerText='연장 요청';"
														onclick="requestDemo('${license.sw_name}', '${license.sw_id}', '${count.count }');">
															데모 버전 </span></td>
												</c:when>
												<c:when test="${license.state eq 3}">
													<td data-title="상태"><span id="${count.count }" class="label label-warning"
														style="cursor: pointer;"
														onclick="finishedDemo();">
															요청 완료 </span></td>
												</c:when>
											</c:choose>

											<c:choose>
												<c:when test="${license.device_count eq 0}">
													<td data-title="등록 가능 단말기 수"><span
														class="label label-warning">${license.device_count}</span></td>
												</c:when>
												<c:otherwise>
													<td data-title="등록 가능 단말기 수"><span
														class="label label-primary" style="cursor: pointer;"
														onmouseout="this.style.background='#1066AE';this.innerText='${license.device_count}';"
														onmouseover="this.style.background='#1066AE';this.innerText='단말기 추가등록';"
														onclick="openModal('${license.sw_name}', '${license.corp_name}'
																				, '<fmt:formatDate
															value="${license.start_date}" pattern="yyyy-MM-dd" />'
																				, '<fmt:formatDate
															value="${license.end_date}" pattern="yyyy-MM-dd" />', '${license.sw_id }');">
															${license.device_count}</span></td>
												</c:otherwise>
											</c:choose>
										</tr>

									</c:forEach>
								</tbody>
							</table>
						</div>
						</div>
		</c:when>
		</c:choose>
	</div>
	<jsp:include page="include/_footer_content.jsp" />
</div>
<jsp:include page="include/_jslib.jsp" />

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">단말기 추가등록</h4>
			</div>
			<div class="modal-body">
				<h2 class="modal-title" id="myModalLabel">소프트웨어 정보</h2>
				선택한 소프트웨어의 정보입니다
				<hr>
				<div class="container">
					<input id="m_swId" style="display: none">
					<div class="row">
						<div class="form-group">
							<label class="col-md-2 control-label col-xs-4">소프트웨어</label>
							<div class="col-md-4  col-xs-4">
								<input id="m_swName" type="text" class="form-control input-md"
									value="m_swId" readonly style="background: #ffffff">
							</div>
						</div>
					</div>
					<p></p>
					<div class="row">
						<div class="form-group">
							<label class="col-md-2 control-label col-xs-4">회사명</label>
							<div class="col-md-4  col-xs-4">
								<input id="m_corpName" type="text" class="form-control input-md"
									readonly style="background: #ffffff">
							</div>
						</div>
					</div>
					<p></p>
					<div class="row">
						<div class="form-group">
							<label class="col-md-2 control-label col-xs-4">시작일</label>
							<div class="col-md-4  col-xs-4">
								<input id="m_startDate" type="text"
									class="form-control input-md" readonly
									style="background: #ffffff">
							</div>
						</div>
					</div>
					<p></p>
					<div class="row">
						<div class="form-group">
							<label class="col-md-2 control-label col-xs-4">만료일</label>
							<div class="col-md-4  col-xs-4">
								<input id="m_endDate" type="text" class="form-control input-md"
									readonly style="background: #ffffff">
							</div>
						</div>
					</div>

				</div>
				<hr>
				<h2 class="modal-title" id="myModalLabel">단말기 선택</h2>
				연결 가능한 단말기 목록이 표시됩니다
				<hr>
				<div class="container">
					<div class="row">
						<div class="form-group">
							<label class="col-md-2 control-label col-xs-4">단말기</label>
							<div class="col-md-4  col-xs-4">
								<div class="input-group">
									<select id="modalDeviceSelect"
										style="width: 360px; height: 35px;" data-toggle="tooltip"
										data-placement="bottom" title="단말기">
										<%-- <c:forEach var="device" items="${deviceList}">
											<option value="${device.mac}" >
												<c:choose>
													<c:when test="${device.type eq 1}">
														(모바일)
													</c:when>
													<c:when test="${device.type ne 1}">
														(PC)
													</c:when>
												</c:choose> 
												${device.nickname } (mac : ${device.mac})
											</option>
										</c:forEach> --%>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						onclick="match_device($('#m_swId').val())">등록</button>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	function match_device(sw_id){
		 var mac = $("#modalDeviceSelect option:selected").val();
		 $.ajax({
				url : "/match",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify({
					sw_id : sw_id,
					mac : mac
				}),
				success : function(data) {
					//alert("디바이스에 라이선스를 등록했습니다.");
					swal({
			  			text: "디바이스에 라이선스를 등록했습니다.",
			  			icon: "success",	//error, success, info, warning
			  			button : {
						  confirm : "확인",
					  	},
					});
					setTimeout(function(){
		   					window.location = "/license/user?name";
						}, 3000);
					
				},
				error : function(data, textStatus, errorThrown) {
					console.log(data);
				}
			});
	}
	
	function openModal(swName, corpName, startDate, endDate, sw_id) {
		$('#m_swName').val(swName);
		$('#m_corpName').val(corpName);
		$('#m_startDate').val(startDate);
		$('#m_endDate').val(endDate);
		$('#m_swId').val(sw_id);
		
		$.ajax({
			url : "/getModalDevice",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify({
				sw_id : sw_id
			}),
			success : function(data) {
				$("#modalDeviceSelect").find("option").remove();
				for(var i=0; i<data.length; i++) {
					if(data[i]['type'] == 0) {
						$('#modalDeviceSelect').append("<option value="+data[i]['mac']+">"+"(PC) "+data[i]['nickname']+" (mac : "+data[i]['mac']+")</option>");
					} else {
						$('#modalDeviceSelect').append("<option value="+data[i]['mac']+">"+"(모바일) "+data[i]['nickname']+" (mac : "+data[i]['mac']+")</option>");
					}
				}
			
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			}
		});
		
		$('#myModal').modal();
	}
	
	function finishedDemo(){
		swal({
		  		text: "연장 요청을 완료했습니다.",
		  		icon: "info",	//error, success, info, warning
		  		buttons : {
				  confirm : "확인",
				}
		  	});
	}
	function requestDemo(swName, sw_id, count) {
		var button = document.getElementById(count);
		
		swal({
  			text: swName + " 에 대한 데모 기간 연장을 요청하시겠습니까?",
  			icon: "info",	//error, success, info, warning
  			buttons : {
			  cancel : "취소",
			  confirm : "확인",
		  },
  		  dangerMode: false,
  		}).then(function(isConfirm){
  			if(isConfirm == true)
  				$.ajax({
  					url : "/license/user/requestDemo",
  					type : "POST",
  					contentType : "application/json",
  					data : JSON.stringify({
  						swName : swName,
  						sw_id : sw_id
  					}),
  					success : function(data) {
  						//window.location = "/license/user?name";
  						//alert("요청을 완료했습니다.");
  						
  						swal({
  				  			text: "요청을 완료했습니다.",
  				  			icon: "success",	//error, success, info, warning
  				  			buttons : {
  							  confirm : "확인"
  						  },
  				  		  dangerMode: false,
  				  		});
  						
  						$.ajax({
  							url : "/license/extend",
  							type : "POST",
  							contentType : "application/json",
  							data : JSON.stringify({
  								sw_id : sw_id
  							}),

  							error : function(data, textStatus, errorThrown) {
  								console.log(data);
  							}
  						});
  						setTimeout(function(){
		   					window.location = "/license/user?name";
						}, 3000);
  						
  					},
  					error : function(data, textStatus, errorThrown) {
  						console.log(data);
  					}
  				});
  			else
  				swal({
  		  			text: "연장 요청을 취소합니다.",
  		  			icon: "info",	//error, success, info, warning
  		  			buttons : {
  					  confirm : "확인",
  				  },
  		  		  dangerMode: false,
  		  		});
  		});
  		
	}

	function search() {
		var sw_id = $("#sw_list option:selected").val();
		var sw_name = $("#sw_list option:selected").text();
		var orderIndex = $("#order option").index($("#order option:selected"));
		var order = "";

		if (orderIndex == 1) {
			order = "ASC";
		} else if (orderIndex == 2) {
			order = "DESC";
		} else if (orderIndex == 0) {
			order = "DEFAULT";
		}
		$.ajax({
			url : "/license/user",
			type : "GET",
			contentType : "application/json",
			data : {
				sw_id : sw_id,
				order : order
			},
			success : function(data) {
				$("#pageContainer").html(data);
				$(".dropdown-toggle").dropdown();
			},
			error : function(data, textStatus, errorThrown) {
				console.log(data);
			}
		});
	}
</script>