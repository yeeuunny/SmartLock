<%@ page import="smartlock.device.vo.DeviceVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="device" />
</jsp:include>

<!-- Page Content -->
	<div class="container">
		<!-- Service Panels -->
		<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">내 단말기 관리</h1>
			</div>
			<br> <br>
			<div class="col-md-3 col-sm-7">
				<div class="panel panel-default text-center">
					<div class="panel-heading">
						<h3 data-bind="title">${device.nickname}</h3>
					</div>
					<div class="panel-body">
						<div>
							<c:choose>
								<c:when test="${device.type eq 1}">
									<img src="/front/img/smartphone.png"
										style="margin-left: auto; margin-right: auto; display: auto"
										width="100px"
										data-toggle="tooltip" data-placement="bottom" title="모바일">
								</c:when>
								<c:when test="${device.type ne 1}">
									<img src="/front/img/pc.png"
										style="margin-left: auto; margin-right: auto; display: auto"
										width="100px"
										data-toggle="tooltip" data-placement="bottom" title="PC">
								</c:when>
							</c:choose>
                           
						</div>
						 <br>
						<div>
							<ul class="list-group text-center">
								<li class="list-group-item"><b>단말기정보 : </b>${device.mac}</li>
								<li class="list-group-item"><b>등록일 : </b>${device.reg_date}</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9 col-sm-7">
			<table class="col-sm-12 table-bordered table-striped table-condensed cf">
                		<thead class="cf" align="center">
                			<tr>
        						<td width="10px"><h4><b>No.</h4></td>
								<td width="250px"><h4><b>소프트웨어</h4></td>
								<td width="200px"><h4><b>회사명</h4></td>
								<td width="150px"><h4><b>시작일자</h4></td>
								<td width="150px"><h4><b>만료기간</h4></td>
								<td width="100px"><h4><b>상태</h4></td>
                			</tr>
                		</thead>
                		<tbody align="center">
                			<c:forEach var="license" items="${licenseList}" varStatus="index">
                				<tr>
	                				<td data-title="No.">${index.count}</td>
	                				<td data-title="소프트웨어">${license.sw_name}</td>
	                				<td data-title="회사명">${license.corp_name}</td>
	                				<td data-title="시작일자"><fmt:formatDate value="${license.start_date}" pattern="yyyy-MM-dd"/></td>
	                				<td data-title="만료기간"><fmt:formatDate value="${license.end_date}" pattern="yyyy-MM-dd"/></td>
	                				<c:choose>
										<c:when test="${license.state eq 1 }">
											<td data-title="상태"><span class="label label-success"
											data-toggle="tooltip" data-placement="bottom" title="발급완료">
											발급 완료 </span></td>
										</c:when>
										<c:when test="${license.state eq 2}">
										<td data-title="상태"><span class="label label-success" style="cursor: pointer;"
										onmouseout="this.style.background='#5cb85c';this.innerText='데모 버전';"
										onmouseover="this.style.background='#58ACFA';this.innerText='연장 요청';"
										onclick="requestDemo('${license.sw_name}', '${ license.sw_id}');"
										data-toggle="tooltip" data-placement="bottom" title="데모버젼">
											데모 버전 </span></td>
										</c:when>
									</c:choose>
	                				</tr>
                			</c:forEach>
            			</tbody>
            	</table>
			</div>
			<hr>
		</div>
		<div class="row"></div>
</div>
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />

<script>

function requestDemo(swName, sw_id) {
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
					  		  cancel : "취소",
							  confirm : "확인"
						  },
				  		  dangerMode: false,
				  		});
						setTimout(2000);
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


</script>
<jsp:include page="include/_jslib.jsp" />