<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="" />
</jsp:include>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_title" value="Profile" />
	<jsp:param name="_nav" value="" />
	<jsp:param name="_css" value="/front/css/profile.css" />
</jsp:include>

<!-- Page Content -->
<div class="container">

	<br>
	<br>
	<div class="col-lg-12" align="center">
		<div class="col-lg-4"></div>
		<div class="card col-lg-4" align="center">
			<h3 style="margin-bottom: 20px">
				<b>비밀번호 찾기</b>
			</h3>
			<p></p>
			<p style="margin: 0px">회원가입시 입력한 이메일을 입력해 주세요.</p>
			<p style="margin-bottom: 20px">해당 이메일로 임시 비밀번호를 발송해드립니다.</p>
			<form action="/search_pw/email/authenticate" id="updateProfile"
				method="post">
				<input id="id" name="id" class="form-control" style="width: 300px"
					placeholder="아이디" required autofocus>
					<p></p>
				<input
					type="email" id="email" name="email" class="form-control" style="width: 300px"
					placeholder="이메일" required>
				<br>
				<button id="login-btn"
					class="btn btn-lg btn-primary btn-block btn-signin" type="submit"
					onclick="find_button();"
					style="background-color: #4090A5; width: 300px">비밀번호 찾기</button>
			</form>
		</div>
	</div>

	<div class="col-md-12">
		<br> <br>
	</div>
</div>
<!-- /.container -->
<script type="text/javascript">
	window.onload = function() {
		message = '${resultMsg}';

		if (message) {
			swal({
				text : message,
				icon : "warning", //error, success, info, warning
				button : {
					confirm : "확인",
				},
			});
		}
	}
</script>
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp" />
