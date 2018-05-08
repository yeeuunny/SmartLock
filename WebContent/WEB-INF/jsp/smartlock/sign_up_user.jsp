<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_title" value="Signup" />
	<jsp:param name="_nav" value="" />
	<jsp:param name="_css" value="/front/css/login.css" />
	<jsp:param name="_css" value="/front/css/jquery-ui.min.css" />
</jsp:include>

<!-- Page Content -->
<div class="container">
	<!-- Service Panels -->
	<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">일반 사용자 회원가입</h1>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<form class="form-horizontal" id="signup-form">
					<fieldset>
						<br>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-5 control-label" for="id">아이디</label>
							<div class="col-md-3">
								<div class="input-append">
									<input id="id" name="id" type="text" placeholder="아이디를 입력하세요."
										class="form-control with-btn input-md"
										style="width: 70%; float: left" onblur="idRegFunc()">
									<button id="check-id-btn" type="button" class="btn"
										style="width: 30%">중복확인</button>
									<h6 id="idWarning"
										style="color: #ff0000; font-size: 40%; display: inline;"></h6>
									<input type="hidden" id="checked-id" style="display: none" />
									<input type="hidden" id="is-check-id" value="false"
										style="display: none" />
								</div>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-5 control-label" for="pwd">비밀번호</label>
							<div class="col-md-3">
								<input id="pwd" name="textinput" type="password"
									placeholder="비밀번호를 입력하세요." class="form-control input-md"
									onblur="pwdRegFunc()">
								<h6 id="pwdWarning"
									style="color: #ff0000; font-size: 40%; display: inline;"></h6>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-5 control-label" for="check-pwd">비밀번호
								확인</label>
							<div class="col-md-3">
								<input id="check-pwd" name="textinput" type="password"
									placeholder="비밀번호를 재입력하세요." class="form-control input-md"
									onblur="pwdCheck()">
								<h6 id="pwdCheckWarning"
									style="color: #ff0000; font-size: 40%; display: inline;"></h6>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-5 control-label" for="name">이름</label>
							<div class="col-md-3">
								<input id="name" name="textinput" type="text"
									placeholder="이름을 입력하세요." class="form-control input-md"
									onblur="nameCheck()">
								<h6 id="nameWarning"
									style="color: #ff0000; font-size: 40%; display: inline;"></h6>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-5 control-label" for="email">이메일</label>
							<div id="email-div" class="col-md-5" style="display: inline">
								<!-- <input id="email" name="textinput" type="text" placeholder="이메일을 입력하세요." class="form-control input-md"> -->
								<input id="email-1" type="text"
									style="width: 35%; display: inline; text-align: center"
									class="form-control input-md" placeholder="이메일을 입력하세요."
									onblur="emailCheckFront()"> <b style="width: 5%">@</b>
								<input id="email-3" type="text"
									style="width: 28.9%; text-align: center; display: none;"
									class="form-control input-md" onblur="emailCheckBack()">
								<select id="email-2"
									style="width: 35%; display: inline; text-align-last: center;"
									class="form-control input-md">
									<option>naver.com</option>
									<option>daum.net</option>
									<option>gmail.com</option>
									<option>직접입력</option>
								</select> <br>
								<h6 id="emailWarning"
									style="color: #ff0000; font-size: 40%; display: inline;"></h6>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-5 control-label" for="phone">전화번호</label>
							<div class="col-md-3">
								<!-- <input id="phone" name="textinput" type="text" placeholder="전화번호를 입력해주세요." class="form-control input-md"> -->
								<select id="phone-1"
									style="width: 28%; display: inline; text-align-last: center;"
									class="form-control input-md">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select> <b style="width: 5%">-</b> <input id="phone-2" type="text"
									style="ime-mode: disable; width: 28%; display: inline; text-align: center"
									class="form-control input-md" maxlength="4"
									onkeydown="return onlyNumber(event)"
									onkeyup="removeChar(event)" onblur="phoneCheck('user')"> <b
									style="width: 5%">-</b> <input id="phone-3" type="text"
									style="ime-mode: disable; width: 28%; display: inline; text-align: center"
									class="form-control input-md" maxlength="4"
									onkeydown="return onlyNumber(event)"
									onkeyup="removeChar(event)" onblur="phoneCheck('user')"> <br>
								<h6 id="phoneWarning"
									style="color: #ff0000; font-size: 40%; display: inline;"></h6>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">

							<label class="col-md-5 control-label" for="company">기업명</label>
							<div class="col-md-3">
								<div class="input-append">
									<input id="corp-name" type="text" class="form-control input-md"
										placeholder="기업명을 입력해주세요." readonly
										style="width: 70%; float: left; background: #ffffff;">
									<button id="corp-search-btn" type="button" class="btn"
										style="width: 30%">기업검색</button>
									<h6 id="corpWarning"
										style="color: #ff0000; font-size: 40%; display: inline;"></h6>
									<input id="corp-id" style="display: none" />
									<!-- <input id="checked-corp" style="display:none"/>
									<input id="is-check-corp" value="false" style="display:none"/> -->
								</div>
							</div>
						</div>
						<br>
						<!-- Button -->
						<div class="form-group" align="center">
							<button class="btn btn-default btn-md"
								style="height: 40px; width: 80px" type="button"
								onclick="signup('user')">회원가입</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />

<jsp:include page="include/_jslib.jsp">
	<jsp:param name="_js" value="/front/js/member.js" />
	<jsp:param name="_js" value="/front/js/jquery-ui.min.js" />
</jsp:include>

