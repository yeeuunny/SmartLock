<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="smartlock.license.vo.LicenseUserReqVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="include/_header.jsp">
	<jsp:param name="_title" value="License" />
	<jsp:param name="_nav" value="license" />
	<jsp:param name="_css" value="/front/css/mouse-over.css" />
</jsp:include>

<!-- Page Content -->
<div class="container" id="pageContainer">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">라이선스 요청현황</h1>
			<ol class="breadcrumb">
				<li><a href="/license/user?order=DEFAULT" data-toggle="tooltip" data-placement="bottom" title="라이선스 발급현황">라이선스 발급현황</a>
				</li>
				<li class="active">라이선스 요청현황</li>
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
							<h3 align="center">요청한 라이센스가 존재하지 않습니다.</h3>
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
							<select name="" id="sw_list"
							style="width: 180px; height: 35px;">
							<option value="" data-toggle="tooltip" data-placement="bottom" title="소프트웨어">소프트웨어명</option>
							<c:forEach var="sw" items="${swNameList}" varStatus="count">
							<option value="${swIdList[count.count-1]}">${sw }</option>
							</c:forEach>
						</select>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="input-group">
							<select name="" id="order"
							style="width: 180px; height: 35px;" data-toggle="tooltip" data-placement="bottom" title="날짜">
							<option value=0>요청 날짜</option>
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
	
		<div class="container">
			
				<div class="col-md-12">
					<h2 class="text-center">
					</h2>
				</div>
				<div id="no-more-tables">
					<table class="col-sm-12 table-bordered table-striped table-condensed">
						<thead class="cf" align="center">
							<tr>
								<td width="10px"><h4><b>No.</b></h4></td>
								<td width="230px"><h4><b>소프트웨어</b></h4></td>
								<td width="200px"><h4><b>회사명</b></h4></td>
								<td width="150px"><h4><b>요청일자</b></h4></td>
								<td width="100px"><h4><b>상태</b></h4></td>
							</tr>
						</thead>
						<tbody align="center">
						<c:forEach var="license" items="${licenseUserReqList}" varStatus="count">
						<tr>
							<td data-bind="no" class="data-no">${count.count }</td>
							<td data-bind="소프트웨어">${license.sw_name }</td>
							<td data-bind="회사명">${license.corp_name }</td>
							<td data-bind="요청일자"><fmt:formatDate value="${license.request_date}" pattern="yyyy-MM-dd"/></td>
							<c:choose>
									<c:when test="${license.state eq 1 }">
							<td data-bind="상태일반요청" data-toggle="tooltip" data-placement="bottom" title="일반 요청">
								<span class="label label-success">
									일반 요청
								</span>
							</td>
							</c:when>
								<c:when test="${license.state eq 2}">
							<td data-bind="상태데모요청" data-toggle="tooltip" data-placement="bottom" title="데모 요청">
								<span class="label label-success">데모 요청
								</span>
							</td>
							</c:when>
								<c:when test="${license.state eq 3}">
							<td data-bind="상태발급거절">
								<span class="label label-danger"
									  onmouseout="this.style.background='#DF5A5A';this.innerText='발급 거절';">
									발급거절
								</span>
							</td>
							</c:when>
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
<br><br>
<!-- Footer -->


<jsp:include page="include/_jslib.jsp" />

<script>
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
			url:"/license/user/request",
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