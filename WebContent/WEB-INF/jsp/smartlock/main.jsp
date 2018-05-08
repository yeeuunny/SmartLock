<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="main" />
</jsp:include>

<!-- Header Carousel -->
<header id="myCarousel" class="carousel slide">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
		<li data-target="#myCarousel" data-slide-to="4"></li>
		<li data-target="#myCarousel" data-slide-to="5"></li>
		<li data-target="#myCarousel" data-slide-to="6"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner">
		<div class="item active">
			<div class="fill"
				style="background-image: url('/front/img/home/mainImage1.jpg');"></div>
			<!-- <div class="carousel-caption">
                <h2>강렬한 파란원</h2>
            </div> -->
		</div>
		<div class="item">
			<div class="fill"
				style="background-image: url('/front/img/home/mainImage2.jpg');"></div>
			<!-- <div class="carousel-caption">
                <h2>진한 붉은원</h2>
            </div> -->
		</div>
		<div class="item">
			<div class="fill"
				style="background-image: url('/front/img/home/mainImage3.jpg');"></div>
			<!-- <div class="carousel-caption">
                <h2>진한 붉은원</h2>
            </div> -->
		</div>
		<div class="item">
			<div class="fill"
				style="background-image: url('/front/img/home/mainImage4.jpg');"></div>
			<!-- <div class="carousel-caption">
                <h2>진한 붉은원</h2>
            </div> -->
		</div>
		<div class="item">
			<div class="fill"
				style="background-image: url('/front/img/home/mainImage5.jpg');"></div>
			<!-- <div class="carousel-caption">
                <h2>진한 붉은원</h2>
            </div> -->
		</div>
		<div class="item">
			<div class="fill"
				style="background-image: url('/front/img/home/mainImage6.jpg');"></div>
			<!-- <div class="carousel-caption">
                <h2>진한 붉은원</h2>
            </div> -->
		</div>
		<div class="item">
			<div class="fill"
				style="background-image: url('/front/img/home/mainImage7.jpg');"></div>
			<!-- <div class="carousel-caption">
                <h2>진한 붉은원</h2>
            </div> -->
		</div>
	</div>

	<!-- Controls -->
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span class="glyphicon glyphicon-chevron-right"
		aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a> <!-- <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="icon-prev"></span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="icon-next"></span>
	</a> -->
</header>

<!-- Page Content -->
<div class="container">
	<br> <br>
	<!-- Marketing Icons Section -->
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-2">
			<div class="panel">
				<p>
					<span class="fa-stack fa-5x"> <i
						class="fa fa-circle fa-stack-2x"></i> <i
						class="fa fa-lock fa-stack-1x fa-inverse"></i>
					</span>
				</p>
				<h4 align="center">소프트웨어 보호</h4>
			</div>
		</div>
		<div class="col-md-2">
			<div class="panel">
				<p>
					<span class="fa-stack fa-5x"> <i
						class="fa fa-circle fa-stack-2x"></i> <i
						class="fa fa-key fa-stack-1x fa-inverse"></i>
					</span>
				</p>
				<h4 align="center">라이센스 관리</h4>
			</div>
		</div>
		<div class="col-md-2">
			<div class="panel">
				<p>
					<span class="fa-stack fa-5x"> <i
						class="fa fa-circle fa-stack-2x"></i> <i
						class="fa fa-user fa-stack-1x fa-inverse"></i>
					</span>
				</p>
				<h4 align="center">통계 확인</h4>
			</div>
		</div>
		<div class="col-md-2">
			<div class="panel">
				<p>
					<span class="fa-stack fa-5x"> <i
						class="fa fa-circle fa-stack-2x"></i> <i
						class="fa fa-cloud-download fa-stack-1x fa-inverse"></i>
					</span>
				</p>
				<h4 align="center">에이전트 연동</h4>
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>
	<!-- /.row -->

	<!-- Portfolio Section -->
	<div class="row"></div>

	<br>
	<br>
	<br>
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<a class="btn btn-lg btn-default btn-block" href="/signup">지금 시작하기</a>
	</div>
	<div class="col-md-4"></div>
	<br>
	<div class="col-md-12"></div>


</div>
<!-- /.container -->
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />

<jsp:include page="include/_jslib.jsp" />

<!-- Script to Activate the Carousel -->
<script>
    $('.carousel').carousel({
        interval : 5000
        //changes the speed
    })
</script>