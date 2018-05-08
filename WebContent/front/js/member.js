$("#login-form").submit(function() {
	var data = {
		"id" : $("#id").val(),
		"pwd" : $("#pwd").val()
	};
	$.ajax({
		url : "/login",
		type : "POST",
		contentType : "application/json",
		data : JSON.stringify(data),
		success : function(data) {
			var message;
			if (data == "SUCCESS") {
				swal({
					text : "로그인 되었습니다.",
					icon : "success",
					button : false
				});
				setTimeout(function() {
					// 메인페이지로이동
					window.location.href = "/";
				}, 1200);
			} else {
				if (data == "FAIL-WRONG-PW") {
					message = "비밀번호가 잘못되었습니다.";
				} else {
					message = "아이디가 존재하지 않습니다.";
				}
				$("#login-form").each(function() {
					this.reset();
				});
				swal({
					text : message,
					icon : "warning",
					button : "확인"
				});
			}
		},
		error : function(data, textStatus, errorThrown) {
			console.log(data);
		}
	});
	return false;
});

/*
 * 폼 리셋 함수
 */
function formReset(form) {
	form.each(function() {
		this.reset();
	});
}

/*
 * 기업명 검색
 */
$("#corp-search-btn")
		.on(
				"click",
				function() {
					// var buttonText = "Ok" ;
					var title = "The page says:";

					var div = $('<div id="dialog">');
					div.attr('title', "회사명 검색");
					div
							.html('<div>'
									+ '<div style="width:100%" align="center">'
									+ '<input id="dialog-corp-name" type="text" placeholder="기업명을 입력해주세요." style="width:70%">'
									+ '<button id="dialog-corp-search-btn" style="width:30%">검색</button>'
									+ '</div>'
									+ '<table id="table-corp" style="text-align:center; margin-top:10px; margin-bottom:10px" width="100%">'
									+ '<thead>' + '<tr>'
									+ '<td width="50%">회사명</>'
									+ '<td width="50%">전화번호</>' + '</tr>'
									+ '</thead>' + '</ul>' + '</div>');
					div.dialog({
						autoOpen : true,
						modal : true,
						draggable : false,
						resizable : false
					/*
					 * , buttons: [{ text: buttonText, click: function () {
					 * $(this).dialog("close"); div.remove(); } }]
					 */						
					});
					$("#dialog-corp-search-btn")
					.on(
							"click",
							function() {
								if ($("#dialog-corp-name").val() == '') {
									$("#dialog-corp-name").focus();
									return;
								}

								$
										.ajax({
											url : "/check/corpname",
											type : "POST",
											dataType : "json",
											data : {
												"corp_name" : $("#dialog-corp-name").val(),
											},
											success : function(data) {
												if (data.status == "success") {
													if (data.data != null) {
														$('#table-corp > tbody').remove();
														$('#no-serch-result').remove();
														$('#table-corp').append(
																'<tbody></tbody>');
														if (data.data.length != 0) {
															for (var i = 0; i < data.data.length; i++) {
																$(
																		'#table-corp > tbody:last')
																		.append(
																				'<tr>'
																						+ '<td><a onclick="clickCorp(\''
																						+ data.data[i].id
																						+ '\',\''
																						+ data.data[i].corp_name
																						+ '\')">'
																						+ data.data[i].corp_name
																						+ '</a></td>'
																						+ '<td>'
																						+ data.data[i].phone
																						+ '</td>'
																						+ '</tr>');
															}
														} else {
															$("#dialog")
																	.append(
																			'<h5 id="no-serch-result" style="text-align:center">검색 결과가 존재하지 않습니다.</h5>')
														}
													} else {

													}
												} else {

												}
											},
											error : function(data, textStatus, errorThrown) {

											}
										});
							});
				});



function clickCorp(corp_id, corp_name) {
	$("#corp-id").val(corp_id);
	$("#corp-name").val(corp_name);
	$("#corpWarning").text("");
	$("#dialog").dialog("close");
}

/* 이메일 css조정 */
$("#email-2").on("change", function() {
	if ($(this).val() == '직접입력') {
		document.getElementById('email-div').className = "col-md-6";
		$("#email-1").css("width", "28.9%");
		$("#email-2").css("width", "15%");
		$("#email-3").css("display", "inline");
	} else {
		document.getElementById('email-div').className = "col-md-5";
		$("#email-1").css("width", "35%");
		$("#email-2").css("width", "35%");
		$("#email-3").val("");
		$("#email-3").css("display", "none");
	}
});

var is_id_checked = false;
var is_right_id = false;
var is_correct_pwd = false;
var is_correct_phoneNumber = true;

$("#check-id-btn").on("click", function() {
	var msg = document.getElementById("idWarning");
	if ($("#id").val() == "") {
		msg.style.color = "red";
		$('#idWarning').text("아이디를 입력하세요.");
		return false;
	}
	if (!is_right_id) {
		return false;
	}
	$.ajax({
		url : "/check/id",
		type : "GET",
		dataType : "json",
		data : {
			"id" : $("#id").val(),
		},
		success : function(data) {
			if (data.data == "ok") {
				msg.style.color = "blue";
				$('#idWarning').text("사용할 수 있는 아이디 입니다.");
				is_id_checked = true;
			} else {
				msg.style.color = "red";
				$('#idWarning').text("이미 등록된 아이디 입니다.");
				is_id_checked = false;
			}
			msg.style.color = "blue";
		},
		error : function(data, textStatus, errorThrown) {
		}
	});
});

function onlyNumber(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
			|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

/* 정규식 */
var idVal = "";
function idRegFunc() {
	var idWarning = document.getElementById("idWarning");
	var newIdVal = $('#id').val();
	var reg_id = /^[0-9a-z]{6,20}$/;
	var msg = "아이디는 6~20자의 영문 소문자, 숫자만 사용 가능합니다.";

	if (newIdVal == "") {
		is_right_id = false;
	}
	if (idVal != newIdVal) {
		idVal = newIdVal;
		is_id_checked = false;
		if (!idVal.match(reg_id)) {
			idWarning.style.color = "red";
			$('#idWarning').text(msg);
		} else {
			$('#idWarning').text("");
			is_right_id = true;
		}
	} else {
		is_right_id = true;
	}
}

function pwdRegFunc() {
	var pwdVal = $('#pwd').val();
	var reg_pwd = /^[0-9a-zA-Z\~\!\@\#\$\%\^\&\*\(\)\_\+\`\-\=\<\>\,\.\?\/\\\|\{\}\[\]\:\;\"\']{8,20}$/;
	var msg = "비밀번호는 8~20자의 영문자, 숫자, 특수문자를 사용하세요.";
	if (!pwdVal.match(reg_pwd)) {
		if (pwdVal.length == 0) {
			$('#pwdWarning').text("비밀번호를 입력하세요.");
		} else {
			$('#pwdWarning').text(msg);
		}
	} else {
		$('#pwdWarning').text("");
	}
}
function pwdCheck() {
	var pwd = $('#pwd').val();
	var pwdCheck = $("#check-pwd").val();
	var msg = "비밀번호가 서로 다릅니다.";
	if (pwd != pwdCheck || pwd.length == 0) {
		$('#pwdCheckWarning').text(msg);
		is_correct_pwd = false;
	} else {
		is_correct_pwd = true;
		$('#pwdCheckWarning').text("");
	}
}
function nameCheck() {
	var nameVal = $('#name').val();
	var reg_name = /^[가-힣a-zA-Z]{3,20}/;
	var msg = "이름은 3~20자의 한글과 영문자를 사용하세요. (공백문자 불가)";
	if (!nameVal.match(reg_name)) {
		$('#nameWarning').text(msg);
	} else {
		$('#nameWarning').text("");
	}
}
function emailCheckFront() {
	var emailValFront = $('#email-1').val();
	var reg_email_front = /^([0-9A-Za-z_.-])+$/;
	var msg = "이메일은 숫자,영문자, 특수문자(-, _, .)으로 이루어져야합니다.";
	if (emailValFront == "") {
		$('#emailWarning').text("");
	} else if (!emailValFront.match(reg_email_front)) {
		$('#emailWarning').text(msg);
	} else {
		$('#emailWarning').text("");
	}
}
function emailCheckBack() {
	var emailValBack = $('#email-3').val();
	var reg_email_back = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var msg = "도메인 주소가 올바르지 않습니다.";
	if (!emailValBack.match(reg_email_back)) {
		$('#emailWarning').text(msg);
	} else {
		$('#emailWarning').text("");
	}
}
function phoneCheck(category) {
	var phone, phoneFront, phoneBack, warning;
	if (category == 'user') {
		warning = $('#phoneWarning');
		phoneFront = $("#phone-2").val();
		phoneBack = $("#phone-3").val();
	} else {
		warning = $('#corpNumberWarning');
		phoneFront = $("#corp-phone-2").val();
		phoneBack = $("#corp-phone-3").val();
	}
	if (phoneFront == "" && phoneBack == "" || phoneFront != ""
			&& phoneBack != "") {
		warning.text("");
		is_correct_phoneNumber = true;
	}
	if ((phoneFront == "" && phoneBack != "")
			|| (phoneFront != "" && phoneBack == "")) {
		warning.text("번호를 모두 입력하세요.");
		is_correct_phoneNumber = false;
	}
}

/* 회원가입 */
function signup(identify) {
	// check validation
	var validation = true;

	var authority = 1;
	if (identify == 'user') {
		authority = 0;
	}
	if (!is_id_checked) {
		$('#idWarning').text("아이디 중복체크는 필수입니다.");
		validation = false;
	}
	if (!is_correct_pwd) {
		$('#pwdCheckWarning').text("비밀번호를 확인해주세요.");
		validation = false;
	}
	var email;
	if ($("#email-1").val() == "") {
		eamil = null;
	} else {
		if ($("#email-2").val() == '직접입력') {
			email = $("#email-1").val() + "@" + $("#email-3").val();
		} else {
			email = $("#email-1").val() + "@" + $("#email-2").val();
		}
	}

	var phone;
	if (!is_correct_phoneNumber) {
		validation = false;
	} else {
		if ($("#phone-2").val() == "") {
			phone = null;
		} else {
			phone = $("#phone-1").val() + "-" + $("#phone-2").val() + "-"
					+ $("#phone-3").val();
		}
	}
	if ($("#id").val() == '') {
		var idWarning = document.getElementById("idWarning");
		idWarning.style.color = "red";
		$("#idWarning").text("이름은 필수항목입니다.");
		validation = false;
	}
	if ($("#name").val() == '') {
		var nameWarning = document.getElementById("nameWarning");
		nameWarning.style.color = "red";
		$("#nameWarning").text("이름은 필수항목입니다.");
		validation = false;
	}
	if ($("#corp-name").val() == '') {
		var corpWarning = document.getElementById("corpWarning");
		corpWarning.style.color = "red";
		$("#corpWarning").text("기업명은 필수항목입니다.");
		validation = false;
	}
	if (authority == 0) {
		if (!validation) {
			return false;
		}
		var data = {
			"id" : $("#id").val(),
			"pwd" : $("#pwd").val(),
			"name" : $("#name").val(),
			"email" : email,
			"phone" : phone,
			"corp_id" : $("#corp-id").val(),
			"authority" : $("#authority").val()
		};
		sigupPost(data);
	} else {
		var corpPhone;
		if (!is_correct_phoneNumber) {
			validation = false;
		} else {
			if ($("#corp-phone-2").val() == "") {
				$('#corpNumberWarning').text("기업 전화번호는 필수항목입니다.");
				validation = false;
			} else {
				corpPhone = $("#corp-phone-1").val() + "-"
						+ $("#corp-phone-2").val() + "-"
						+ $("#corp-phone-3").val();
			}
		}
		var corpData = {
			"corp_name" : $("#corp-name").val(),
			"phone" : corpPhone
		};
		if (!validation) {
			return false;
		}
		if (validation) {
			$.ajax({
				url : "/insert/corp",
				type : "POST",
				contentType : "application/json",
				dataType : "json",
				data : JSON.stringify(corpData),
				success : function(data) {
					if (data.status == "success") {
						var formData = {
							"id" : $("#id").val(),
							"pwd" : $("#pwd").val(),
							"name" : $("#name").val(),
							"email" : email,
							"phone" : phone,
							"corp_id" : data.data[0].id,
							"authority" : $("#authority").val()
						};
						sigupPost(formData);
					} else {
					}
				},
				error : function(data, textStatus, errorThrown) {
				}
			});
		}
	}
}

function sigupPost(data) {
	$.ajax({
		url : "/signup",
		type : "POST",
		contentType : "application/json",
		dataType : "json",
		data : JSON.stringify(data),
		success : function(data) {
			// 회원가입 성공 페이지로 이동(로그인페이지이동버튼제공)
			location.href = "/signup/ok";
		},
		error : function(data, textStatus, errorThrown) {
		}
	});
}