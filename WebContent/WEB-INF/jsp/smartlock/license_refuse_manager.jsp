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
				라이선스 관리 <small>발급 거절 현황</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="/license/manager/request?order=DEFAULT&state=WAIT"
				data-toggle="tooltip" data-placement="bottom" title="발급 대기 현황">발급 대기 현황</a></li>
				<li><a href="/license/manager?order=DEFAULT"
				data-toggle="tooltip" data-placement="bottom" title="발급 완료 현황">발급 완료 현황</a></li>
				<li class="active">발급 거절 현황</li>
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
					<h3 align="center">거절한 라이센스가 존재하지 않습니다.</h3>
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
 							<!-- <td width="100px"><h4>
									<b>상세보기
								</h4></td> -->
						</tr>
					</thead>
					<tbody align="center">
						<c:set var="cnt" value="1"/>
						<c:forEach var="license" items="${licenseManagerReqList}" varStatus="count">
							<c:if test="${license.state eq 3}">
							<tr>
								<td data-title="No.">${cnt}</td>
								<td data-title="소프트웨어">${license.sw_name}</td>
								<td data-title="이름">${license.user_name}</td>
								<td data-title="신청날짜"><fmt:formatDate
										value="${license.request_date}" pattern="yyyy-MM-dd" /></td>
								<td data-title="분류"><span class="label label-danger"
										data-toggle="tooltip" data-placement="bottom" title="요청 거절">
												라이선스 요청 거절</span></td>
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
	
	
	function search() {
		var sw_id = $("#sw_list option:selected").val();
    	var sw_name = $("#sw_list option:selected").text();
    	var orderIndex = $("#order option").index($("#order option:selected"));
    	var order = "";
    	var state = 3;
		
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
			order : order,
			state : state
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