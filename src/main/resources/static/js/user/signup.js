let isSNSUser = false;

$(document).ready(function () {

  if (isSNSUser) {
    $(".form-input-email").hide();
    $(".form-input-password").hide();
    $(".form-input-password-check").hide();
  }

  // 카테고리 가져오기
  window.ajax.request("/category", {}, CategorySetting, category_error)
  //window.ajax.request("/category", {data:{type : "middle",}}, MainCategorySuccess, category_error)

  // 카테고리 변경 시
  $("select").on("change", function (event) {
    let type = $(this).attr("id");
    let type_value = $(this).val();
    window.ajax.request(`/category/${type}`,
        {data: {type: "GET", type_value: type_value}}, CategoryTypeSuccess,
        category_error)
  })

  // 회원가입 submit
  $("#signup_form").on("submit", function (event) {
    event.preventDefault();

    let result;
    $('#signup_form input:not([type=image],[type=button],[type=submit], [type=checkbox])')
    .each(
        function () {
          //SNS 사용자는 password 입력 제외
          let target = $(this);
          if (isSNSUser && (target.attr("id") == ("password") || $(this).attr(
                  "id")
              == ("password_check"))) {
            return true;
          }

          result = window.util.emptyAlert(target);

          if (result != "") {
            return false;
          } else {
            type = target.attr("id");
            if (!check_reg(target.val(), type)) {
              result = $("label[for='" + target.attr('id') + "']").text()
                  + " 형식이 맞지 않습니다. 다시 확인해주세요.";
              return false;
            }
          }
        })

    // 빈 값이 있는 경우
    if (result != "") {
      alert(result);
      return;
    } else if (($("#password").val() != $("#password_check").val())
        && !isSNSUser) {
      alert('비밀번호가 다릅니다. 다시 입력해주세요');
      return;
    } else if (!($("#subscribe").prop("checked"))) {
      alert('구독에 동의하셔야 서비스 가입이 가능합니다');
      return;
    }

    let fd = new FormData($('#signup_form')[0]);
    // let category = {
    //   "main": fd.get("category_main"),
    //   "middle": fd.get("category_middle"),
    //   "sub": fd.get("category_sub"),
    // }
    // fd.append("category", category);

    console.log(fd);
    window.ajax.sendForm("/user/1", fd, success, error);
  })

});
let success = () => {
  alert("회원가입이 완료 되었습니다.")
  window.location.href = "/user";
}
let error = (request) => {
  alert(request.responseJSON.errorMessage);
}

