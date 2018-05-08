<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="" />
	<jsp:param name="_css" value="/front/css/login.css" />
</jsp:include>

<div class="container">
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">비밀번호 찾기</h1>
				<h4>비밀번호를 찾을 방법을 선택해 주세요.</h4>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="card" style="width: 500px">
			<label class="radio-inline" for="radios-0">
			<input
				type="radio" name="radios" id="radios-0" value="1"
				checked="checked"> <b>회원정보에 등록한 휴대전화로 인증</b>
				(010 - 12** - ****)
			</label> <br>
			<hr>
			<label class="radio-inline" for="radios-1"> <input
				type="radio" name="radios" id="radios-1" value="2"> <b>본인확인
					이메일로 인증</b> (hong********* @ c*****.com)
			</label>
		</div>
	</div>
</div>
<div class="col-lg-12" align="center">
	<div class="col-lg-4"></div>
	<div class="col-lg-4" align="center">

		<button id="login-btn"
			class="btn btn-lg btn-primary btn-block btn-signin" type="submit"
			onclick="location.href='/search_pw/setNewPassword'">다음</button>
	</div>
</div>
<div class="col-md-12">
	<br> <br>
</div>
<!-- /.container -->
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp" />
