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
					<%= (_nav != null && _nav.equals("main")) ? "class=\"active\"" : "" %>>
					<a href="/main"> 홈 </a>
				</li>
				<li
					<%= (_nav != null && _nav.equals("about_us")) ? "class=\"active\"" : "" %>
					data-toggle="tooltip" data-placement="bottom" title="서비스 소개">
					<a href="/about_us">서비스 소개</a>
				</li>
				<li
					<%= (_nav != null && _nav.equals("software")) ? "class=\"active\"" : "" %>
					data-toggle="tooltip" data-placement="bottom" title="소프트웨어 목록">
					<a href="/software">소프트웨어</a>
				</li>
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
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="/login" data-toggle="tooltip"
					data-placement="bottom" title="로그인">로그인</a></li>
				<li><a href="/signup" data-toggle="tooltip"
					data-placement="bottom" title="회원가입">회원가입</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>