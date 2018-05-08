<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="smartlock.license.vo.LicenseManagerVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="include/_header.jsp">
    <jsp:param name="_nav" value="software" />
</jsp:include>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">소프트웨어 
                <small>미리보기</small>
            </h1>
        </div>
    </div>
    <!-- /.row -->
    <!-- Projects Row -->
    <c:forEach var="software" items="${softwareList}" >
        <div class="col-md-3 img-portfolio">
        	<div style="height:280px;">
            <div align="center">
            	<span class="fa-stack fa-5x" data-toggle="tooltip" data-placement="bottom" title="${software.sw_name}">
            		 <img class="fa fa-circle fa-stack-2x" src= "data:image/jpg;base64, ${software.img}"></img>
            	</span>
           	</div>
            <h3 class="text-center">${software.sw_name}</h3>
            <h5 class="text-center">v${software.version}</h5>
            <div class="text-center" style="height:60px; overflow:auto;">${software.info}</div>
            </div>
        </div>
    </c:forEach>
</div>
<!-- /.container -->
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />
<jsp:include page="include/_jslib.jsp" />

