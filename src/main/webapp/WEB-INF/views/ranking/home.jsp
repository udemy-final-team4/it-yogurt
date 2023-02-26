<%--
  Created by IntelliJ IDEA.
  User: 김민지
  Date: 2023-02-23
  Time: 오후 1:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>랭킹 조회</title>
</head>
<style>
    .allTableBox {
        margin-top: 12%;
    }

    .a-quiz {
        text-decoration: none;
        color: black;
    }

    h1 {
        text-align: center;
    }
</style>
<%@include file="../common/nav.jsp" %>
<body>
<div class="container allTableBox">
    <div class="row">
        <div class="col" style="float: none; margin:0 auto;">
            <div class="tableBox" id="box-table1">
                <h1>🚀 RANKING 🚀</h1>
                <br>
                <h3>가장 많이 푼 퀴즈는?</h3>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col" style="width: 10%">#</th>
                        <th scope="col" style="width: 20%">카테고리</th>
                        <th scope="col" style="width: 70%">퀴즈명</th>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <tr>
                        <th scope="row">1</th>
                        <td>JAVA</td>
                        <td><a href="#" class="a-quiz"> Java는 어떤 프로그래밍 언어인가요?</a></td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>JAVA</td>
                        <td><a href="#" class="a-quiz"> x=10, y=20 일 때 x &lt y의 결과는?</a></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>JAVA</td>
                        <td><a href="#" class="a-quiz"> Java에서 예외처리를 하는 이유는 무엇입니까?</a></td>
                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td>DB</td>
                        <td><a href="#" class="a-quiz"> 다음 중 틀린 sql 구문을 선택하세요.</a></td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>JAVA</td>
                        <td><a href="#" class="a-quiz"> 네트워킹 프로그래밍에서 소켓을 생성하는 메소드는?</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col" style="float: none; margin:0 auto;">
            <div class="tableBox" id="box-table2">
                <br><br>
                <h3>가장 많이 틀린 퀴즈는?</h3>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col" style="width: 10%">#</th>
                        <th scope="col" style="width: 20%">카테고리</th>
                        <th scope="col" style="width: 70%">퀴즈명</th>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <tr>
                        <th scope="row">1</th>
                        <td>JAVA</td>
                        <td><a href="#" class="a-quiz"> 네트워킹 프로그래밍에서 소켓을 생성하는 메소드는?</a></td>
                    </tr>

                    <tr>
                        <th scope="row">2</th>
                        <td>JAVA</td>
                        <td><a href="#" class="a-quiz"> Java의 OutputStream 클래스는 어떤 역할을 하나요?</a></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>JAVA</td>
                        <td><a href="#" class="a-quiz"> Java의 쓰레드란 무엇인가요?</a></td>
                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td>DB</td>
                        <td><a href="#" class="a-quiz"> 다음 중 틀린 sql 구문을 선택하세요.</a></td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>JAVA</td>
                        <td><a href="#" class="a-quiz"> Java IO의 InputStream과 OutputStream은 무엇을 하는 클래스입니까?</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
<%@include file="../common/footer.jsp" %>
</html>
