<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<jsp:include page="include/_header.jsp">
    <jsp:param name="_title" value="About us" />
    <jsp:param name="_nav" value="about_us" />
</jsp:include>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <!-- <button onclick="test();">sweet alert</button> -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">서비스 소개</h1>
        </div>
    </div>
    <!-- /.row -->

    <!-- Image Header -->
    <div class="col-lg-12" align="center">
	  <img class="img-responsive" src="/front/img/introduce.png" alt="">
	</div>

    <hr>


</div>
<!-- /.container -->
<!-- Footer -->
<script>
	
</script>

<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp" />
