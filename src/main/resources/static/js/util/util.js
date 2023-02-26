window.util = {
  emptyAlert: (target, isSNS = false) => {
    let value = target.val();
    if (!value || value == "") {
      var label_txt = $("label[for='" + target.attr('id') + "']").text();
      return `${label_txt}을(를) 입력해주세요`;
    }
    return "";
  }

}

var regType = {
  "phone": /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/i,
  "email": /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i,
  "password": /^[A-Za-z0-9]{6,12}$/i
}

function check_reg(check_target, type) {
  if(!regType[type])
    return true;
  return regType[type].test(check_target);
}

let CategorySetting = (data) => {
  let main = $("#main");
  let middle = $("#middle");
  let sub = $("#sub");

  let category_main = {};
  let category_middle = {};
  let category_sub = {};

  data.forEach(function (element) {
    category_main[element.main] = element.main;
  });

  for(key in category_main) {
    main.append(`<option>${key}</option>`)
  }

  data.forEach(function (element) {
    console.log($("#main").val())
    if(element.main == $("#main").val())
    {
      category_middle[element.middle] = element.middle;
    }
  });

  for(key in category_middle) {
    middle.append(`<option>${key}</option>`)
  }

  data.forEach(function (element) {
    console.log($("#middle").val())
    if(element.middle == $("#middle").val())
    {
      category_sub[element.sub] = element.sub;
    }
  });

  for(key in category_sub) {
    sub.append(`<option>${key}</option>`)
  }
}

let change_target = ["main","middle","sub"];
let CategoryTypeSuccess = (data) => {
  let category = {};
  //변경한 카테고리의 하위 카테고리를 변경
  let change_number = change_target.indexOf(data.type) + 1;
  let change_type = change_target[change_number];

  data.list.forEach(function (element) {
    category[element[change_type]] = element[change_type];
  });

  let target_category = $(`#${change_type}`);
  target_category.html("");
  for(key in category) {
    target_category.append(`<option>${key}</option>`)
  }
}

let category_error = (request) => {
  alert(request.responseJSON.errorMessage);
}