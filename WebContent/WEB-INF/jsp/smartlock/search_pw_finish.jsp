
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="" />
</jsp:include>

<!-- Page Content -->
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
		<br><br><br><hr><br><br>
			<img class="img-responsive" style="margin-left: auto; margin-right: auto; display: block;"
			 width="100px"  src="/front/img/success.png" alt=""><br>
			<h4 align="center">귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.</h4>
			<h4 align="center">새로운 비밀번호로 로그인 후 비밀번호를 변경해주세요.</h4>
		</div>
	</div>
	<br>

	<br><br>
	<div class="col-md-5">
	</div>
	<div class="col-md-2">
		<a class="btn btn-lg btn-default btn-block" href="/login"><strong>로그인</strong></a>
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
