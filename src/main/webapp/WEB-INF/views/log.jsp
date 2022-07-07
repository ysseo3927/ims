<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        .grid-cell-centered-and-bold {
            text-align: center;
            font-weight: bold;
        }
    </style>
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- ag grid -->
    <script src="/resources/vendor/ag-grid/ag-grid-community.min.js"></script>

    <script>
        const columnDefs = [
            { field: "선택", headerCheckboxSelection: true,checkboxSelection:true, sortable: false, colSpan: params => params.data.선택 === "전체 평균 값" ? 3 : 0, cellClass: "grid-cell-centered-and-bold"},
            { field: "일시" , sortable: true},
            { field: "ION상태" , sortable: true},
            { field: "공기질" , sortable: true},
            { field: "미세먼지" , sortable: true},
            { field: "초미세먼지" , sortable: true},
            { field: "극초미세먼지" , sortable: true},
            { field: "TVOC" , sortable: true},
            { field: "이산화탄소" , sortable: true},
            { field: "온도" , sortable: true},
            { field: "습도" , sortable: true},
            { field: "비고" , sortable: false, width:338}
        ];

        // specify the data
        const rowData = [
            { 선택: "", 일시: "20220411-001315", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-001415", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-001515", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-001615", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-001715", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-001815", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-001915", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-002015", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-002115", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-002215", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-002315", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-002415", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-002515", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-002615", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-002715", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-002815", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-002915", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-003015", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-003115", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-003215", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-003315", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-003415", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-003515", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-003615", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-003715", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-003815", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-003915", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-004015", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-004115", ION상태: "OFF", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
            { 선택: "", 일시: "20220411-004215", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""},
        ];

        // let the grid know which columns and what data to use
        const gridOptions = {
            columnDefs: columnDefs,
            rowData: rowData,
            debounceVerticalScrollbar: true,
            defaultColDef: {
                resizable: true,
            },
            sortable: true,
            pagination: true,
            paginationPageSize: 100,
            rowSelection: 'multiple',
            suppressRowClickSelection: true
            //paginationAutoPageSize: true
        };

        // setup the grid after the page has finished loading
        document.addEventListener('DOMContentLoaded', () => {
            const gridDiv = document.querySelector('#myGrid');
            new agGrid.Grid(gridDiv, gridOptions);

            const allColumnIds = [];
            gridOptions.columnApi.getColumns().forEach((column) => {
                allColumnIds.push(column.getId());
            });

            allColumnIds.pop();
            gridOptions.columnApi.autoSizeColumns(allColumnIds, false);

            gridOptions.api.setPinnedTopRowData([ { 선택: "전체 평균 값", 일시: "20220411-004215", ION상태: "ON", 공기질:"150.00", 미세먼지: "25.38", 초미세먼지: "9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.0", 비고:""}]);

        });

    </script>
    <script>
        function onPageSizeChanged() {
            var value = document.getElementById('page-size').value;
            gridOptions.api.paginationSetPageSize(Number(value));
        }

        function addBottomGridArea(){

            var navTopBar = document.getElementById('navTopBar');
            navTopBar.style.height = "4.375rem";

            $("#myGrid").css("height","580px");
            $("body").toggleClass("sidebar-toggled");
            $(".sidebar").toggleClass("toggled");
            $("#controlView").text("+화면 확장");

            var div = document.getElementById('sideDiscription');
            div.style.visibility = "";

            var logo = document.getElementById('logo');
            logo.style.visibility = "";

            $("#logoDiv").css("height","4.375rem");


            if ($(".sidebar").hasClass("toggled")) {

                var navTopBar = document.getElementById('navTopBar');
                navTopBar.style.height = "2rem";

                $("#myGrid").css("height","780px");
                $('.sidebar .collapse').collapse('hide');
                $("#controlView").text("-화면 축소");

                var div = document.getElementById('sideDiscription');
                div.style.visibility = "hidden";

                var logo = document.getElementById('logo');
                logo.style.visibility = "hidden";

                $("#logoDiv").css("height","0");
            };

            $('#myGrid').focus();

        }

    </script>
    <script>

        /* 상단 우측 시계 */
        function showClock() {
            var currentDate=new Date();
            var divClock=document.getElementById("clock");
            var month = currentDate.getMonth()+1;
            var date = currentDate.getDate();
            var hours = currentDate.getHours();
            var minutes = currentDate.getMinutes();
            var seconds = currentDate.getSeconds();

            if(currentDate.getMonth()+1 < 10){
                month = "0" + (currentDate.getMonth()+1);
            }
            if(currentDate.getDate() < 10){
                date = "0" + (currentDate.getDate());
            }
            if(currentDate.getHours() < 10){
                hours = "0" + (currentDate.getHours());
            }
            if(currentDate.getMinutes() < 10){
                minutes = "0" + currentDate.getMinutes();
            }
            if(currentDate.getSeconds() < 10){
                seconds = "0" + currentDate.getSeconds();
            }
            var msg = currentDate.getFullYear() + "-" + month + "-" + date + " " +  hours + ":" + minutes + ":" + seconds;

            divClock.innerText=msg;

            setTimeout(showClock,1000);
        }

        function goLogin(){

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "GET");
            form.setAttribute("action", "/");
            document.body.appendChild(form);
            form.submit();

        }

        function goIndex(){

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/index");
            document.body.appendChild(form);
            form.submit();

        }

        function goMonitoring(){

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/monitoring");
            document.body.appendChild(form);
            form.submit();

        }


        function goLog(){

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/log");
            document.body.appendChild(form);
            form.submit();

        }


        function goStat(){

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/stat");
            document.body.appendChild(form);
            form.submit();

        }


        function goConfig(){

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/config");
            document.body.appendChild(form);
            form.submit();

        }

    </script>

</head>

<body id="page-top" onload="showClock();">
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
    if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">


        <!-- Sidebar - Brand -->
        <a id="logoDiv" class="sidebar-brand d-flex align-items-center justify-content-center"  href="#" onclick="goIndex()">
            <img id="logo" class="sidebar-card-illustration mb-2" style="padding-left:265px;padding-top:5px;" src="/resources/img/logo.png" alt="서울 지하철 이오나이저 모니터링 시스템">
            <div class="sidebar-brand-text mx-3"></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Heading -->
        <div class="sidebar-heading" style="margin-top:20px;">
            MENU
        </div>

        <!-- Nav Item - Dashboard -->
        <li class="nav-item">
            <a class="nav-link" href="#" onclick="goIndex()">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>대시보드</span></a>
        </li>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link" href="#" onclick="goMonitoring()">
                <i class="fas fa-fw fa-cog"></i>
                <span>모니터링</span>
            </a>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item active">
            <a class="nav-link" href="#" onclick="goLog()">
                <i class="fas fa-fw fa-wrench"></i>
                <span>환경센서 로그</span>
            </a>
        </li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="#" onclick="goStat()">
                <i class="fas fa-fw fa-wrench"></i>
                <span>통계관리</span>
            </a>
        </li>


        <c:set var="memberId" value="${member.memberId}" />

        <c:if test="${memberId eq 'admin'}">
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                CONFIG
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" onclick="goConfig()" data-toggle="collapse" data-target="#collapsePages"
                   aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>설정</span>
                </a>
            </li>

        </c:if>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
        </div>

        <!-- Sidebar Message -->
        <div id="sideDiscription" class="sidebar-card d-none d-lg-flex">
            <img class="sidebar-card-illustration mb-2" src="/resources/img/subway_icon.png" width="50px" height="50px" alt="...">
            <p class="text-center mb-2">이 시스템은 서울 지하철의 미세먼지, 온/습도, 이산화탄소 등 대기질 상태 현황 정보를 실시간으로 제공합니다.</p>
            <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro"><i class="fas fa-download"></i>매뉴얼 다운로드</a>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">


        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <nav id="navTopBar" class="navbar navbar-expand navbar-light bg-toolbar-color topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
                <div></div>

                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li id="accountInfo" class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <b><div id="clock" class="mr-2 d-none d-lg-inline text-white large"></div></b>
                            <div class="topbar-divider d-none d-sm-block"></div>
                            <span class="mr-2 d-none d-lg-inline text-white large">　<b>${member.memberId}</b> 님 접속 | ${member.nickname}</span>
                            <img class="img-profile rounded-circle"
                                 src="/resources/img/undraw_profile.svg">
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Settings
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Activity Log
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->


            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h4 mb-0" style="color:#000">환경 센서 로그</h1>
                <hr>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">센서 로그 데이터 현황</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive" style="overflow-x:visible">
                            <!-- 테이블 위치 -->
                            <div id="searchConditionDiv" style="border:1px solid #babfc7; width:100%; height:105px;margin-top:5px;margin-bottom:5px;color:#2f3037">
                                <div style="padding:15px;">
                                    IMEI　
                                    <input type="text" style="padding-left:5px;padding-top:5px;font-weight:bold;width:200px;height:30px;border:1px solid #babfc7;" value="358645070008321" disabled></input>
                                    LTE#
                                    <input type="text" style="padding-left:5px;padding-top:5px;font-weight:bold;width:200px;height:30px;border:1px solid #babfc7;" value="012-2999-0971" disabled></input>
                                </div>
                                <div style="padding-left:15px;padding-right:15px;padding-bottom:15px;">
                                    일시　
                                    <input type="text" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                    ~
                                    <input type="text" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                    한 페이지 당 데이터 수
                                    <select onchange="onPageSizeChanged()" id="page-size" style="width:100px;height:30px;border:1px solid #babfc7;">
                                        <option value="10">10</option>
                                        <option value="100" selected>100</option>
                                        <option value="500">500</option>
                                        <option value="1000">1000</option>
                                    </select>
                                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:20px;"><i
                                            class="fas fa-search fa-sm text-white-50"></i>조회</a>
                                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                            class="fas fa-history fa-sm text-white-50"></i> 조건 초기화</a>
                                    <a id="controlView" href="#" onclick="addBottomGridArea()" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                            class="fas fa-sm text-white-50"></i>+화면 확장</a>
                                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i
                                            class="fas fa-download fa-sm text-white-50"></i> CSV파일 다운로드</a>
                                </div>
                            </div>
                            <div id="myGrid" style="height: 580px; width:100%;" class="ag-theme-alpine"></div>
                        </div>
                    </div>
                </div>


            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; 서울지하철 이오나이저 모니터링 시스템 2022</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->
    </div>


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="login.jsp">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>