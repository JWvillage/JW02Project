<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>FAQ</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
</head>
<style>
*{
	font-family : 'BM JUA_TTF';
}
a {
	text-decoration: none;
	
}
.sb-nav-link-icon {
	color : white;
}

.nav-link {
	color : white;
}
pre {
	white-space: pre-wrap;
	word-break: break-all;
	over-flow: auto;
	border: none;
	background: none;
	font-size: 16px
}
</style>
<script>

/* textarea 높이 자동조절 */
function resize(obj) {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
}

function checkForm(fm) {
	
	if(!fm.title.value) {
		alert("제목을 입력하세요.");
		fm.title.focus();
		return false;
	}
	if(!fm.content.value) {
		alert("내용을 입력하세요.");
		fm.content.focus();
		return false;
	}
}
</script>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: #71A7FF;">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="../petplanet.do">PetPlanet</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li><hr class="dropdown-divider" /></li>
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion" id="sidenavAccordion" style="background-color: #71A7FF; color: white">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Core</div>
                        <a class="nav-link" href="admin.jsp">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>
                        <div class="sb-sidenav-menu-heading">Interface</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Board
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="./customerFAQ">Customer_FAQ</a>
                                <a class="nav-link" href="./petsittersFAQ">PetSitters_FAQ</a>
                                <a class="nav-link" href="./AdminQNA">Q&A</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                Information
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        Member Info
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="./memberInfo">Member</a>
                                        </nav>
                                    </div>
                                </nav>
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth1" aria-expanded="false" aria-controls="pagesCollapseAuth1">
                                        PetSitter Info
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="">PetSitter</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Start Bootstrap
                </div>
            </nav>
       	</div>
       	<div style="padding-top: 100px; display: flex; justify-content: center; position: absolute; left: 30%">
		    <!-- FAQ_button -->
		    <div style="display: flex; justify-content: center; align-items: center; width: 1024px;">
			    <div id="user" style="width: 250px; height: 70px; border-radius: 7px; margin-top: 90px; border: 1px solid #CCCCCC; font-size: 20px; color: black">
		      		<p style="display: flex; justify-content: center; height:100%; padding-top: 20px">Q & A</p>
			    </div>
		    </div>
		</div>
       	<!-- FAQboardView -->
		<form>
			<input type="hidden" name="num" value="${ qto.num }"/>
			<div id="Q&A" style="display: flex; justify-content: center; position: absolute; left: 30%; top: 20%">
				<div style="margin-top: 200px; border-top: 1px solid #cccccc; width: 1024px;">
					<div style="border-bottom: 1px solid #cccccc;">
						<p id="title" name="title" style="font-size: 1.2em; width: 1000px; height: 52px; padding-top: 20px; padding-left: 10px">${ qto.title }</p>
					</div>
					<div style="border-bottom: 1px solid #cccccc; padding-bottom: 20px; background-color: #fcfcfc;">
						<pre id="content" name="content" style="outline: none; margin-top: 20px; padding: 0 12px;">${ qto.content }</pre>
						<!-- 각종 button -->
						<div style="margin-top: 50px; display: flex; justify-content: space-between;">
						<c:if test="${ not empty qto.ofile }">
							<div style="display: flex; justify-content: flex-start;">
								<img src="../Uploads/${ qto.sfile }" alt="" width="200px"/>
								<a href="../PetPlanet/download?ofile=${ qto.ofile }&sfile=${ qto.sfile }&num=${ qto.num }" style="padding-top: 150px">
									<img src="../PetPlanet/image/download.png" alt="이미지" width="20px"/>
								</a>
							</div>
						</c:if>
						<c:if test="${ sessionScope.u_id eq qto.id }" var="result">
							<form style="display: flex; justify-content: flex-end;">
							<div style="margin-top: 150px;">
								<input type="button" onclick="location.href='./editCustomerFAQ?num=${ qto.num }'" value="수정하기" style="border: 0; background: none; color: black; padding-right: 20px; width: 60px;" />
								<input type="button" onclick="location.href='./deleteCustomerFAQ?num=${ qto.num }'" value="삭제하기" style="border: 0; background: none; color: black; width: 60px;" />
							</div>
							</form>
						</c:if>
						<c:if test="${ sessionScope.u_id eq null }">
							<a href="javascript:login();" style="color: black; width: 40px; padding-top: 150px">로그인</a>
						</c:if>
						</div>				
					</div>
				</div>
			</div>
		</form>
	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>
</html>