<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="smartlock.license.vo.LicenseManagerVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- <meta http-equiv="refresh" content="2; url = /" />
 -->
<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="softwareUser" />
</jsp:include>

<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
		<br><br><br><hr><br><br>
			<img class="img-responsive"
				style="margin-left: auto; margin-right: auto; display: block;"
				width="100px" src="/front/img/success.png" alt="">
			<br>
			<h2 align="center">라이선스를 요청했습니다.</h2>
			<h4 align="center">관리자 승인 후 소프트웨어 사용이 가능합니다.</h4>
		</div>
	</div>

	<br> <br>
	<br>
	<div class="col-md-5"></div>
	<div class="col-md-2">
		<a class="btn btn-lg btn-default btn-block" href="/software/user"><strong>돌아가기</strong></a>
	</div>
	<div class="col-md-5"></div>
	<br>

	<div class="col-md-12">
		<br>
		
	</div>
</div>
	<!-- /.container -->
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp" />
