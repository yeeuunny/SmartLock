<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="smartlock.license.vo.LicenseManagerVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="softwareUser" />
</jsp:include>

<style>
	.hovereffect {
	  width: 100%;
	  height: 100%;
	  float: left;
	  overflow: hidden;
	  position: relative;
	  text-align: center;
	  cursor: default;
	}
	
	.hovereffect .overlay {
	  width: 100%;
	  height: 100%;
	  position: absolute;
	  overflow: hidden;
	  top: 0;
	  left: 0;
	}
	
	.hovereffect img {
	  display: block;
	  position: relative;
	  -webkit-transition: all 0.4s ease-in;
	  transition: all 0.4s ease-in;
	}
	
	.hovereffect:hover img {
	  filter: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg"><filter id="filter"><feColorMatrix type="matrix" color-interpolation-filters="sRGB" values="0.2126 0.7152 0.0722 0 0 0.2126 0.7152 0.0722 0 0 0.2126 0.7152 0.0722 0 0 0 0 0 1 0" /><feGaussianBlur stdDeviation="3" /></filter></svg>#filter');
	  filter: grayscale(1) blur(3px);
	  -webkit-filter: grayscale(1) blur(3px);
	 -webkit-transform: scale(1);
	  -ms-transform: scale(1);
	  transform: scale(1); 
	}
	
	.hovereffect h2 {
	  text-transform: uppercase;
	  text-align: center;
	  position: relative;
	  font-size: 17px;
	  padding: 10px;
	  background: rgba(0, 0, 0, 0.6);
	}
	
	.hovereffect a.info {
	  display: inline-block;
	  text-decoration: none;
	  padding: 7px 14px;
	  border: 1px solid #fff;
	  margin: 50px 0 0 0;
	  background-color: rgba(0, 0, 0, 0.6);
	}
	
	.hovereffect a.info:hover {
	  box-shadow: 0 0 5px #fff;
	}
	
	.hovereffect a.info, .hovereffect h2 {
	  -webkit-transform: scale(0.7);
	  -ms-transform: scale(0.7);
	  transform: scale(0.7);
	  -webkit-transition: all 0.4s ease-in;
	  transition: all 0.4s ease-in;
	  opacity: 0;
	  filter: alpha(opacity=0);
	  color: #fff;
	  text-transform: uppercase;
	}
	
	.hovereffect:hover a.info, .hovereffect:hover h2 {
	  opacity: 1;
	  filter: alpha(opacity=100);
	  -webkit-transform: scale(1);
	  -ms-transform: scale(1);
	  transform: scale(1);
	}
</style>
<!-- Header Carousel -->
<div class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				소프트웨어 <small>소프트웨어 라이선스 요청</small>
			</h1>
		</div>
	</div>
	<!-- /.row -->

	<!-- Projects Row -->
	<c:choose>
		<c:when test="${empty softwareList}">
			<div class="row">
				<div class="col-lg-12">
					<br>
					<br>
					<br> <img class="img-responsive"
						style="margin-left: auto; margin-right: auto; display: block;"
						width="100px" src="/front/img/no_result.png" alt="">
					<h3 align="center">신청할 수 있는 소프트웨어가 없습니다.</h3>
				</div>
				<br>
				<br>
			</div>
		</c:when>
		<c:when test="${!empty softwareList}">
			<c:forEach var="software" items="${softwareList}" varStatus="count">
				<div class="col-md-3 img-portfolio" >
					<div class="hovereffect" style="height:195px;">
						<span class="fa-stack fa-5x" data-toggle="tooltip" data-placement="bottom" title="${software.sw_name }">
            			 <img class="fa fa-circle fa-stack-2x img-responsive" src= "data:image/jpg;base64, ${software.img}"></img></span> 
            			 <div class="overlay"
             				style="cursor: pointer;"
        					onclick="request_license('${software.id}', '${software.sw_name}');">
		  	    			<a class="info" href="#">신청하기</a>
      					 </div>
						<h3 class="text-center" style="cursor: pointer;" 
							data-toggle="tooltip" data-placement="top" title="신청하기"
							onclick="request_license('${software.id}', '${software.sw_name }');">${software.sw_name}</h3>
					</div>
					<h5 class="text-center">v${software.version}</h5>
        			<div class="text-center" style="height:60px; overflow:auto;">${software.info}</div>
		<%-- <div align="center">
        <a class="btn btn-md btn-default btn-block" style="width:100px" onclick="request_license('${software.id}', '${software.sw_name }');"
        data-toggle="tooltip" data-placement="bottom" title="라이센스 신청하기">신청하기</a>
    	</div> --%>
	</div>
	</c:forEach>
		</c:when>
	</c:choose>
	
</div>
<!-- /.container -->
<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />

<script>
	function request_license(sw_id, sw_name){
		//var state;
		//state = confirm(sw_name+"에 대한 라이선스 요청을 하시겠습니까?");
		swal({
  			text: sw_name+"에 대한 라이선스 요청을 하시겠습니까?",
  			icon: "info",	//error, success, info, warning
  			buttons : {
			  cancel : "취소",
			  confirm : "확인",
		  },
  		  dangerMode: false,
		}).then(function(isConfirm){
			if(isConfirm == true){
				$.ajax({
					url:"/software/user/request?id="+sw_id ,
					type:"GET",
					contentType: "application/json",
				 	data : {
				 		id : sw_id
				 	},
		      		success : function (data) {
		      			window.location = "/software/user/request?id="+sw_id;
		   		    },
			   		error : function(data, textStatus, errorThrown) {
		     	 		console.log(data);
	    			}
				});
			} else {
				swal({
		  			text: "요청을 취소합니다.",
		  			icon: "info",	//error, success, info, warning
		  			buttons : {
					  confirm : "확인",
				  },
		  		  dangerMode: false,
				});
			}
		});
		
	}
</script>
<jsp:include page="include/_jslib.jsp" />
