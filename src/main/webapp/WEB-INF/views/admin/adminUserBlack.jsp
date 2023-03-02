<%@ include file="../common/tag.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <!-- <link href="/css/header.css" rel="stylesheet">
    <link href="/css/footer.css" rel="stylesheet"> -->
    <link href="/css/container.css" rel="stylesheet">
    <link href="/css/admin.css" rel="stylesheet">
 	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" rel="stylesheet"/>


<title> 관리자 | 유저관리 </title>
</head>

<style>

</style>
<%@include file="../common/nav.jsp" %>
<body>
<div class="container">
	<div class="content">
        <div class="form" id="user-form">
            <button class="btn btn-primary px-5 py-2" onclick="location.href='/admin/user'">회원관리</button>
            <button class="btn btn-primary px-5 py-2" onclick="location.href='/admin/contents'">컨텐츠 관리</button> <br><br>
            <h3 id="main" >👤 블랙 회원 👤</h3> <br>
            <button class="btn btn-primary px-5 py-2" onclick="location.href='/admin/user/black'">블랙 회원</button> <br><br>
            <table class="table">
                <tr>
                    <th> 번호 </th>
                    <th> 이메일 </th>
                    <th> </th>

                </tr>
                <tbody class="listData">
                <c:forEach items="${blackList }" var="list">
                <c:set var="num" value="${num+1}"/>
                <tr>
                    <td>${num }</td>
                    <td>${list.email }</td>

                    <td><button class= "black" onclick="black_del('${list.email}')">삭제</button></td>
                </tr>

                </c:forEach>
                </tbody>
            </table>


        <div class="paging">
            <nav aria-label="Page navigation example" style="margin: 10px;">
                <ul class="pagination justify-content-center">
                <li class="page-item"><span><a href='javascript:void(0);' onclick="go_page(1); return false;" class="page-link"><i class="fas fa-angle-double-left"></i></a></span></li>
            <%-- <c:if test="${paging.prev}"> --%>
                <li class="page-item"><span><a href='javascript:void(0);' onclick="go_page(${paging.startPage-1});" class="page-link"><i class="fas fa-angle-left"></i></a></span></li>
           <%--  </c:if> --%>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                <c:choose>
                    <c:when test= "${num==1 }">
                        <li class="page-item active" style="pagination-bg: #91ACCC"><span><a href='javascript:void(0);' onclick="go_page(${num}); return false;" class="page-link">${num}</a></span></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item" style="pagination-bg: #91ACCC"><span><a href='javascript:void(0);' onclick="go_page(${num}); return false;" class="page-link">${num}</a></span></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <%-- <c:if test="${paging.next && paging.endPage>0}"> --%>
                <li class="page-item"><span><a href='javascript:void(0);' onclick="go_page(${paging.endPage+1});return false;" class="page-link"><i class="fas fa-angle-right"></i></a></span></li>
             <%--</c:if> --%>
                <li class="page-item"><span><a href='javascript:void(0);' onclick="go_page(${maxpage});return false;" class="page-link"><i class="fas fa-angle-double-right"></i></a></span></li>
                </ul>
            </nav>
        </div>
    </div>
</div>

</div>
</body>
<%@include file="../common/footer.jsp" %>
<script>

function black_del(email){
	if (window.confirm(email +"회원을 블랙리스트에서 삭제하시겠습니까?")){
		location.href="/admin/user/black/re?email="+email;
		alert("삭제 되었습니다.");
	}
	else {
		alert("삭제가 취소되었습니다.");
	}
}


function go_page(pageNum){



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
</script>
</html>