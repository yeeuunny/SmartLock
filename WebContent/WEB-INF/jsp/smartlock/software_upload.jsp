<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="smartlock.license.vo.LicenseManagerVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="software_upload" />
</jsp:include>

<div class="container">
	<!-- Service Panels -->
	<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">소프트웨어 정보 등록</h1>
		</div>
		<!-- 검색필터-->
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<br>
				<form id="softwareForm" align="left" action="/software/upload" method="POST" enctype="multipart/form-data">
					<h4 style="font-weight:bold">회사 명</h4>
					<div class="form-group">
						<input id="corp_name" value="${corp_name}" style="width: 400px; background: #ffffff"
							class="form-control input-md" readonly>
					</div>
					<h4 style="font-weight:bold">소프트웨어 명</h4>
					<div class="form-group">
						<%-- <select id="select" class="form-control" onchange="change(this.value);">
							<c:forEach var="software" items="${softwareList}">
							  <option>${software.value.sw_name}</option>
							</c:forEach>
							<option>직접입력</option>
						</select> --%>
						<input id="sw_name" name="sw_name" placeholder="소프트웨어명을 입력하세요."
							style="width: 400px;" class="form-control input-md" onblur="swNameCheck()">
						<h6 id="nameWarning" style="color: #ff0000; font-size: 40%; display: inline;"></h6>
					</div>
					<h4 style="font-weight:bold">소프트웨어 버전</h4>
					<div class="form-group">
						<input id="sw_version" name="version" placeholder="소프트웨어 버전을 입력하세요."
							style="width: 400px;" class="form-control input-md" onblur="verCheck()">
						<h6 id="verWarning" style="color: #ff0000; font-size: 40%; display: inline;"></h6>
					</div>
					<h4 style="font-weight:bold">프로세스 명</h4>
					<div class="form-group">
						<input id="proc_name" name="proc_name" placeholder="프로세스 명을 입력하세요."
							style="width: 400px;" class="form-control input-md" onblur="pcNameCheck()">
						<h6 id="pcWarning" style="color: #ff0000; font-size: 40%; display: inline;"></h6>
					</div>
					<h4 style="font-weight:bold">소프트웨어 설명</h4>
					<div class="form-group">
						<textarea class="form-control" id="info" name="info" rows="5" cols="30"
						 style="width:400px" placeholder="소프트웨어에 대한 간단한 설명을 입력하세요." onblur="swInfoCheck()"></textarea>
						<h6 id="infoWarning" style="color: #ff0000; font-size: 40%; display: inline;"></h6>
					</div>
					 <div class="form-group">
						<h4 style="font-weight:bold">이미지 파일</h4>
					    <input type="file" id="sw_img" name="sw_img">
					 </div>
					</form>
				<br>
				<div align="center">
					<a class="btn btn-lg btn-primary btn-block btn-signin" onclick="request();"
						style="width: 180px; background-color:#4090A5;" data-toggle="tooltip" data-placement="bottom" title="소프트웨어 업로드">업로드</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container -->

<!-- Footer -->
<jsp:include page="include/_footer_content.jsp" />

<script>
	/*
	 * select 바뀔 시
	 *
	 function change(name)
	{
		if(name == '직접입력')
		{
			$('#sw_name').removeAttr('type');	
		}
		else
		{
			$('#sw_name').attr('type', 'hidden');
		}
	}
	*/
	
	/*
	 * 업로드 버튼 클릭 시 onclick
	 */
	function request() 
	{
		/*
		 * 필수 입력 필드를 모두 입력하지 않은 경우
		 */
		if($('#sw_name').val() == '')
			$('#nameWarning').text('소프트웨어 명은 필수 입력 항목입니다.');
		if($('#sw_version').val() == '')
			$('#verWarning').text('소프트웨어 버전은 필수 입력 항목입니다.');
		if($('#proc_name').val() == '')
			$('#pcWarning').text('프로세스 명은 필수 입력 항목입니다.');
		/*
		 * 입력 필드를 모두 입력했을 경우
		 */
		else
		{
			$('#softwareForm').submit();
			//alert('업로드되었습니다.');
			swal({
				text: "업로드되었습니다.",
				icon: "success",	//error, success, info, warning
				button : {
			 		confirm : "확인",
		 			},
		  		dangerMode: false,
			});
			setTimout(3000);
		}
	}
	/*
	 * 정규식
	 */
	function swNameCheck()
	{
		var nameVal = $('#sw_name').val();
		var msg = "최소 한 글자, 25자 이하로만 등록 가능합니다.";
		
		if(nameVal.length > 25) 
			$('#nameWarning').text(msg);
		else 
			$('#nameWarning').text("");
	}
	function verCheck()
	{
		var verVal = $('#sw_version').val();
		var reg_ver = /^([0-9]+).([0-9]+).([0-9]+)$/;
		var msg = "0.0.0과 같은 숫자 형식으로만 등록 가능합니다.";
		
		if(!verVal.match(reg_ver)) 
			$('#verWarning').text(msg);
		else 
			$('#verWarning').text("");
	}
	function pcNameCheck()
	{
		var nameVal = $('#proc_name').val();
		var reg_pc = /^[0-9a-zA-Z\_]{1,45}$/;
		var msg = "1-45자 영문자와 _ 특수문자만 등록 가능합니다.";
		
		if(!nameVal.match(reg_pc)) 
			$('#pcWarning').text(msg);
		else 
			$('#pcWarning').text("");
	}
	
	function swInfoCheck()
	{
		var infoVal = $('#info').val();
		var msg = "500자 이하로만 등록 가능합니다.";
		
		if(infoVal.length > 500) 
			$('#infoWarning').text(msg);
		else 
			$('#infoWarning').text("");
	}
</script>
<jsp:include page="include/_jslib.jsp" />
