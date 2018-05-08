<%@ page import="smartlock.device.vo.DeviceVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!-- Page Content -->
<div id="pageContainer" class="container">
<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="device" />
</jsp:include>
	<!-- Service Panels -->
	<!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">내 단말기 관리</h1>
		</div>
		<!-- 검색필터-->
		<c:choose>
			<c:when test="${empty deviceList}">
				<div class="row">
					<div class="col-lg-12">
						<br><br><br> 
						<img class="img-responsive"
							style="margin-left: auto; margin-right: auto; display: block;"
							width="100px" src="/front/img/no_result.png" alt="">
						<h3 align="center">보유한 단말기가 존재하지 않습니다.</h3>
					</div>
					<br>
					<br>
				</div>
			</c:when>
			<c:when test="${!empty deviceList}">
				<div class="row">
					<div class="col-sm-12">
						<div class="col-sm-2">
							<div class="input-group">
								<select name="" id="sw_list" style="width: 180px; height: 35px;"
									data-toggle="tooltip" data-placement="bottom" title="소프트웨어">
									<option>소프트웨어명</option>
									<c:forEach var="sw" items="${swNameList}">
										<option>${sw}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="input-group">
								<select name="" id="order" style="width: 180px; height: 35px;"
									data-toggle="tooltip" data-placement="bottom" title="날짜">
									<option>등록날짜</option>
									<option>오름차순</option>
									<option>내림차순</option>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<button class="btn btn-primary" type="button" id="searchBtn"
								data-loading-text="Searching.." onclick="search();"
								data-toggle="tooltip" data-placement="bottom" title="검색"
								style="height: 35px;">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</div>
				<br> <br>
				<c:forEach var="device" items="${deviceList}">
					<div class="col-md-3 col-sm-7">
						<div class="panel panel-default text-center">
							<div class="panel-heading">
								<h3>${device.nickname}</h3>
							</div>
							<div class="panel-body">
								<div>
									<c:choose>
										<c:when test="${device.type eq 1}">
											<img src="/front/img/smartphone.png"
												style="margin-left: auto; margin-right: auto; display: auto"
												width="100px" data-toggle="tooltip" data-placement="bottom"
												title="모바일">
										</c:when>
										<c:when test="${device.type ne 1}">
											<img src="/front/img/pc.png"
												style="margin-left: auto; margin-right: auto; display: auto;"
												width="100px" data-toggle="tooltip" data-placement="bottom"
												title="PC">
										</c:when>
									</c:choose>
									<p></p>
									<p>
										<a href="#" class="btn btn-warning btn-filter"
											style="width: 80px"
											onclick="return clickEdit(${device.id}, '${device.nickname}');"
											data-toggle="tooltip" data-placement="bottom" title="디바이스 수정">수정</a>&nbsp;
										&nbsp; &nbsp; <a href="#" class="btn btn-danger btn-filter"
											style="width: 80px"
											onclick="return clickDelete(${device.id}, '${device.nickname}');"
											data-toggle="tooltip" data-placement="bottom" title="디바이스 삭제">삭제</a>
									</p>
								</div>
								<div>
									<ul class="list-group text-center">
										<li class="list-group-item"><b>단말기정보 : </b>${device.mac}</li>
										<li class="list-group-item"><b>등록일 : </b>${device.reg_date}</li>
									</ul>
									<a href="#" class="btn btn-default" style="width: 180px"
										onclick="return clickShowLicense('${device.id}');"
										data-toggle="tooltip" data-placement="bottom" title="라이선스 조회">라이선스
										조회</a>
								</div>
							</div>
						</div>
					</div>
			</c:forEach>
			</c:when>
		</c:choose>
		</div>
	<!-- Footer -->
	<jsp:include page="include/_footer_content.jsp" />
</div>
<!-- /.container -->

<jsp:include page="include/_jslib.jsp" />

<script>

	if('${sw}' == "") {
		$("#sw_list option:eq(0)").prop("selected", true);
	} else {
		$("#sw_list").val('${sw}').prop("selected", true);	
	}
	
	if('${order}' == "") {
		$("#order option:eq(0)").prop("selected", true);
	} else {
		$("#order").val('${order}').prop("selected", true);
	}
	
	function modal(text, div) {
		if(div=="success"){
			swal({
		  		text: text,
		  		icon: "success",	//error, success, info, warning
		  		button: {
		  			confirm : "확인",
		  		}, 
		  		dangerMode: false,
		  	});
	    	setTimeout(function(){
				window.location = "/device";
			}, 1000);
		} else if(div=="error"){
			swal({
		  		text: text,
		  		icon: "error",	//error, success, info, warning
		  		button: {
		  			confirm : "확인",
		  		},
		  		dangerMode: false,
		  		timer: 1500
		  	});
		}
	}
	
	/**
	 * 디바이스 수정 클릭시
	 * @param {number} deviceId 디바이스 아이디
	 * @param {string} oldNickname 기존 디바이스 닉네임
	 * @return {boolean} False
	 */
	function clickEdit(deviceId, oldNickname) {
        swal({
	  		  text: "닉네임을 입력해주세요.",
	  		  icon: "info",	//error, success, info, warning
	  		  buttons: {
	  			  cancel : "취소",
	  			  confirm : "확인"
	  		  },
	  		  dangerMode: false,
	  		content: {
	  		    element: "input",
	  		   	attributes: {
	  		   		placeholder: "닉네임을 입력하세요.",
	  		    }
	  		},
	  		}).then(function(isConfirm){
	  			if(isConfirm == null) {
	  				modal("닉네임 수정을 취소합니다.","error");
	  			} else {
	  				var newNickname = $(".swal-content__input").val();
	  				if(newNickname == '') {
	  					modal("닉네임을 입력하세요.","error");
	  				} else if (newNickname == oldNickname) {
	  					modal("닉네임이 똑같습니다.","error");
			        } else {
			        	 $.ajax({
				                url : "/device/update/nickname",
				                type : "POST",
				                contentType: "application/json",
				                data : JSON.stringify({
				                    id: deviceId,
				                    nickname: newNickname
				                }),
				                success : function (data) {
				                    if(data.status == "success") {
				                      	modal("닉네임이 수정되었습니다.","success");
				                    } else {
				                    	modal("닉네임을 수정하는데 실패했습니다.","error");
				                    }
				                },
				                error : function(data, textStatus, errorThrown) {
				                    console.log(data);
				                }
				            }); 
			        }
	  			}
		  		
	  		});
		return false;
	}

    /**
	 * 디바이스 삭제 클릭시
     * @param {number} deviceId 디바이스 아이디
     * @param {string} nickname 디바이스의 닉네임
     * @return {boolean} False
     */
	function clickDelete(deviceId, nickname) {
        //var checkDelete = confirm(nickname + " 를 삭제하시겠습니까?");
        swal({
  			text: nickname + "를 삭제하시겠습니까?",
  			icon: "warning",	//error, success, info, warning
  			buttons : {
			  cancel : "취소",
			  confirm : "확인",
		  },
  		  dangerMode: false,
  		}).then(function(isConfirm){
  		  if(isConfirm == null)
 			modal("취소되었습니다","error");
  		  else
  			$.ajax({
                url : "/device/delete",
                type : "POST",
                contentType: "application/json",
                data : JSON.stringify({
					id: deviceId
				}),
                success : function (data) {
                    if(data.status == "success") {
                    	modal("단말기가 삭제되었습니다.","success");
                    } else {
                        modal("단말기를 삭제하는데 실패했습니다.","error");
                    }
                },
                error : function(data, textStatus, errorThrown) {
                    console.log(data);
                }
            });
  	  });
	}

    /**
	 * 라이선스 보기 클릭시
     * @param deviceId 디바이스 아이디
     */
	function clickShowLicense(deviceId) {
    	 $.ajax({
    		url: "/device/license",
    		type: "GET",
    		contentType: "application/json",
    		data: ({
    			id: deviceId
    		}),
    		success: function(data) {
    			$(location).attr("href", "/device/license?id="+deviceId);
    		},
    		error: function(data, textStatus, errorThrown) {
    			console.log(data);
    		}
    	 });
	}
    
    
   /*
   	* 검색버튼 클릭 - 소프트웨어 별 단말기 조회, 닉네임으로 오름차순 내림차순 정렬
    */
    function search() {
    	var swIndex = $("#sw_list option").index($("#sw_list option:selected"));
    	var sw = $("#sw_list option:selected").val();
    	var orderIndex = $("#order option").index($("#order option:selected"));
    	var order = "";
    	
    	if(orderIndex == 1) {
    		order = "ASC";
    	} else if(orderIndex == 2) {
    		order = "DESC";
    	}
    	
    	if(swIndex == 0) {
    		sw = "";
    	}

    	$.ajax({
    		url: "/device",
    		type: "GET",
    		contentType: "application/json",
    		data: {
    			sw: sw,
    			order: order
    		},
    		success: function (data) {
    				console.log(data);
    				$("#pageContainer").html(data);
					$(".dropdown-toggle").dropdown();
    		},
    		error: function (data, textStatus, errorThrown) {
    			console.log(data);
    		}
    	});
    }

</script>
