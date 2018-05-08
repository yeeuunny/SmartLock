<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
        <div class="item active">
            <div class="fill" style="background-image: url('http://pre04.deviantart.net/5c73/th/pre/i/2014/281/a/1/rainmeter_wallpaper_by_funnyfoxnl17-d6l0zse.jpg');"></div>
            <div class="carousel-caption">
                <h2>강렬한 파란원</h2>
            </div>
        </div>
        <div class="item">
            <div class="fill" style="background-image: url('https://awesomewallpaper.files.wordpress.com/2012/05/power4.jpg');"></div>
            <div class="carousel-caption">
                <h2>진한 붉은원</h2>
            </div>
        </div>
        <div class="item">
            <div class="fill" style="background-image: url('http://cdn.wonderfulengineering.com/wp-content/uploads/2014/07/Hi-Tech-Wallpaper.png');"></div>
            <div class="carousel-caption">
                <h2>번진 파란원</h2>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
        <span class="icon-prev"></span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next"> <span class="icon-next"></span>
    </a>
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
                <h4 align="center">튼튼한 자물쇠</h4>
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
                <h4 align="center">튼튼한 열쇠</h4>
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
                <h4 align="center">멋있는 사람</h4>
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
                <h4 align="center">두둥실 구름</h4>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
    <!-- /.row -->

    <!-- Portfolio Section -->
    <div class="row"></div>

    <br>

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