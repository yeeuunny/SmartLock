<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="" />
</jsp:include>

<!-- Page Content -->
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header" align="center">아직 회원이 아니신가요?</h1>
		</div>
	</div>
	<br><br>
	<div class="col-lg-2"></div>
	<div class="col-lg-4" align="center">
			<button type="button" class="btn btn-default btn-circle btn-xl"
				onclick="location.href='/signup/user' ">
				<img class="img-responsive"
					style="margin-left: auto; margin-right: auto; display: block;"
					width="100px" src="/front/img/sign_up_user.png" alt="">
				<h2>사용자 회원</h2>
				<h4>일반 사용자 회원가입</h4>
			</button>
	</div>

	<div class="col-lg-4" align="center">
			<button type="button" class="btn btn-default btn-circle btn-xl"
				onclick="location.href='/signup/manager'">
				<img class="img-responsive"
					style="margin-left: auto; margin-right: auto; display: block;"
					width="100px" src="/front/img/sign_up_manager.png" alt="">
				<h2>관리자 회원</h2>
				<h4>소프트웨어 관리자 회원가입</h4>
			</button>
	</div>
</div>
<!-- /.container -->
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp" />
