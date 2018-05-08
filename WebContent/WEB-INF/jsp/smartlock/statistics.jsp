<%@ page import="smartlock.statistics.vo.StatisticsVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<% StatisticsVO statistics = (StatisticsVO) request.getAttribute("statistics"); %>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="statistics" />
	<jsp:param name="_css" value="/front/css/statistics.css" />
</jsp:include>

<!-- Header Carousel -->
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				통계 <small>License 사용 통계</small>
			</h1>
			<ol class="breadcrumb">
				<li class="active">License 사용 통계</li>
				<li><a href="/statistics/monthly" data-toggle="tooltip"
					data-placement="bottom" title="월별 사용 통계">License 월별 사용 통계</a></li>
			</ol>
		</div>
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-sm-12" align="left">
			<div class="input-group">
				<select id="select-software" style="width: 180px; height: 35px;"
					data-toggle="tooltip" data-placement="bottom" title="소프트웨어">
					<option value="0">전체보기</option>
				</select> <input type="hidden" id="sw_id" value="${sw_id}" />
			</div>
			<!-- 검색창을 추가할지말지?
            <div class="col-sm-6">
                <input type="text" class="col-md-4" placeholder="소프트웨어명을 입력하세요" id="searchField" style="width: 300px; height: 35px;">&nbsp;&nbsp;
                <button class="btn btn-primary" type="button" id="searchButton" data-loading-text="Searching.."> <i class="fa fa-search"></i> </button>-->
		</div>
	</div>
	<br> <br>
	<div class="container">
		<div class="col-md-3 col-sm-6">
			<div id="license" class="progress yellow">
				<span class="progress-left"> <span class="progress-bar"></span>
				</span> <span class="progress-right"> <span class="progress-bar"></span>
				</span>
				<div id="license-value" class="progress-value"><%=statistics.getRequest_license()%></div>
			</div>
			<h4 class="text-center" style="margin-top: 16px">라이선스 요청 수</h4>
		</div>
		<div class="col-md-3">
			<div id="total" class="progress blue">
				<span class="progress-left"> <span class="progress-bar"></span>
				</span> <span class="progress-right"> <span class="progress-bar"></span>
				</span>
				<div id="total-value" class="progress-value"><%=statistics.getTotal()%></div>
			</div>
			<h4 class="text-center" style="margin-top: 16px">총 발급 라이선스 수</h4>
		</div>
		<div class="col-md-3">
			<div id="getLicense" class="progress pink">
				<span class="progress-left"> <span class="progress-bar"></span>
				</span> <span class="progress-right"> <span class="progress-bar"></span>
				</span>
				<div id="getLicense-value" class="progress-value"><%=statistics.getLicense()%></div>
			</div>
			<h4 class="text-center" style="margin-top: 16px">정식 라이선스 수</h4>
		</div>
		<div class="col-md-3">
			<div id="demo" class="progress green">
				<span class="progress-left"> <span class="progress-bar"></span>
				</span> <span class="progress-right"> <span class="progress-bar"></span>
				</span>
				<div id="demo-value" class="progress-value"><%=statistics.getDemo_license()%></div>
			</div>
			<h4 class="text-center" style="margin-top: 16px">데모 라이선스 수</h4>
		</div>
	</div>
	<!-- /.row -->
	<!-- Portfolio Section -->
	<br>
	<!-- Footer -->
	<jsp:include page="include/_footer_content.jsp" />
</div>
<!-- /.container -->
<jsp:include page="include/_jslib.jsp">
	<jsp:param name="_js" value="/front/js/statistics.js" />
</jsp:include>

