<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- UIkit JS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/css/uikit.min.css" />
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.14.3/dist/js/uikit-icons.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>PetPlanet</title>
</head>
<body>
<style>
    a {
      text-decoration: none;
    }
    p {
      margin: 0;
    }
    /* FAQ */
    li.uk-parent {
      /* border-top: 1px solid #cccccc; */
      border-bottom: 1px solid #cccccc;
      margin: 0;
    }
    li.uk-parent a {
      padding: 12px 0 12px 20px;
      color: black;
    }
    ul.uk-nav-sub {
      background-color: #fcfcfc;
      border-top: 1px solid #CCCCCC
    }
    ul.uk-nav-sub a {
      padding: 10px 0 10px 0;

    }
    ul.uk-nav-sub li {
      list-style: none;
    }
    ul.uk-nav-sub li::marker {
      color: gray;
    }
    .uk-nav-default .uk-nav-sub a {
      color: black;
    }
    tr{
      text-align: center;
    }
    .mybox{
      padding: 10;
      background-color: #f4f5f9;
      height: 150px;
      width: 660px;
    }
    .side_menu {
      height: 65.5px;
      font-size: 17px;
    }
    textarea {
		font-size: 1.2em; 
		width: 100%; 
		height: 300px; 
		border: 0; 
		font-family: 'BM JUA_TTF'; 
		overflow: hidden; 
		background:none; 
		resize:none;
		min-height: 18rem;
	    overflow-y: hidden;
	}
	pre {
		white-space: pre-wrap;
		word-break: break-all;
		over-flow: auto;
		border: none;
		background: none;
	}
	#like {
		border: 0;
		background: none;
	}
	#hate {
		border: 0;
		background: none;
	}
</style>
<script>
    function FAQ01(){
      var main01 = document.getElementById("customer");
      var main02 = document.getElementById("petsitters");
      var main03 = document.getElementById("user")
      var con01 = document.getElementById("customer_FAQ");
      var con02 = document.getElementById("petsitters_FAQ")
      var con03 = document.getElementById("Q&A")
      if(con01.style.display=='none') {
        main01.style.backgroundColor = '#71A2FF'
        main01.style.color = 'white'
        main02.style.backgroundColor = 'white'
        main02.style.color = 'black'
        main03.style.backgroundColor = 'white'
        main03.style.color = 'black'
        if(con02.style.display != 'none' || con03.style.display != 'none'){
          con03.style.display = 'none'
          con02.style.display = 'none'
          con01.style.display = 'flex';
        } else {
          con01.style.display = 'flex';
        }
      } else {
        main01.style.backgroundColor = 'white'
        main01.style.color = 'black'
        con01.style.display = 'none';
      }
    }
    function FAQ02(){
      var main01 = document.getElementById("customer");
      var main02 = document.getElementById("petsitters");
      var main03 = document.getElementById("user")
      var con01 = document.getElementById("customer_FAQ");
      var con02 = document.getElementById("petsitters_FAQ")
      var con03 = document.getElementById("Q&A")
      if(con02.style.display=='none') {
        main02.style.backgroundColor = '#71A2FF'
        main02.style.color = 'white'
        main01.style.backgroundColor = 'white'
        main01.style.color = 'black'
        main03.style.backgroundColor = 'white'
        main03.style.color = 'black'
        if(con01.style.display != 'none' || con03.style.display != 'none'){
          con03.style.display = 'none'
          con01.style.display = 'none'
          con02.style.display = 'flex';
        } else {
          con02.style.display = 'flex';
        }
      } else {
        main02.style.backgroundColor = 'white'
        main02.style.color = 'black'
        con02.style.display = 'none';
      }
    }
    function FAQ03(){
      var main01 = document.getElementById("customer");
      var main02 = document.getElementById("petsitters");
      var main03 = document.getElementById("user")
      var con01 = document.getElementById("customer_FAQ");
      var con02 = document.getElementById("petsitters_FAQ")
      var con03 = document.getElementById("Q&A")
      if(con03.style.display=='none') {
        main03.style.backgroundColor = '#71A2FF'
        main03.style.color = 'white'
        main01.style.backgroundColor = 'white'
        main01.style.color = 'black'
        main02.style.backgroundColor = 'white'
        main02.style.color = 'black'
        if(con01.style.display != 'none' || con02.style.display != 'none'){
          con02.style.display = 'none'
          con01.style.display = 'none'
          con03.style.display = 'flex';
        } else {
          con03.style.display = 'flex';
        }
      } else {
        main03.style.backgroundColor = 'white'
        main03.style.color = 'black'
        con03.style.display = 'none';
      }
    }
    /* textarea 높이 자동조절 */
    function resize(obj) {
        obj.style.height = '1px';
        obj.style.height = (12 + obj.scrollHeight) + 'px';
    }
    
    // 좋아요 수 관련 함수
    /* 
    function likecount(like) {

    	if (like.src == "http://localhost:8088/J03Project/PetPlanet/image/like_icon1.png") {
     		like.src = "./image/like_icon.png";
     		 
    		location.href='./hate?num=${ QNA.num }';

    	} else if (like.src == "http://localhost:8088/J03Project/PetPlanet/image/like_icon.png") {
     		like.src = "./image/like_icon1.png";

       		location.href='./like?num=${ QNA.num }';

    	}
    }
    */
</script>

<jsp:include page="./common/header.jsp" />
<!-- FAQ -->
<div style="padding-top: 100px; display: flex; justify-content: center;">
    <!-- FAQ_button -->
    <div style="display: flex; justify-content: center; align-items: center; width: 1024px; margin-left: -200px">
	    <a href="javascript:FAQ01();" id="customer" type="button" style="width: 250px; height: 70px; border-radius: 7px; margin-top: 90px; margin-right: 40px; border: 1px solid #CCCCCC; font-size: 20px; color: white; background-color: #71A2FF">
     		<p style="display: flex; justify-content: center; height:100%; padding-top: 20px">고객님을 위한 FAQ</p>
	    </a>
	    <a href="javascript:FAQ02()" id="petsitters" type="button" style="width: 250px; height: 70px; border-radius: 7px; margin-top: 90px; margin-right: 40px; border: 1px solid #CCCCCC; font-size: 20px; color: black">
      		<p style="display: flex; justify-content: center; height:100%; padding-top: 20px">펫시터님을 위한 FAQ</p>
	    </a>
	    <a href="javascript:FAQ03()" id="user" type="button" style="width: 250px; height: 70px; border-radius: 7px; margin-top: 90px; border: 1px solid #CCCCCC; font-size: 20px; color: black">
      		<p style="display: flex; justify-content: center; height:100%; padding-top: 20px">Q & A</p>
	    </a>
    </div>
</div>
<!-- FAQ_memo -->
<div style="display: flex; justify-content: center; margin-left: -250px">
	<!-- customer_FAQ -->
    <div id="customer_FAQ" style="margin-left: -100px; margin-top: 100px; display: flex;">
		<div class="uk-width-1-2@s uk-width-2-5@m" style="margin-left: 350px; border-top: 1px solid #cccccc; width: 1024px;">
	        <ul class="uk-nav-default uk-nav-parent-icon" uk-nav style="width: 1024px;">
			<c:choose>
				<c:when test="${ empty FAQboard01 }">
		        <li class="uk-parent" >
					<a href="#" class="side_menu">
					 <div style="display: flex; justify-content: space-between; ">
					<p style="font-family: 'BM JUA_TTF';">제목이 없어요..ㅠ.ㅠ</p>
					 </div>
					</a>
					<ul class="uk-nav-sub">
						<div style="padding-bottom: 20px; background-color: #fcfcfc;">
							<p id="content" name="content" style="outline: none; margin-top: 20px; padding: 0 12px; font-family: 'BM JUA_TTF';">내용이 없어요..ㅠ.ㅠ</p>
						</div>
					</ul>
				</li>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ FAQboard01 }" var="FAQ01" varStatus="loop">
				<li class="uk-parent" >
					<a href="#" class="side_menu" style="font-family: 'BM JUA_TTF';">
						<div style="display: flex; justify-content: space-between;">
							<p style="font-family: 'BM JUA_TTF';">${ FAQ01.title }</p>
						</div>
					</a>
					<ul class="uk-nav-sub">
					  	<div style="padding-bottom: 20px; background-color: #fcfcfc; display: flex; flex-direction: column; justify-content: space-between;">
					  		<div style="display: flex; justify-content: space-between; align-items: center;">
					  			<div style="width: 900px">
									<pre id="content" name="content" style="outline: none; margin-top: 20px; padding: 0 12px; font-family: 'BM JUA_TTF';">${ FAQ01.content }</pre>
					  			</div>
					  		</div>
						</div>
						<div style="margin-top: 50px; display: flex; justify-content: space-between;">
							<!-- file 관련 -->
							<c:if test="${ not empty FAQ01.ofile }">
							<div style="display: flex; justify-content: flex-start;">
								<img src="../Uploads/${ FAQ01.sfile }" alt="" width="200px"/>
							</div>
							</c:if>
							<!-- 버튼 관련 -->
							<c:if test="${ sessionScope.u_id eq 'masterratte' }" var="result">
							<form style="display: flex; justify-content: flex-end;">
								<div style="margin-top: 150px;">
									<input type="button" onclick="location.href='./editFAQ01?num=${ FAQ01.num }'" value="수정하기" style="border: 0; background: none; color: black; padding-right: 20px; width: 60px;" />
									<input type="button" onclick="location.href='./deleteFAQ01?num=${ FAQ01.num }'" value="삭제하기" style="border: 0; background: none; color: black; width: 60px;" />
								</div>
							</form>
							</c:if>
						</div>
					</ul>
	           </li>				
					</c:forEach>
				</c:otherwise>
			</c:choose>          
	        </ul>
	       	<!-- 페이지 번호 -->
			<div class="row mt-3">
		        <ul class="pagination justify-content-center">
		        	${ map01.pagingImg01 }
		        </ul>
			</div>   
		    <c:if test="${ sessionScope.u_id eq 'masterratte' }">
		    <div style="display: flex; justify-content: right; width: 1000px; margin-top: 50px">
		        	<a href="./writeFAQ01" style="text-align:center;padding-top:10px; color: #81A3F0; font-weight: bold; width: 120px; height:45px; border: 1px solid #81A3F0; border-radius: 20px">작성하기</a>
			</div>
		    </c:if>
		</div>
    </div>
    <!-- petsitters_FAQ -->
    <div id="petsitters_FAQ" style="margin-left: -100px; margin-top: 100px; display: none">
   		<div class="uk-width-1-2@s uk-width-2-5@m" style="margin-left: 350px; border-top: 1px solid #cccccc; width: 1024px;">
	        <ul class="uk-nav-default uk-nav-parent-icon" uk-nav style="width: 1024px;">
			<c:choose>
				<c:when test="${ empty FAQboard02 }">
		        <li class="uk-parent" >
					<a href="#" class="side_menu">
						<div style="display: flex; justify-content: space-between;">
							<p style="font-family: 'BM JUA_TTF';">제목이 없어요..ㅠ.ㅠ</p>
						</div>
					</a>
					<ul class="uk-nav-sub">
						<div style="padding-bottom: 20px; background-color: #fcfcfc;">
							<p id="content" name="content" style="outline: none; margin-top: 20px; padding: 0 12px; font-family: 'BM JUA_TTF';">내용이 없어요..ㅠ.ㅠ</p>
						</div>
			          	<div style="display: flex; justify-content: right; width: 1000px; margin-top: 50px">
							<a href="javascript:login();" style="color: black;">로그인</a>
					  	</div>
					</ul>
				</li>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ FAQboard02 }" var="FAQ02" varStatus="loop">
				<li class="uk-parent" >
					<a href="#" class="side_menu" style="font-family: 'BM JUA_TTF';">
						<div style="display: flex; justify-content: space-between;">
							<p style="font-family: 'BM JUA_TTF';">${ FAQ02.title }</p>
						</div>
					</a>
					<ul class="uk-nav-sub">
					  	<div style="padding-bottom: 20px; background-color: #fcfcfc; display: flex; flex-direction: column; justify-content: space-between;">
					  		<div style="display: flex; justify-content: space-between; align-items: center;">
					  			<div style="width: 900px">
									<pre id="content" name="content" style="outline: none; margin-top: 20px; padding: 0 12px; font-family: 'BM JUA_TTF';">${ FAQ02.content }</pre>
					  			</div>
					  		</div>
						</div>
						<div style="margin-top: 50px; display: flex; justify-content: space-between;">
							<!-- file 관련 -->
							<c:if test="${ not empty FAQ02.ofile }">
							<div style="display: flex; justify-content: flex-start;">
								<img src="../Uploads/${ FAQ02.sfile }" alt="" width="200px"/>
							</div>
							</c:if>
							<!-- 버튼 관련 -->
							<c:if test="${ sessionScope.u_id eq 'masterratte' }" var="result">
							<form style="display: flex; justify-content: flex-end;">
								<div style="margin-top: 150px;">
									<input type="button" onclick="location.href='./editFAQ02?num=${ FAQ02.num }'" value="수정하기" style="border: 0; background: none; color: black; padding-right: 20px; width: 60px;" />
									<input type="button" onclick="location.href='./deleteFAQ02?num=${ FAQ02.num }'" value="삭제하기" style="border: 0; background: none; color: black; width: 60px;" />
								</div>
							</form>
							</c:if>
						</div>
					</ul>
	           </li>				
					</c:forEach>
				</c:otherwise>
			</c:choose>
	        </ul>
	       	<!-- 페이지 번호 -->
			<div class="row mt-3">
		        <ul class="pagination justify-content-center">
		        	${ map02.pagingImg02 }
		        </ul>
			</div>
			<c:if test="${ sessionScope.u_id eq 'masterratte' }">
		    <div style="display: flex; justify-content: right; width: 1000px; margin-top: 50px">
		        	<a href="./writeFAQ02" style="text-align:center; padding-top:10px; color: #81A3F0; font-weight: bold; width: 120px; height:45px; border: 1px solid #81A3F0; border-radius: 20px">작성하기</a>
			</div>
		    </c:if>
   		</div>
    </div>
    <!-- Q&A -->
    <div id="Q&A" style="margin-left: -100px; margin-top: 100px; display: none">
	    <div style="margin-left: 350px; border-top: 1px solid #cccccc; width: 1024px;">
	        <ul uk-nav style="width: 1024px;">
			<c:choose>
				<c:when test="${ empty boardLists }">
		        <li class="uk-parent" >
					<a href="#" class="side_menu">
					 <div style="display: flex; justify-content: space-between; ">
					<p style="font-family: 'BM JUA_TTF';">제목이 없어요..ㅠ.ㅠ</p>
					 </div>
					</a>
					<ul class="uk-nav-sub">
						<div style="padding-bottom: 20px; background-color: #fcfcfc;">
							<p id="content" name="content" style="outline: none; margin-top: 20px; padding: 0 12px; font-family: 'BM JUA_TTF';">내용이 없어요..ㅠ.ㅠ</p>
						</div>
			          	<div style="display: flex; justify-content: right; width: 1000px; margin-top: 50px">
							<a href="javascript:login();" style="color: black;">로그인</a>
					  	</div>
					</ul>
				</li>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ boardLists }" var="QNA" varStatus="loop">
				<li style="border-top: 1px solid #cccccc;">
					<a href="./QNA?num=${ QNA.num }" style="font-family: 'BM JUA_TTF'; display: flex; justify-content: space-between;">
						<div style="display: flex; justify-content: space-between; margin-left: 20px; margin-top: 20px; font-size: 20px">
							<p style="font-family: 'BM JUA_TTF';">${ map.totalCount - (((map.pageNum - 1 ) * map.pageSize) + loop.index) }.</p>
							<p style="font-family: 'BM JUA_TTF';">${ QNA.title }</p>
						</div>
						<div style="padding-top: 10px; display:flex; width: 80px; justify-content: flex-end">
							<img src="./image/id_icon01.png" alt="" style="width: 20px; height: 20px;"/>
							<p style="margin-left: 10px">${ QNA.visitcount }</p>
						</div>
					</a>
					<div style="display: flex; justify-content: flex-end">
						<p style="font-family: 'BM JUA_TTF';">${ QNA.id }</p>
					</div>
	           </li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
	        </ul>
	        <!-- 페이지 번호 -->
			<div class="row mt-3">
		        <ul class="pagination justify-content-center">
		        	${ map.pagingImg }
		        </ul>
			</div>
		    <%
				if (session.getAttribute("u_id") != null) {
			%>	
		    <div style="display: flex; justify-content: right; width: 1000px; margin-top: 50px">
		        <a href="./writeQNA" style="text-align:center;padding-top:10px; color: #81A3F0; font-weight: bold; width: 120px; height:45px; border: 1px solid #81A3F0; border-radius: 20px">작성하기</a>
	        </div>
		    <%
				} else {
			%>
			<div style="display: flex; justify-content: right; width: 1000px; margin-top: 50px">
				<a href="javascript:login();" style="text-align:center;padding-top:10px; color: #81A3F0; font-weight: bold; width: 120px; height:45px; border: 1px solid #81A3F0; border-radius: 20px">작성하기</a>
			</div>
			<%
			} 
			%>
	    </div>
    </div>
</div>
<div style="margin-top: 200px"></div>
<jsp:include page="./common/foot.jsp" />
</body>
</html>
