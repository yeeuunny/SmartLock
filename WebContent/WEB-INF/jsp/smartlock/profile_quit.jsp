<%@ page import="smartlock.member.vo.UserVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_title" value="Profile" />
	<jsp:param name="_nav" value="" />
	<jsp:param name="_css" value="/front/css/profile.css" />
</jsp:include>

<!-- Page Content -->
<div class="container">
	<!-- Service Panels -->
	<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
	<div class="row">
		<!-- 탭메뉴 -->
		<div class="col-lg-12">
			<h1 class="page-header">마이페이지</h1>
			<ol class="breadcrumb">
				<li><a href="/profile" data-toggle="tooltip"
					data-placement="bottom" title="회원정보 수정">회원정보 수정</a></li>
				<li><a href="/profile/changePassword" data-toggle="tooltip"
					data-placement="bottom" title="비밀번호 변경">비밀번호 변경</a></li>
				<li class="active">회원탈퇴</li>
			</ol>
		</div>
		<br> <br> <br> <br> <br> <br>
		<!-- Form -->
		<div class="col-lg-4"></div>
		<div class="card col-lg-4" align="center">
			<div class="profile-help">
				<h4>
					<b>회원탈퇴를 위한 회원정보 인증절차</b>
				</h4>
				<p>회원가입 시 등록한 정보를 입력해주세요.</p>
				<br>
			</div>
			<form class="form-profile" id="removeUser">
				<input type="password" id="password" class="form-control"
					placeholder="현재 비밀번호를 입력해주세요." required autofocus
					data-toggle="tooltip" data-placement="bottom" title="현재 비밀번호"
					style="width: 300px">
				<p></p>
				<br>
				<button id="profile-btn" type="submit"
					class="btn btn-lg btn-primary btn-block btn-signin"
					data-toggle="tooltip" data-placement="bottom" title="회원탈퇴"
					style="width: 300px">회원탈퇴</button>
			</form>
			<!-- /form -->
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="include/_footer_content.jsp" />	
</div>
<jsp:include page="include/_jslib.jsp" />
<script>
	$("#removeUser").submit(function() {
		$.ajax({
			url : "/profile/quit/success",
			type : "POST",
			contentType : "application/json",
			dataType : "json",
			data : JSON.stringify({
				"id" : SmartLock.user.id,
				"password" : $("#password").val(),
			}),
			success : function(data) {
				if (data) {
					location.href = "/profile/quit/ok";
				} else {
					$("#password").focus();
					swal({
						text : "비밀번호가 일치하지 않습니다. 다시 확인해주세요.",
						icon : "warning", //error, success, info, warning
						buttons : {
							confirm : "확인",
						},
					});
				}
			},
			error : function(data, textStatus, errorThrown) {
				alert("ajax통신실패");
			}
		});

		return false;
	});
</script>
