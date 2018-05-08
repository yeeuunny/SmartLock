<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_title" value="" />
	<jsp:param name="_nav" value="" />
</jsp:include>
<meta http-equiv="refresh" content="2; url = /" />


<!-- Page Content -->
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
		<br><br><br><hr><br><br>
			<img class="img-responsive" style="margin-left: auto; margin-right: auto; display: block;"
			 width="100px"  src="/front/img/success.png" alt="">
			 <br>
			<h2 align="center">정상적으로 로그아웃 되었습니다.</h2>
			<h4 align="center">스마트락을 이용해주셔서 감사합니다.</h4>
			<h4 align="center">잠시 후 홈화면으로 이동합니다.</h4><br>
		</div>
	</div>
	<div class="col-md-5">
	</div>
	<div class="col-md-2">
		<a class="btn btn-lg btn-default btn-block" href="/"
		data-toggle="tooltip" data-placement="bottom" title="홈으로"><strong>홈으로</strong></a>
	</div>
	<div class="col-md-5">
	</div>
	<br>

	<div class="col-md-12">
		<br>
	</div>

</div>
<!-- /.container -->
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp" />
