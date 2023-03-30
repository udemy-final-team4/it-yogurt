
//boardDetail

  function delboard(boardSeq) {
    if (window.confirm("게시물을 삭제하시겠습니까?\n")) {
      location.href = "/board/d/" + boardSeq;
      alert("게시물 삭제 되었습니다.");
    } else {
      alert("삭제가 취소되었습니다.");
    }
  }

  function reportboard(userSeq) {
    if (window.confirm(" 게시글을 신고하시겠습니까?\n \n 한번 한 신고는 취소되지 않습니다. \n")) {
      location.href = "/board/r/" + userSeq;
      alert("신고되었습니다.");
    }

  }

  function reportcomment(commentSeq) {
    if (window.confirm(" 댓글을 신고하시겠습니까?\n \n 한번 한 신고는 취소되지 않습니다. \n")) {
      location.href = "/board/comment/r/" + commentSeq;
      alert("신고되었습니다.");
    } else {

    }
  }

  function editComment(commentSeq) {
    let content = $('input[name=edit'+commentSeq+']').val();
    let commentBox = "";
    let comment = "";
	
    commentBox = `<form class="mb-4" action="/board/comment/\${commentSeq}" method="post"">
		    	<input type="hidden" name="boardSeq" value=${oneboard.boardSeq }>
		    	<input type="hidden" name="userSeq" value=${sessionScope.user_seq }>
		    	<textarea name="content" class="form-control" rows="3" >\${content}</textarea>
					<button type="submit" class="btn me-md-2" id="commentEdit" style="background-color: #91ACCC;" >수정</button>
		    </form> `;

    $('div[name=edit'+commentSeq+']').html(commentBox);
    console.log("ddd");
  }
  
  
//boardForm

//enter => <br>
var text = document.getElementById("content").value;
text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');


//boardList


$(document).ready(function () {
  $('#search').click(function (e) {
    if ($('#keyword').val() == "") {
      e.preventDefault()
      alert("검색어를 입력해주세요!")
      return false;
    }
  })
});


function go_page(pageNum){

	$.ajax({
		url: "list/a?page="+pageNum,
		type: "GET",
		dataType: "json",
		success: function(result){
			let list = result.boardList;
			let paging = result.paging; 
			let number = (paging.totalCount - ((paging.cri.page-1)* 10));
			let content = '';
			for(let i=0;i<list.length;i++){
				content += '<tr class="tableList" onClick="window.location=\'/board/'+list[i].boardSeq+'\'">';
				content += '<td id ="boardSeq">' + number +'</td>';
				content += '<td><span class="badge bg-secondary text-decoration-none link-light"> '+ list[i].sub +'</span></td>';
				content +=	'<td style="text-align: left;">'+ list[i].title+ '</td>';
				content +=	'<td>'+ list[i].nickname + '</td>';
				content += '<td>' + list[i].viewcount + '</td>';
				content += '</tr>';
				number = number-1;
			}
			$('.listData').html(content);	
			
			let content2 = '';
			
				
				content2 += '<nav aria-label="Page navigation example" style="margin: 10px;">';
				content2 += '<ul class="pagination justify-content-center">';
				content2 += '<li class="page-item"><a href=\'javascript:void(0);\' onclick="go_page(1); return false;" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>';
								
				/* if(paging.prev){ */
					content2 += '<li class="page-item"><a href=\'javascript:void(0);\' onclick="go_page('+(Number(paging.startPage)-1)+');return false;" class="page-link"><i class="fas fa-angle-left"></i></a></li>';
				/* } */
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
}

//boardListSearch

$(document).ready(function () {
  $('#search').click(function (e) {
    if ($('#keyword').val() == "") {
      e.preventDefault()
      alert("검색어를 입력해주세요!")
      return false;
    }
  })
});

//boardUpdateForm

var text = document.getElementById("content").value;
text = text.replace(/(?:\r\n|\r|\n)/g, '<br>');

