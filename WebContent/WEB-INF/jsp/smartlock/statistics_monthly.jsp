<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<jsp:include page="include/_header.jsp">
	<jsp:param name="_nav" value="statistics" />
	<jsp:param name="_css" value="/front/css/vGraph.css" />
	<jsp:param name="_css" value="/front/css/statistics.css" />
</jsp:include>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"></script>

<!-- Header Carousel -->
<div id="con" class="container">
	<!-- Page Heading/Breadcrumbs -->
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				통계 <small>월별 발급 현황</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="/statistics" data-toggle="tooltip"
					data-placement="bottom" title="라이선스 통계">License 사용 통계</a></li>
				<li class="active">월별 License 발급 현황</li>
			</ol>
		</div>
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-sm-12" align="left">
			<div class="input-group">
				<select id="swList" style="width: 180px; height: 35px;"
					onchange="selectSwList(this.value);">
					<option value="전체보기" selected="selected">전체보기</option>
					<c:forEach var="item" items="${swList}">
						<option value="${item.key}">${item.value}</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="col-md-12">
		<div id="columnchart_values" style="width: 100%; height: 100%;"></div>
	</div>
	<br>
	<!-- Footer -->
	<jsp:include page="include/_footer_content.jsp" />
</div>
<!-- /.container -->
<jsp:include page="include/_jslib.jsp" />

<script>
	/*
	 * 구글 차트 라이브러리 로드 및 처음 시작시 데이터 타입 설정
	 */
	google.charts.load("current", {packages:['corechart']});
	google.charts.setOnLoadCallback(function(){
		
	var result = new Array();
		
		<c:forEach var="item" items='${monthCnt}'>
			var json = new Object();
			json = ${item};
			result.push(json);
		</c:forEach>
		
		drawChart(result);
	});
	
	/*
	 * 차트 데이터 설정 및 그리기 함수
	 */
	function drawChart(array) {
		var date = new Date();
		
		/*
		 * 현재 월부터 일년 치로 보여주기 위한 데이터 정렬
		 */
		var thisMonth = date.getMonth() + 1;
		
		var month = new Array();
		var arr = new Array();
		
		for(var i = 0; i < 12 ; ++i)
		{
			if(thisMonth - i <= 0)
			{
				month[11 - i] = thisMonth - i + 12;
				arr[11 - i] = array[thisMonth - i + 11];
			}
			else
			{
				month[11 - i] = thisMonth - i;
				arr[11 - i] = array[thisMonth - i - 1];
			}
		}
		
		/*
		 * 차트 데이터 및 옵션 설정
		 */
	    var data = google.visualization.arrayToDataTable([
	      ["Element", "발급 수", { role: "style" } ],
	      [month[0] + "월", arr[0], "#b87333"],
	      [month[1] + "월", arr[1], "#b87333"],
	      [month[2] + "월", arr[2], "#b87333"],
	      [month[3] + "월", arr[3], "#b87333"],
	      [month[4] + "월", arr[4], "#b87333"],
	      [month[5] + "월", arr[5], "#b87333"],
	      [month[6] + "월", arr[6], "#b87333"],
	      [month[7] + "월", arr[7], "#b87333"],
	      [month[8] + "월", arr[8], "#b87333"],
	      [month[9] + "월", arr[9], "#b87333"],
	      [month[10] + "월", arr[10], "#b87333"],
	      [month[11] + "월", arr[11], "#b87333"]
	    ]);
	
	    var view = new google.visualization.DataView(data);
	    view.setColumns([0, 1,
	                     { calc: "stringify",
	                       sourceColumn: 1,
	                       type: "string",
	                       role: "annotation" },
	                     2]);
	
	    var options = {
	      title : "최근 1년간 발급 현황",
	      animation : {
	    	  duration : 1000,
	    	  startup: true
	      },
	      bar: {groupWidth: "95%"},
	      legend: { position: "none" }
	    };
	    var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
	    chart.draw(view, options);
	}

	/*
	 * SW명별로 통계
	 */
	function selectSwList(swId){
		if(swId != '전체보기')
		{
			$.ajax({
				url: '/statistics/monthly/filter',
				type: 'POST',
				contentType: 'application/json',
				data: JSON.stringify({
					sw_id : swId	
				}),
				success: function(data){
					drawChart(data);
				},
				error: function(data, textStatus, errorThrown){
					console.log(data);
				}
			}); 
		}
		else
		{
			$.ajax({
				url: '/statistics/monthly',
				type: 'GET',
				contentType: 'application/json',
				success:function(data){
					$("#con").html(data);
					$(".dropdown-toggle").dropdown();
				},
				error:function(data, textStatus, errorThrown){
					console.log(data);
				}
			}); 
		}
	};
	
</script>
