<%@ page import="smartlock.member.vo.UserVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<% String _nav = request.getParameter("_nav"); %>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="/" data-toggle="tooltip" data-placement="bottom" title="홈">
				<img src="/front/img/smartlock_logo.png"
				style="width: 160px; height: 50px;" />
			</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left">
				<li
					<%= (_nav != null && _nav.equals("device")) ? "class=\"active\"" : "" %>
					data-toggle="tooltip" data-placement="bottom" title="도움말"><a
					href="/device">단말기</a></li>
				<li
					<%= (_nav != null && _nav.equals("license")) ? "class=\"active\"" : "" %>
					data-toggle="tooltip" data-placement="bottom" title="라이선스 조회">
					<a href="/license/user?order=DEFAULT">라이선스</a>
				</li>
				<li
					<%= (_nav != null && _nav.equals("softwareUser")) ? "class=\"active\"" : "" %>
					data-toggle="tooltip" data-placement="bottom" title="소프트웨어"><a
					href="/software/user">소프트웨어</a></li>
				<li
					<%= (_nav != null && _nav.equals("download")) ? "class=\"active\"" : "" %>
					data-toggle="tooltip" data-placement="bottom" title="에이전트 다운로드">
					<a href="/download">다운로드</a>
				</li>
				<li
					<%= (_nav != null && _nav.equals("manual")) ? "class=\"active\"" : "" %>
					data-toggle="tooltip" data-placement="bottom" title="매뉴얼"><a
					href="/manual">매뉴얼</a></li>
				<li
					<%= (_nav != null && _nav.equals("qna")) ? "class=\"active\"" : "" %>
					data-toggle="tooltip" data-placement="bottom" title="도움말"><a
					href="/qna">도움말</a></li>
				<!--
                <li <%= (_nav != null && _nav.equals("notice")) ? "class=\"active\"" : "" %>>
                    <a href="/notice">Notice</a>
                </li>
                -->
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><span
						class="glyphicon glyphicon-user pull-leftt"></span></a>
					<div class="dropdown-menu"
						style="width: auto; white-space: nowrap;">
						<div style="position: relative;">
							<div style="padding-left: 80px;">
								<div style="padding: 16px;">
									<div style="font-size: 16px;" id="name">${user.user_name}님
										(사용자)</div>
									<div style="font-size: 14px;" id="email">${user.email}</div>
									<div style="padding: 8px 0;">
										<a href="/profile" class="btn btn-sm btn-default btn-block"
											data-toggle="tooltip" data-placement="bottom" title="마이페이지">마이페이지</a>
									</div>
									<div style="font-size: 12px;">
										<a href="/logout" data-toggle="tooltip"
											data-placement="bottom" title="로그아웃">로그아웃</a>
									</div>
								</div>
							</div>
							<div
								style="position: absolute; top: 16px; left: 16px; width: 64px;">
								<img src="/front/img/profile.png" alt="profile"
									style="width: 64px; height: 64px;">
							</div>
						</div>
					</div></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>