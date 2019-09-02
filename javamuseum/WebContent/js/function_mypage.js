function memberInfo(no){
		$(".members-wrap > div").hide();
		$.ajax({
			type: "GET",
			url: "/user/mypage/memberInfo",
			data: { "no" : no},
			async: false,
			success: function(data){
				$(".con3").html(data);
				$(".con3-center clear").show();
				$(".members-wrap > div").eq(0).show();
			}
		});
	}
	
	function modPw() {
		$(".togglePw").toggle();
	}
	
	function realCancel() {
		if (confirm("수정하신 정보는 저장되지 않습니다.\n정말 취소하시겠습니까?")) {
			location.href= "/user/index";
        } else {
        }
	}
	
	function realSave() {
		if ($("#name").val() == "") {
			alert("이름을 입력해주세요.");
			$("#name").focus();
			return false;
		}
		if ($("#email").val() == "" || $("#email2").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		if ($("#year").val() == "" || $("#month").val() == 0 || $("#day").val() == "") {
			alert("생년월일을 입력해주세요.");
			$("#year").focus();
			return false;
		}
		if ($("#fTel").val() == "" || $("#mTel").val() == "" || $("#eTel").val() == "") {
			alert("연락처를 입력해주세요.");
			$("#fTel").focus();
			return false;
		}
		if ($("#day").val() < 10 && $("#day").val().length == 1) {
			$("#day").val("0" + $("#day").val());
		}
		// 비밀번호 유효성체크
		if(!validModPassword($("#password"))) return false;
		// 생년월일 유효성체크
		if(!isValidBirth($("#year").val(), $("#day").val())) return false;
		
		
		$("#email2").attr("disabled",false);
		$("#cmd").val("modMemberInfo");
		if (confirm("수정하신 정보를 저장하시겠습니까?")) {
			$.ajax({
				type: "GET",
				url: "/user/member/process",
				data: $("[name=frm]").serialize(),
				async: false,
				success: function(data){
					alert("성공적으로 수정되었습니다.");
					location.href= "/user/index";
				}
			});
		} else {
		}
	}
	
	function realDel(no) {
		$("#cmd").val("delete");
		if($("#con4-pw").val() == "") {
			alert("비밀번호를 입력해주세요.")
		} else {
			$.ajax({
				type: "GET",
				url: "/user/mypage/confirmPassword",
				data: { "no" : no, "password":$("#con4-pw").val()},
				async: false,
				success: function(data){
					var ret = data.trim();
					if (ret == "false") {
						alert("비밀번호가 올바르지 않습니다.");	
						$("#con4-pw").val("");
						$("#con4-pw").focus();
					} else {
						if (confirm("탈퇴시 회원 혜택도 전부 잃습니다\n그래도 정말 탈퇴하시겠습니까?")) {
							$.ajax({
								
								type: "GET",
								url: "/user/member/delete",
								data: {"no" : no},
								async: false,
								success: function(data){
									alert("성공적으로 탈퇴되었습니다.");
									location.href= "/user/index";
								}
							});
				        } else {
				        }
					}
				}
			});
		}
	}