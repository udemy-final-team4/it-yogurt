
//adminContents 
// 컨텐츠 등록 버튼 클릭시
$(document).ready(function () {
	
$("#submitBtn").on("click", function(event){
	event.preventDefault();

let formData = $('form').serializeArray();
$.ajax({
    url: '/admin/contents',
    
    type: 'POST',
    dataType:'text',
    contentType: 'application/json; charset=utf-8',
    data: JSON.stringify(formData),
    success: function(response) {
    	alert("등록되었습니다.");
    	window.location.href='/admin/page';
        // 성공적으로 처리된 경우 실행될 코드
    },
    error: function(error) {
    	alert("에러");
        // 오류 발생 시 실행될 코드
    }
});
	
})

})
// adminUser 
function clicked(clickedID,clickedName){
	if (window.confirm(clickedName +"회원을 탈퇴시키겠습니까?"+ "\n\n"+"모든 회원 데이터가 삭제됩니다.\n")){
		location.href="/admin/user/manage/"+clickedID;
		alert("회원탈퇴 되었습니다.");		
	}
	else {
		alert("회원 탈퇴가 취소되었습니다.");		
	}
}
function black(clickedID,clickedEmail,clickedName){
	if (window.confirm(clickedName +"회원을 블랙하시겠습니까?"+ "\n\n"+"모든 회원 데이터가 삭제됩니다.\n")){
		location.href="/admin/user/manage/"+clickedID+"/"+clickedEmail;
		alert("회원을 블랙했습니다.");
	}
	else {
		alert("블랙이 취소되었습니다.");		
	}
	
}

function go_UserPage(pageNum){
	
	
	
	$.ajax({
		url: "user/a?page="+pageNum,
		type: "GET",
		dataType: "json",
		success: function(result){
			let list = result.userList;
			let content = '';
			for(let i=0;i<list.length;i++){
				content += '<tr>';
				content += '<td id ="userSeq">' + list[i].userSeq +'</td>';
				content +=	'<td>'+ list[i].email +'</td>';
				content +=	'<td>'+ list[i].nickname+ '</td>';
				content +=	'<td>'+ list[i].declaration + '</td>';
				content += '<td>' + list[i].lastloginDate + '</td>';
				content += '<td><button class= "delUserBtn" style="border-color: #C0D8C0" onclick="clicked('+list[i].userSeq +',\''+list[i].nickname+'\')">탈퇴</button></td>';
				content += '<td><button class= "black" onclick="black('+list[i].userSeq +',\''+list[i].email+ '\',\''+list[i].nickname+ '\')">블랙</button></td>';
				content += '</tr>';
			}
			$('.listData').html(content);	
			
			let paging = result.paging;
			let content2 = '';
			
				
				content2 += '<nav aria-label="Page navigation example" style="margin: 10px;">';
				content2 += '<ul class="pagination justify-content-center">';
				content2 += '<li class="page-item"><a href=\'javascript:void(0);\' onclick="go_UserPage(1); return false;" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>';
				
				
					content2 += '<li class="page-item"><a href=\'javascript:void(0);\' onclick="go_UserPage('+(Number(paging.startPage)-1)+');return false;" class="page-link"><i class="fas fa-angle-left"></i></a></li>';
				for (let num = Number(paging.startPage) ; num <=Number(paging.endPage); num++){
					if (num == Number(paging.cri.page)){
						content2 += '<li class="page-item active" style="pagination-bg: #91ACCC"><span><a href=\'javascript:void(0);\' onclick="go_UserPage('+num+'); return false;" class="page-link">'+ num +'</a></span></li>';
						
					}
					else{
						content2 += '<li class="page-item" style="pagination-bg: #91ACCC"><span><a href=\'javascript:void(0);\' onclick="go_UserPage('+num+'); return false;" class="page-link">'+ num +'</a></span></li>';
					}
				}
				if (paging.next && paging.endPage>0){
					content2 += '<li class="page-item"><a href=\'javascript:void(0);\' onclick="go_UserPage('+ (Number(paging.endPage)+1)+');return false;" class="page-link"><i class="fas fa-angle-right"></i></a></li>';
				}
				content2 += '<li class="page-item"><a href=\'javascript:void(0);\' onclick="go_UserPage('+ Number(result.maxPage) +');return false;" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>';
				content2 += '</ul>';
				content2 += '</nav>';
			
			
				$('.paging').html(content2);	
		},
		error: function(){
			console.log('error');
		}
	})
}


// adminUserBlack

function black_del(email){
	if (window.confirm(email +"회원을 블랙리스트에서 삭제하시겠습니까?")){
		location.href="/admin/user/black/re?email="+email;
		alert("삭제 되었습니다.");
	}
	else {
		alert("삭제가 취소되었습니다.");
	}
}


/*function go_page(pageNum){



	$.ajax({
		url: "${pageContext.request.contextPath}/admin/user/a?page="+pageNum,
		type: "GET",
		dataType: "json",
		success: function(result){
			let list = result.blackList;
			let content = '';
			for(let i=0;i<list.length;i++){
				content += '<tr>';
				content += '<td >' + i +'</td>';
				content +=	'<td>'+ list[i].email +'</td>';
				content += '<td><button class= "delUserBtn" style="border-color: #C0D8C0" onclick="clicked()">삭제</button></td>';
				content += '</tr>';
			}
			$('.listData').html(content);

			let paging = result.paging;
			let content2 = '';


				content2 += '<nav aria-label="Page navigation example" style="margin: 10px;">';
				content2 += '<ul class="pagination justify-content-center">';
				content2 += '<li class="page-item"><a href=\'javascript:void(0);\' onclick="go_page(1); return false;" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>';


					content2 += '<li class="page-item"><a href=\'javascript:void(0);\' onclick="go_page('+(Number(paging.startPage)-1)+');return false;" class="page-link"><i class="fas fa-angle-left"></i></a></li>';
				for (let num = Number(paging.startPage) ; num <=Number(paging.endPage); num++){
					if (num == Number(paging.cri.page)){
						content2 += '<li class="page-item active" style="pagination-bg: #91ACCC"><span><a href=\'javascript:void(0);\' onclick="go_page('+num+'); return false;" class="page-link">'+ num +'</a></span></li>';

					}
					else{
						content2 += '<li class="page-item" style="pagination-bg: #91ACCC"><span><a href=\'javascript:void(0);\' onclick="go_page('+num+'); return false;" class="page-link">'+ num +'</a></span></li>';
					}
				}
				if (paging.next && paging.endPage>0){
					content2 += '<li class="page-item"><a href=\'javascript:void(0);\' onclick="go_page('+ (Number(paging.endPage)+1)+');return false;" class="page-link"><i class="fas fa-angle-right"></i></a></li>';
				}
				content2 += '<li class="page-item"><a href=\'javascript:void(0);\' onclick="go_page('+ Number(result.maxPage) +');return false;" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>';
				content2 += '</ul>';
				content2 += '</nav>';


				$('.paging').html(content2);
		},
		error: function(){
			console.log('error');
		}
	})
}*/

//adminUserSearch

/*function clicked(clickedID,clickedName){
	if (window.confirm(clickedName +"회원을 탈퇴시키겠습니까?"+ "\n\n"+"모든 회원 데이터가 삭제됩니다.\n")){
		location.href="/admin/user/manage/"+clickedID;
		alert("회원탈퇴 되었습니다.");		
	}
	else {
		alert("회원 탈퇴가 취소되었습니다.");		
	}
}*/
/*function black(clickedID,clickedEmail,clickedName){
	if (window.confirm(clickedName +"회원을 블랙하시겠습니까?"+ "\n\n"+"모든 회원 데이터가 삭제됩니다.\n")){
		location.href="/admin/user/manage/"+clickedID+"/"+clickedEmail;
		alert("회원을 블랙했습니다.");
	}
	else {
		alert("블랙이 취소되었습니다.");		
	}
	
}*/




