<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<style>
.panel-body div{
	border: 1px solid black;
}
.tableBox{
	width: 100%;
	height: 280px;
}
.tableLine{
	width: 100%;
	height: 12%;
}
.tableLine>.tableTitle{
	float: left;
	width: 15%;
	height: 100%;
	text-align: center;
}
.tableLine>.tableValue{
	float: left;
	width: 85%;
	height: 100%;
}
.tableLine>.sector{
	float: left;
	width: 7.1428%;
	height: 100%;
}

.buttonBox{
	text-align: right;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- 아이콘 fontawesome -->
    <script src="https://kit.fontawesome.com/b1e233372d.js"></script>
   <!-- VENDOR CSS -->
   <link rel="stylesheet" href="/assets/vendor/bootstrap/css/bootstrap.min.css">
   <link rel="stylesheet" href="/assets/vendor/font-awesome/css/font-awesome.min.css">
   <link rel="stylesheet" href="/assets/vendor/linearicons/style.css">
   <link rel="stylesheet" href="/assets/vendor/chartist/css/chartist-custom.css">
   <!-- MAIN CSS -->
   <link rel="stylesheet" href="/assets/css/main.css">
   <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
   <link rel="stylesheet" href="/assets/css/demo.css">
   <!-- GOOGLE FONTS -->
   <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
   <!-- ICONS -->
   <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/assets/img/favicon.png">
    <script src="/assets/vendor/jquery/jquery.min.js"></script>
   <script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
   <script src="/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
   <script src="/assets/vendor/chartist/js/chartist.min.js"></script>
   <script src="/assets/scripts/klorofil-common.js"></script>
</head>
<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<jsp:include page="/WEB-INF/views/commonPage/top.jsp" />
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div class="sidebar" id="sidebar-nav">
			<jsp:include page="/WEB-INF/views/commonPage/left.jsp" />
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">근태관리</h3>
					<div class="panel panel-headline demo-icons">
						<!-- pannel 내부의 제목 작성 div-->
						<div class="panel-heading">
							<h3 class="panel-title">나 의 근 태 내 역</h3>
						</div>



						<div class="panel-body">
							<form action="/tna/tnaFixRequestSubmit.tna" method="post" id="formBox">
								<div class="tableBox">
									<div class="tableLine">
										<div class="sector">구 분</div>
										<div class="sector">1 월</div>
										<div class="sector">2 월</div>
										<div class="sector">3 월</div>
										<div class="sector">4 월</div>
										<div class="sector">5 월</div>
										<div class="sector">6 월</div>
										<div class="sector">7 월</div>
										<div class="sector">8 월</div>
										<div class="sector">9 월</div>
										<div class="sector">10 월</div>
										<div class="sector">11 월</div>
										<div class="sector">12 월</div>
										<div class="sector">합 계</div>
									</div>
									<c:forEach varStatus="none" var="list" items="${tnaStatusList}">
									<div class="tableLine">
										<div class="sector">${list.tna_status_name }</div>
										${tnaCountList[0].TNA_START_STATUS_CODE}
									</div>
									</c:forEach>
									
									
									<div class="tableLine">
										<div class="tableTitle">신청 날짜</div>
										<div class="tableValue" id="requestDateDiv">xxxx년 x월 x일 (n요일) [오늘날짜]</div>
									</div>
									<div class="tableLine">
										<div class="tableTitle">현재 상태</div>
										<div class="tableValue" id="currentStatusDiv">STATUS (xxxx/x/x/n) [정정할날짜]</div>
									</div>
									<div class="tableLine">
										<div class="tableTitle">변경요청 상태</div>
										<div class="tableValue">
											<select class="" name="tna_obj_changed_code" id="selectStatus">
												<option value="선택">선택</option>
											<c:forEach varStatus="none" var="list" items="${tnaStatusList}">
												<option value="${list.tna_status_code }">${list.tna_status_name }</option>
											</c:forEach>
											</select>
											
										</div>
									</div>
									<div class="tableLine tableReason">
										<div class="tableTitle">사유</div>
										<div class="tableValue">
											<textarea name="tna_obj_reason" id="textReason"></textarea>
										</div>
									</div>
								</div>
								<div class="buttonBox">
									<input type="submit" class="btn btn-primary btn-xs" value="신청하기">
									<input type="button" class="btn btn-gray btn-xs" value="취소" id="tnaFixCancel">
								</div>
								<input id="" type="hidden" value="${tnaCalendarValue.TNA_SEQ }" name="tna_seq">
								<input id="" type="hidden" value="${tna_status }" name="tna_obj_status">
							</form>
						</div>




					</div>


				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
<jsp:include page="/WEB-INF/views/commonPage/footer.jsp" />
		</footer>
	</div>
	<!-- END WRAPPER -->


</body>
</html>