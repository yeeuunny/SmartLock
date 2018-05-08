
function checkEmail(newEmail) {
    var emailVal = newEmail.val();
	var pattern = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	
	if ( ! emailVal) {
        newEmail.focus();
        swal({
	  		  text: "이메일을 입력하세요.",
	  		  icon: "warning",	//error, success, info, warning
	  		  button: {
	  			  confirm : "확인",
	  		  },
	  		});
        return false;
	}

    if ( ! emailVal.match(pattern)) {
        newEmail.focus();
        swal({
	  		  text: "이메일 패턴이 올바르지 않습니다.",
	  		  icon: "warning",	//error, success, info, warning
	  		  button: {
	  			  confirm : "확인",
	  		  },
	  		});
        return false;
    }

    return true;
}
function phoneNofify() {
	$("#phone_number").notify(
			  "숫자만 입력해주세요.",
			  { elementPosition: "right", className: "info", autoHideDelay: 1500}
	);
}
function autoHypen(str){
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if( str.length < 4){
		return str;
	}else if(str.length < 7){
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
		return tmp;
	}else if(str.length < 11){
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 3);
		tmp += '-';
		tmp += str.substr(6);
		return tmp;
	}else{				
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 4);
		tmp += '-';
		tmp += str.substr(7);
		return tmp;
	}
	return str;
}
function checkPhone(newPhone) {
    var phoneVal = newPhone.val();
    var pattern = /^[0-9]+-[0-9]+-[0-9]+/;

    if ( ! phoneVal) {
        newPhone.focus();
        swal({
	  		  text: "전화번호를 입력하세요",
	  		  icon: "warning",	//error, success, info, warning
	  		  button: {
	  			  confirm : "확인",
	  		  },
	  		});
        return false;
    }

    if ( ! phoneVal.match(pattern)) {
        newPhone.focus();
        swal({
	  		  text: "전화번호 패턴이 올바르지 않습니다.",
	  		  icon: "warning",	//error, success, info, warning
	  		  button: {
	  			  confirm : "확인",
	  		  },
	  		});
        return false;
    }

    return true;
}

function checkPwd(newPwd) {
    var pwdVal = newPwd.val();

    if ( ! pwdVal) {
        newPwd.focus();
        swal({
	  		  text: "비밀번호를 입력하세요",
	  		  icon: "warning",	//error, success, info, warning
	  		  button: {
	  			  confirm : "확인",
	  		  },
	  		});
        return false;
    }

    if (pwdVal.length < 8) {
        newPwd.focus();
        swal({
	  		  text: "비밀번호는 8자 이상이어야 합니다.",
	  		  icon: "warning",	//error, success, info, warning
	  		  button: {
	  			  confirm : "확인",
	  		  },
	  		});
        return false;
    }

    if (pwdVal.length > 100) {
        newPwd.focus();
        swal({
	  		  text: "비밀번호는 100자 이하여야 합니다.",
	  		  icon: "warning",	//error, success, info, warning
	  		  button: {
	  			  confirm : "확인",
	  		  },
	  		});
        return false;
    }

    return true;
}

$("#updateProfile").submit(function() {
	if ( ! checkEmail($("#user_email"))) {
		return false;
	}

    if ( ! checkPhone($("#phone_number"))) {
        return false;
    }

	$.ajax({
		url : "/profile/update",
		type : "POST",
        contentType: "application/json",
		dataType : "json",
		data : JSON.stringify({
			"id" : SmartLock.user.id,
			"password" : $("#password").val(),
			"userName" : SmartLock.user.name,
			"email" : $("#user_email").val(),
			"phoneNumber" : $("#phone_number").val(),
            "corpId" : SmartLock.user.corpId,
            "authority" : SmartLock.user.authority
		}),
		success : function (data){
			if(data.status == "success") {
				//회원정보 수정 성공 페이지로 이동(메인페이지 이동버튼 제공)
				location.href="/profile/ok";
			} else {
				$("#password").focus();
				//alert("현재 비밀번호가 일치하지 않습니다.")
				swal({
			  		  text: "현재 비밀번호가 일치하지 않습니다.",
			  		  icon: "warning",	//error, success, info, warning
			  		  button: {
			  			  confirm : "확인",
			  		  },
			  		});
			}
		},
		error : function(data, textStatus, errorThrown) {
			alert("ajax통신실패");
		}
	});
	
	return false;
});

$("#changePassword").submit(function() {
	if ($("#new_password1").val() != $("#new_password2").val()) {
        $("#new_password2").focus();
        //alert("새 비밀번호가 일치하지 않습니다.");
        swal({
	  		  text: "새 비밀번호가 일치하지 않습니다.",
	  		  icon: "warning",	//error, success, info, warning
	  		  button: {
	  			  confirm : "확인",
	  		  },
	  		});
        return false;
	}

	if ( ! checkPwd($("#new_password1"))) {
		return false;
	}

    $.ajax({
        url : "/profile/change/success",
        type : "POST",
        contentType: "application/json",
        dataType : "json",
        data : JSON.stringify({
            "id" : SmartLock.user.id,
            "password" : $("#password").val(),
            "new_password" : $("#new_password1").val()
        }),
        success : function (data){
            if (data.status=="success"){
                location.href = "/profile/changePassword/ok";
            }
            else {
                $("#password").focus();
                swal({
      	  		  text: "현재 비밀번호가 일치하지 않습니다.",
      	  		  icon: "warning",	//error, success, info, warning
      	  		  button: {
      	  			  confirm : "확인",
      	  		  },
      	  		});
            }
        },
        error : function(data, textStatus, errorThrown) {
            alert("ajax통신실패");
        }
    });
	
	return false;
});