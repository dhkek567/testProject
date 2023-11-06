<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 bg-gradient-dark" id="sidenav-main">
	<div class="sidenav-header">
		<i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i> 
		<a class="navbar-brand m-0" href="" target="_blank"> 
			<img src="${pageContext.request.contextPath }/resources/assets/img/logo-ct.png" class="navbar-brand-img h-100" alt="main_logo"> 
			<span class="ms-1 font-weight-bold text-white">대덕인재개발원</span>
		</a>
	</div>
	<hr class="horizontal light mt-0 mb-2">
	<div class="collapse navbar-collapse  w-auto" id="sidenav-collapse-main">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link text-white active bg-gradient-primary" href="../pages/tables.html">
					<div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
						<i class="material-icons opacity-10">table_view</i>
					</div> 
					<span class="nav-link-text ms-1">공지사항</span>
				</a>
			</li>
		</ul>
	</div>
</aside>