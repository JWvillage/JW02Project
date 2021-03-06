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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
		font-size: 16px
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

    /* textarea ?????? ???????????? */
    function resize(obj) {
        obj.style.height = '1px';
        obj.style.height = (12 + obj.scrollHeight) + 'px';
    }
</script>
<script>
$(function(){
	
	$('button[name=like]').click(function(){

		$.ajax({
			
			url : "./like",
			
			type : "GET",
			
			data : {
				num : '${ qto.num }',
				u_id : '${ sessionScope.u_id }',
				naver_id : '${ sessionScope.naver_id }',
				like_check : $('#like_check').val()
			},

			success : function () {
				
				if($('#like_check').val()==0){
					console.log("plus");
					$('#like_check').val('1');
					$('#like_img').attr('src', "./image/like_icon.png");
					var val01 = $('#like_num').val();
					var val02 = parseInt(val01) + 1;
					$('#like_num').val(val02);
					
					if($('#like_id').val() == '') {
						if ('${ sessionScope.u_id }' != "") {
							$('#like_id').val('${ sessionScope.u_id }');							
						} else {
							$('#like_id').val('${ sessionScope.naver_id }');
						}
					}
				}
				else{
					console.log("minus");
					$('#like_check').val('0');
					$('#like_img').attr('src', "./image/like_icon2.png");
					var val01 = $('#like_num').val();
					var val02 = parseInt(val01) - 1;
					$('#like_num').val(val02);
				}
			},
			
			error : function () {
				console.log("??????");
			},
		});
	});
});
</script>
<!-- confirm ??? ????????? -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
$().ready(function () {
    $("#delete").click(function () {
        Swal.fire({
            title: '????????? ????????? ???????????????????',
            text: "?????? ????????? ??? ????????????. ???????????????.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '??????',
            cancelButtonText: '??????'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    '????????? ?????????????????????.',
                    'success'
                )
                location.href='./delete?num=${ qto.num }';
            }
        })
    });
});

</script>
<jsp:include page="./common/header.jsp" />
<div style="padding-top: 100px; display: flex; justify-content: center;">
    <!-- Q&A_button -->
    <div style="display: flex; justify-content: center; align-items: center; width: 1024px;">
	    <div id="user" style="width: 250px; height: 70px; border-radius: 7px; margin-top: 90px; border: 1px solid #CCCCCC; font-size: 20px; color: black">
      		<p style="display: flex; justify-content: center; height:100%; padding-top: 20px">Q & A</p>
	    </div>
    </div>
</div>
<!-- Q&A_memo -->
<div style="display: flex; justify-content: center; margin-left: -250px">
    <!-- Q&A -->
	<form>
	<div id="Q&A" style="margin-left: -100px; margin-top: 100px; display: flex">
	    <div class="uk-width-1-2@s uk-width-2-5@m" style="margin-left: 350px; border-top: 1px solid #cccccc; width: 1024px;">
	        <ul class="uk-nav-default uk-nav-parent-icon" uk-nav style="width: 1024px;">
				<li>
					<div style="font-family: 'BM JUA_TTF'; display: flex; justify-content: space-between;">
						<div style="display: flex; justify-content: flex-start; margin-left: 20px; margin-top: 20px; font-size: 20px">
							<p style="font-family: 'BM JUA_TTF';">${ qto.num }.</p>
							<p style="font-family: 'BM JUA_TTF';">${ qto.title }</p>
						</div>
						<div style="padding-top: 20px; display:flex; width: 80px; justify-content: flex-end">
							<img src="./image/id_icon01.png" alt="" style="width: 20px; height: 20px;"/>
							<p style="margin-left: 10px">${ qto.visitcount }</p>
						</div>
					</div>
					<div style="display: flex; justify-content: flex-end">
						<p style="font-family: 'BM JUA_TTF';">${ qto.id }</p>
					</div>
					<ul class="uk-nav-sub">
					  	<div style="padding-bottom: 20px; background-color: #fcfcfc; display: flex; flex-direction: column; justify-content: space-between;">
					  		<div style="display: flex; justify-content: space-between; align-items: center;">
					  			<div style="width: 900px">
									<pre id="content" name="content" style="outline: none; margin-top: 20px; padding: 0 12px; font-family: 'BM JUA_TTF';">${ qto.content }</pre>
					  			</div>
								<div style="display: flex; justify-content: flex-end; align-items: center;">
									<p style="margin-top: 20px; font-family: 'BM JUA_TTF'; display: flex; justify-content: center">
									<!-- ????????? ?????? -->
									<c:if test="${ not empty sessionScope.u_id or not empty sessionScope.naver_id }" var="result1">
											<input type="hidden" id="like_id" name="like_id" value="${ lto.id }"/>
											<input type="hidden" id="num" name="num" value="${ lto.num }" />
											<input type="hidden" id="like_check" name="like_check" value="${ lto.like_check }"/>
											<input type="hidden" value="${ qto.num }"/>
											<button type="button" id="like" name="like">
											<c:if test="${ lto.like_check eq 0 }" var="like">
												<img id="like_img" src="./image/like_icon2.png" alt="" width="20px" style="margin-bottom: 20px"/>
											</c:if>
											<c:if test="${ lto.like_check eq 1 }">
												<img id="like_img" src="./image/like_icon.png" alt="" width="20px" style="margin-bottom: 20px"/>
											</c:if>
											</button>
									</c:if>
									<!-- ??? ????????? ?????? -->
									<c:if test="${ not result1 }">
										<img src="./image/like_icon.png" alt="?????????" width="20px" style="padding-bottom: 20px" />
									</c:if>
										<input type="text" id="like_num" style="width: 20px; height: 20px; border: 0" value="${ qto.likecount }"/>
									</p>
								</div>
					  		</div>
						</div>
						<div style="margin-top: 50px; display: flex; justify-content: space-between;">
						<c:if test="${ not empty qto.ofile }">
						<div style="display: flex; justify-content: flex-start;">
							<img src="../Uploads/${ qto.sfile }" alt="" width="200px" />
							<a href="./download?ofile=${ qto.ofile }&sfile=${ qto.sfile }&num=${ qto.num }" style="padding-top: 150px">
								<img src="./image/download.png" alt="?????????" width="20px"/>
							</a>
						</div>
						</c:if>
						<c:if test="${ sessionScope.u_id eq qto.id or sessionScope.naver_id eq qto.id }" var="result">
						<form style="display: flex; justify-content: flex-end;">
						<div style="margin-top: 150px;">
							<input type="button" onclick="location.href='./edit?num=${ qto.num }'" value="????????????" style="border: 0; background: none; color: black; padding-right: 20px; width: 60px;" />
							<input type="button" id="delete" value="????????????" style="border: 0; background: none; color: black; width: 60px;" />
						</div>
						</form>
						</c:if>
						<c:if test="${ sessionScope.u_id eq null and sessionScope.naver_id }">
							<a href="javascript:login();" style="color: black; width: 40px; padding-top: 150px">?????????</a>
						</c:if>
						</div>
					</ul>
	           </li>
	        </ul>
	        <div style="display: flex; justify-content: right; width: 1000px; margin-top: 50px">
				<a href="./board" style="text-align:center;padding-top:10px; color: #81A3F0; font-weight: bold; width: 120px; height:45px; border: 1px solid #81A3F0; border-radius: 20px">????????????</a>
			</div>
	    </div>
    </div>	
	</form>
</div>
<div style="margin-top: 200px"></div>
<jsp:include page="./common/foot.jsp" />
</body>
</html>
