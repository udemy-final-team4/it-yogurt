<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<nav aria-label="Page navigation example" style="margin: 10px;">
    <ul class="pagination justify-content-center">
        <li class="page-item" id="page-item-max-left"><div class="page-link">처음</div></li>
        <li class="page-item" id="page-item-left"><div class="page-link">이전</div></li>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
            <li class="page-item"  style="pagination-bg: #91ACCC"><div class="page-link">${num}</div></li>
        </c:forEach>
        <li class="page-item" id="page-item-left"><div class="page-link">다음</div></li>
        <li class="page-item" id="page-item-max-left"><div class="page-link">끝</div></li>
    </ul>
</nav>
</body>
</html>
