<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
footer.footer {
	padding-top: 2rem;
	padding-bottom: 4.5rem;
	position:relative;
	height:180px;
	position: relative;
	bottom: 0px;
}

.footer-link {
	margin-top: 30px;
}
</style>

</head>
<body>
	<footer class="footer" style="background-color: black;z-index:9 !important;">
		<div class="container">
			<div style="margin-bottom:20px;">
				<img src="${contextPath }/resources/images/logo.png" height="60px" style="padding-bottom: 0; padding-top: 0; margin-top: 0; margin-bottom: 0;">
			</div>
			<div class="row">
				<div class="col-lg-6 h-100 text-center text-lg-left my-auto">
					<ul class="list-inline mb-2">
						<li class="list-inline-item"><a class="btn-dark btn-sm"
							href="#">공지사항</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a class="btn-dark btn-sm"
							href="#">운영시간</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a class="btn-dark btn-sm"
							href="#">이용약관</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a class="btn-dark btn-sm"
							href="#">고객센터</a></li>
					</ul>
					<p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
						2020. All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 h-100 text-center text-lg-right my-auto" style="position: relative;top:-15px;">
					<ul class="list-inline mb-0">
						<li class="list-inline-item mr-3"><a href="#" style="color:#17a2b8"> <i
								class="fab fa-facebook fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item mr-3"><a href="#" style="color:#17a2b8"> <i
								class="fab fa-twitter-square fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item"><a href="#" style="color:#17a2b8"> <i
								class="fab fa-instagram fa-2x fa-fw"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>