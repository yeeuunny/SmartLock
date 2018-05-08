<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_title" value="Profile" />
	<jsp:param name="_nav" value="" />
	<jsp:param name="_css" value="/front/css/login.css" />
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
			<h3 align="center">정상적으로 회원정보가 수정되었습니다.</h3>
		</div>
	</div>
	<br><br>
	<div class="col-md-5">
	</div>
	<div class="col-md-2">
		<a class="btn btn-lg btn-default btn-block" href="/"
		data-toggle="tooltip" data-placement="bottom" title="메인으로"><strong>메인으로</strong></a>
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
