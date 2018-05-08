$(document).ready(function(){ 
	var total = $("#total-value").html();
	var license = $("#license-value").html();
	var getLicense = total!=0 ? Math.round($("#getLicense-value").html()/total*10) : 0;
	var demo = total!=0 ? Math.round($("#demo-value").html()/total*10) : 0;
	
	if(total == 0) {
		$("#total").children(".progress-left").children(".progress-bar").css("animation", "loading-0 0.5s linear forwards 0.5s");
		$("#total").children(".progress-right").children(".progress-bar").css("animation", "loading-0 0.5s linear forwards 0s");
	} else {
		$("#total").children(".progress-left").children(".progress-bar").css("animation", "loading-5 0.5s linear forwards 0.5s");
		$("#total").children(".progress-right").children(".progress-bar").css("animation", "loading-5 0.5s linear forwards 0s");
	}
	
	if(license == 0) {
		$("#license").children(".progress-left").children(".progress-bar").css("animation", "loading-0 0.5s linear forwards 0.5s");
		$("#license").children(".progress-right").children(".progress-bar").css("animation", "loading-0 0.5s linear forwards 0s");
	} else {
		$("#license").children(".progress-left").children(".progress-bar").css("animation", "loading-5 0.5s linear forwards 0.5s");
		$("#license").children(".progress-right").children(".progress-bar").css("animation", "loading-5 0.5s linear forwards 0s");
	}
	
	if(getLicense<6) {
		$("#getLicense").children(".progress-left").children(".progress-bar").css("animation", "loading-0 0.5s linear forwards 0.5s");
		$("#getLicense").children(".progress-right").children(".progress-bar").css("animation", "loading-"+(getLicense)+" 0.5s linear forwards 0s");
	} else {
		$("#getLicense").children(".progress-left").children(".progress-bar").css("animation", "loading-"+(getLicense-5)+" 0.5s linear forwards 0.5s");
		$("#getLicense").children(".progress-right").children(".progress-bar").css("animation", "loading-5 0.5s linear forwards 0s");
	}

	if(demo<6) {
		$("#demo").children(".progress-left").children(".progress-bar").css("animation", "loading-0 0.5s linear forwards 0.5s");
		$("#demo").children(".progress-right").children(".progress-bar").css("animation", "loading-"+(demo)+" 0.5s linear forwards 0s");
	} else {
		$("#demo").children(".progress-left").children(".progress-bar").css("animation", "loading-"+(demo-5)+" 0.5s linear forwards 0.5s");
		$("#demo").children(".progress-right").children(".progress-bar").css("animation", "loading-5 0.5s linear forwards 0s");
	}
	
	$.ajax({
		url : "/software/corp",
		type : "GET",
        contentType: "application/json",
		data : "",
		success : function (data) {
			if(data.status == "success" && data.data) {
				for (var i=0;i<data.data.length; i++) {
					$("#select-software").append("<option value='"+data.data[i].id+"'>"+data.data[i].sw_name+"</option>");
					
					if($("#sw_id").val() == data.data[i].id) {
						$("#select-software option:eq("+(i+1)+")").attr("selected", "selected");
					}
						
				}
			} else {
				alert("");
			}
		},
		error : function(data, textStatus, errorThrown) {
			console.log(data);
		}
	});
});

$("#select-software").on("change", function() {
	var sw_id = $(this).find("option:selected").val();
	
	if(sw_id == '0') {
		location.href="/statistics";
	} else {
		location.href="/statistics?sw_id="+sw_id;
	}
	
	
})