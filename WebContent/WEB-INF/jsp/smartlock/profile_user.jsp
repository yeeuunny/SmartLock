<%@ page import="smartlock.member.vo.UserVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% UserVO userVO = (UserVO) session.getAttribute("user"); %>

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
        <div class="col-lg-12">
            <h1 class="page-header">마이페이지</h1>
            <ol class="breadcrumb">
	       		<li class="active">회원정보 수정</li>
        		<li><a href="/profile/changePassword" data-toggle="tooltip" data-placement="bottom" title="비밀번호 변경">비밀번호 변경</a></li>
        		<li><a href="/profile/quit" data-toggle="tooltip" data-placement="bottom" title="회원탈퇴">회원탈퇴</a></li>
        	</ol>
        </div>
        
       		<div class ="col-lg-4"></div>
            <div class="card col-lg-4">
				<form class="form-horizontal" id="updateProfile">
                    <fieldset>
                        <!-- Text input-->
							<div class="form-group">
								<label class="col-md-3 control-label" for="textinput">이름</label>
								<div class="col-md-9">
									<label class="control-label" for="textinput">${user_name}</label>
								</div>
							</div>

							<!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="textinput">소속</label>
                            <div class="col-md-9">
                                <label class="control-label" for="textinput">${corp_name}</label>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="textinput">아이디</label>
                            <div class="col-md-9">
                                <label class="control-label" for="textinput">${id}</label>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="textinput">이메일</label>
                            <div class="col-md-9">
                            	<input type="email" id="user_email" class="form-control" value="${email}" required autofocus>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="textinput">전화번호</label>
                            <div class="col-md-9">                                
                                <input type="text" id="phone_number" class="form-control" value="${phone_number}" required autofocus
                                			onfocus="phoneNofify()"
                                			onkeyup="value = autoHypen(phone_number.value)"
                                			maxlength="13">
                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-3 control-label" for="textinput">비밀번호</label>
                            <div class="col-md-9">
                            	<input type="password" id="password" class="form-control" placeholder="현재 비밀번호" required autofocus>
                            </div>
                        </div>
                        
                        <!-- Button -->
                        <div class="form-group" align="center">                            
                            <button type="submit" class="btn btn-lg btn-primary btn-block btn-signin"
                            	style="background-color:#4090A5; width : 300px" 
                            	data-toggle="tooltip" data-placement="bottom" title="정보 수정">수정</button>
                         </div>
						
                    </fieldset>
                </form>
	    </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp" >
	<jsp:param name="_js" value="/front/js/profile.js" />
</jsp:include>

