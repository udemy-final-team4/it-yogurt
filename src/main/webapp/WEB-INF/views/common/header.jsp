<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header">
    <div id="title">


        <a href="<%=request.getContextPath()%>/" style="text-decoration-line: none; color:black;">IT Yogurt</a>
    </div>

    <div class="nav">
        <ul class="nav-menu">
            <li id="nav-menu-knowledge">
                <a href="<%=request.getContextPath()%>/knowledge/list?category=all" style="text-decoration-line: none; color:white;">매일지식</a>
            </li>
            <li id="nav-menu-quiz">
                <a href="<%=request.getContextPath()%>/board/list" style="text-decoration-line: none; color:white;">게시판</a>
            </li>
            <c:if test="${not empty sessionScope.user_seq}">
                <li id="nav-menu-mypage">
                    <a href="<%=request.getContextPath()%>/myPage/${sessionScope.user_seq}" style="text-decoration-line: none; color:white;">마이 페이지</a>
                </li>
            </c:if>
        </ul>
    </div>
</div>