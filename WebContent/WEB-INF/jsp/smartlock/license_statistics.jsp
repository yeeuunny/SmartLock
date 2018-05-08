<%@ page import="smartlock.statistics.vo.StatisticsVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% StatisticsVO statistics = (StatisticsVO) request.getAttribute("statistics"); %>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="statistics" />
	<jsp:param name="_css" value="/front/css/statistics.css" />
</jsp:include>

<!-- Page Content -->
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Statistics
				<small>Statistics</small>
			</h1>
		</div>
	</div>
	<!-- /.row -->

	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-6">
				<div class="progress blue">
					<span class="progress-left">
						<span class="progress-bar"></span>
					</span>
					<span class="progress-right">
						<span class="progress-bar"></span>
					</span>
					<div class="progress-value"><%=statistics.getTotal()%></div>
				</div>
				<h4 class="text-center">다운로드 수</h4>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="progress yellow">
					<span class="progress-left"> <span class="progress-bar"></span>
					</span> <span class="progress-right"> <span class="progress-bar"></span>
					</span>
					<div class="progress-value"><%=statistics.getRequest_license()%></div>
				</div>
				<h4 class="text-center">라이선스 요청</h4>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="progress pink">
					<span class="progress-left"> <span class="progress-bar"></span>
					</span> <span class="progress-right"> <span class="progress-bar"></span>
					</span>
					<div class="progress-value"><%=statistics.getLicense()%></div>
				</div>
				<h4 class="text-center">발급된 라이선스</h4>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="progress green">
					<span class="progress-left"> <span class="progress-bar"></span>
					</span> <span class="progress-right"> <span class="progress-bar"></span>
					</span>
					<div class="progress-value"><%=statistics.getDemo_license()%></div>
				</div>
				<h4 class="text-center">데모 라이선스</h4>
			</div>
		</div>
	</div>
<!-- /.container -->
</div>
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp" />
