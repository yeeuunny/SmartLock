<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/_header.jsp">
    <jsp:param name="_nav" value="main" />
</jsp:include>

<!-- Page Content -->
<div class="container" align="center">
<br><br><br><br>
	<img src="/front/img/404error.png">
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