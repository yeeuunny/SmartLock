<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_title" value="Signup" />
	<jsp:param name="_nav" value="" />
	<jsp:param name="_css" value="/front/css/login.css" />
</jsp:include>
<meta http-equiv="refresh" content="3; url = /" />
<!-- Page Content -->
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<br><br>
			<img class="img-responsive" style="margin-left: auto; margin-right: auto; display: block;"
				 width="100px"  src="/front/img/success.png" alt="">
			<h1 align="center">정상적으로 회원가입 되었습니다.</h1>
		</div>
	</div>

	<br>

	<br><br>
	<div class="col-md-5">
	</div>
	<div class="col-md-2">
		<a class="btn btn-lg btn-default btn-block" href="/"><strong>메인으로</strong></a>
		<a class="btn btn-lg btn-default btn-block" href="/login"><strong>로그인</strong></a>
	</div>
	<div class="col-md-5">
	</div>

	<div class="col-md-12">
		<br>
	</div>
</div>
<!-- /.container -->
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp">
	<jsp:param name="_js" value="/front/js/member.js" />
</jsp:include>
