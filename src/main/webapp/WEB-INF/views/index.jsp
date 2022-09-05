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

    <title>이오나이저 모니터링 시스템 | 대시보드</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

    <style>
        .chart-gauge {}
        .chart-first {fill:#ea4335}
        .chart-second {fill:#ffa800}
        .chart-third {fill:#fbd505}
        .chart-forth {fill: #34a853}
        .needle,.needle-center {fill:#464A4F}
        .form-check {
            display: block;
            min-height: 1.5rem;
            padding-left: 1.5em;
            margin-bottom: 0.125rem;
        }
        .form-check .form-check-input {
            float: left;
            margin-left: -1.5em;
        }

        .form-check-reverse {
            padding-right: 1.5em;
            padding-left: 0;
            text-align: right;
        }
        .form-check-reverse .form-check-input {
            float: right;
            margin-right: -1.5em;
            margin-left: 0;
        }

        .form-check-input {
            width: 1em;
            height: 1em;
            margin-top: 0.25em;
            vertical-align: top;
            background-color: #fff;
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;
            border: 1px solid rgba(0, 0, 0, 0.25);
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            -webkit-print-color-adjust: exact;
            color-adjust: exact;
            print-color-adjust: exact;
        }
        .form-check-input[type=checkbox] {
            border-radius: 0.25em;
        }
        .form-check-input[type=radio] {
            border-radius: 50%;
        }
        .form-check-input:active {
            filter: brightness(90%);
        }
        .form-check-input:focus {
            border-color: #86b7fe;
            outline: 0;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }
        .form-check-input:checked {
            background-color: #0d6efd;
            border-color: #0d6efd;
        }
        .form-check-input:checked[type=checkbox] {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3e%3cpath fill='none' stroke='%23fff' stroke-linecap='round' stroke-linejoin='round' stroke-width='3' d='m6 10 3 3 6-6'/%3e%3c/svg%3e");
        }
        .form-check-input:checked[type=radio] {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3e%3ccircle r='2' fill='%23fff'/%3e%3c/svg%3e");
        }
        .form-check-input[type=checkbox]:indeterminate {
            background-color: #0d6efd;
            border-color: #0d6efd;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20'%3e%3cpath fill='none' stroke='%23fff' stroke-linecap='round' stroke-linejoin='round' stroke-width='3' d='M6 10h8'/%3e%3c/svg%3e");
        }
        .form-check-input:disabled {
            pointer-events: none;
            filter: none;
            opacity: 0.5;
        }
        .form-check-input[disabled] ~ .form-check-label, .form-check-input:disabled ~ .form-check-label {
            cursor: default;
            opacity: 0.5;
            padding-top:20px;
        }
        .form-check-label{
            padding-top:5px;
            padding-left:10px;
        }
        .form-switch {
            padding-left: 48.5em;
        }
        .form-switch .form-check-input {
            width: 2em;
            margin-left: -2.5em;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3e%3ccircle r='3' fill='rgba%280, 0, 0, 0.25%29'/%3e%3c/svg%3e");
            background-position: left center;
            border-radius: 2em;
            transition: background-position 0.15s ease-in-out;
        }
        @media (prefers-reduced-motion: reduce) {
            .form-switch .form-check-input {
                transition: none;
            }
        }
        .form-switch .form-check-input:focus {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3e%3ccircle r='3' fill='%2386b7fe'/%3e%3c/svg%3e");
        }
        .form-switch .form-check-input:checked {
            background-position: right center;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='-4 -4 8 8'%3e%3ccircle r='3' fill='%23fff'/%3e%3c/svg%3e");
        }
        .form-switch.form-check-reverse {
            padding-right: 2.5em;
            padding-left: 0;
        }
        .form-switch.form-check-reverse .form-check-input {
            margin-right: -2.5em;
            margin-left: 0;
        }

        .form-switch.form-switch-md {
            /* margin-bottom: 1rem; */
        }

        .form-switch.form-switch-md .form-check-input {
            height: 1.5rem;
            width: calc(2rem + 0.75rem);
            border-radius: 3rem;
        }
    </style>
    <script>

        var curDateTime;

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
            curDateTime = currentDate.getFullYear() + "" + month + "" + date + "" +  hours + "" + minutes + "" + seconds;

            divClock.innerText=msg;

            setTimeout(showClock,1000);
        }

    </script>
    <link rel="icon" type="image/png" sizes="192x192"  href="/resources/img/ms-icon-70x70.png">
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
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#" onclick="goIndex()">
                <img class="sidebar-card-illustration mb-2" style="padding-left:265px;padding-top:5px;" src="/resources/img/logo.png" alt="서울 지하철 이오나이저 모니터링 시스템">
                <div class="sidebar-brand-text mx-3"></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Heading -->
            <div class="sidebar-heading" style="margin-top:20px;">
                MENU
            </div>

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="#" onclick="goIndex()">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>대시보드</span></a>
            </li>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="goMonitoring()">
                    <i class="fas fa-fw fa-laptop"></i>
                    <span>모니터링</span>
                </a>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="goLog()">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>환경센서 로그</span>
                </a>
            </li>
<!--
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" onclick="goStat()">
                    <i class="fas fa-fw fa-database"></i>
                    <span>통계관리</span>
                </a>
            </li>
-->

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
                <a class="nav-link collapsed" href="#" onclick="goDevice()" data-toggle="collapse" data-target="#collapsePages"
                   aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>장치 관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" onclick="goConfig()" data-toggle="collapse" data-target="#collapsePages"
                   aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-user"></i>
                    <span>계정 관리</span>
                </a>
            </li>
            </c:if>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">


            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="/resources/img/subway_icon.png" width="50px" height="50px" alt="...">
                <p class="text-center mb-2">이 시스템은 서울 지하철의 미세먼지, 온/습도, 이산화탄소 등 대기질 상태 현황 정보를 실시간으로 제공합니다.</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro"><i class="fas fa-download"></i>매뉴얼 다운로드</a>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content" style="background-image:url('/resources/img/main-bg.gif');background-repeat:repeat;">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-toolbar-color topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <div></div>
                    <!-- Topbar Search -->
                    <!--
                    <form
                    class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                            aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                    </form>
                    -->
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
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

                        <!-- Nav Item - Alerts -->
                        <!--
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>

                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>

                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>
                        -->
                        <!-- Nav Item - Messages -->
                        <!--
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>

                                <span class="badge badge-danger badge-counter">7</span>
                            </a>

                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/resources/img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/resources/img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/resources/img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>
                        -->


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
                                <!--
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
                                -->
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    로그아웃
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div id="content_area" class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-1" style="width:100%">
                        <div style="float:left;"><h1 class="h4 mb-0" style="color:black;">실시간 대기질 모니터링 현황</h1></div>
                        <div style="padding-left:0px;float:right;display:inline-block;" class="form-check form-switch form-switch-md">
                            <label style="margin-right:40px;color:#5D5D5D;font-weight:bold" class="form-check-label" for="flexSwitchCheckChecked">실시간 데이터 갱신 : </label>
                            <input style="margin-right:40px;" class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>

                            <label class="form-check-label" style="color:#5D5D5D;font-weight:bold">집계 평균 시간 : </label>

                            <label class="form-check-label" style="padding-left:0px;color:#5D5D5D;font-weight:bold" for="avg1hour">1시간</label>
                            <input class="" type="radio" id="avg1hour" value="01" name="avgRadio" style="width:20px;height:20px;vertical-align:middle;margin-bottom:1px;" checked>
                            <label class="form-check-label" style="color:#5D5D5D;padding-left:0px;font-weight:bold" for="avg24hour">24시간</label>
                            <input class="" type="radio" id="avg24hour" value="24" name="avgRadio" style="width:20px;height:20px;vertical-align:middle;margin-bottom:1px;" >

                            <a id="csvdata" href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                            <i class="fas fa-download fa-sm text-white-50"></i> 대기질 현황 데이터 저장</a>
                            <a id="screenshot" href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                            <i class="fas fa-download fa-sm text-white-50"></i> 대기질 현황 스크린샷 저장</a>
                        </div>
                    </div>
                    <hr>
                    <!-- 네비게이션 시작 -->
                    <!--
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#line-all">전체 노선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-1">1호선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-2">2호선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-3">3호선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-4">4호선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-5">5호선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-6">6호선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-7">7호선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-8">8호선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-9">9호선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-silim">신림선</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#line-wooi">우이신설선</a>
                        </li>
                    </ul>

                    <hr>

                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="line-all">

                            -->
                            <!-- top -->
                            <div class="row">

                                <!-- Area Chart -->
                                <div class="col-xl-3 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">전 노선 평균 통합 공기질 지수</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink1"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink1">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area">
                                                <!-- <canvas id="all-line-now-inter-iaq-chart" style="width:250px;height:250px; -moz-user-select: none;-webkit-user-select: none;-ms-user-select: none;"></canvas>-->
                                                <div style="text-align:center;margin-bottom:10px;">
                                                    <img src="/resources/img/clean-score-discription.png"  width="80%"; height="80%"; >
                                                </div>
                                                <div id = "topChart1" class="top-chart-1"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Area Chart -->
                                <div class="col-xl-4 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">노선별 평균 통합 공기질 지수</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink2"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink2">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area">
                                                <canvas id="top-chart-2" style="width:100%;height:100%;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Area Chart -->
                                <div class="col-xl-5 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">시간대별 전 노선 평균 통합 공기질 지수</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink3"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink3">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area">
                                                <canvas id="top-chart-3" style="width:100%;height:100%"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Pie Chart -->
                                <!--
                                <div class="col-xl-4 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <div
                                            class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                                            <div class="dropdown no-arrow">
                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLinkz"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                    aria-labelledby="dropdownMenuLinkz">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card-body">
                                            <div class="chart-pie pt-4 pb-2">
                                                <canvas id="myPieChart"></canvas>
                                            </div>
                                            <div class="mt-4 text-center small">
                                                <span class="mr-2">
                                                    <i class="fas fa-circle text-primary"></i> Direct
                                                </span>
                                                <span class="mr-2">
                                                    <i class="fas fa-circle text-success"></i> Social
                                                </span>
                                                <span class="mr-2">
                                                    <i class="fas fa-circle text-info"></i> Referral
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                -->
                            </div>

                            <!-- middle -->
                            <div class="row">


                                <!-- Area Chart -->
                                <div class="col-xl-3 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">통합 공기질 지수</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink4"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink4">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area" style="height:200px";>
                                                <canvas id="middle-chart-1" style="width:100%;height:100%"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Area Chart -->
                                <div class="col-xl-3 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">미세먼지 농도 (PM10 ; ug/m3)</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink5"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink5">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area" style="height:200px";>
                                                <canvas id="middle-chart-2" style="width:100%;height:100%"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Area Chart -->
                                <div class="col-xl-3 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">초미세먼지 농도 (PM2.5 ; ug/m3)</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink6"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink6">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area" style="height:200px";>
                                                <canvas id="middle-chart-3" style="width:100%;height:100%"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- Area Chart -->
                                <div class="col-xl-3 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">극초미세먼지 농도 (PM1.0 ; ug/m3)</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink7"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink7">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area" style="height:200px";>
                                                <canvas id="middle-chart-4" style="width:100%;height:100%;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <!-- bottom -->
                            <div class="row">

                                <!-- Area Chart -->
                                <div class="col-xl-3 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">TVOC (ppm)</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink8"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink8">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area" style="height:200px";>
                                                <canvas id="bottom-chart-1" style="width:100%;height:100%;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Area Chart -->
                                <div class="col-xl-3 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">이산화탄소 (ppm)</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink9"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink9">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area" style="height:200px";>
                                                <canvas id="bottom-chart-2" style="width:100%;height:100%;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Area Chart -->
                                <div class="col-xl-3 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">온도 (℃)</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink10"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink10">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area" style="height:200px";>
                                                <canvas id="bottom-chart-3" style="width:100%;height:100%;"></canvas>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- Area Chart -->
                                <div class="col-xl-3 col-lg-5">
                                    <div class="card shadow mb-4">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                                class="card-header d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold" style="color:#51545c">습도 (%RH)</h6>
                                            <div class="dropdown no-arrow">

                                                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink11"
                                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                                     aria-labelledby="dropdownMenuLink11">
                                                    <div class="dropdown-header">Dropdown Header:</div>
                                                    <a class="dropdown-item" href="#">Action</a>
                                                    <a class="dropdown-item" href="#">Another action</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>

                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body">
                                            <div class="chart-area" style="height:200px";>
                                                <canvas id="bottom-chart-4" style="width:100%;height:100%;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>


                            <!-- Content Row -->

                    <!--
                        </div>

                    </div>
                        <div class="tab-pane fade" id="line-1">
                            <p>Nunc vitae turpis id nibh sodales commodo et non augue. Proin fringilla ex nunc. Integer tincidunt risus ut facilisis tristique.</p>
                        </div>
                        <div class="tab-pane fade" id="=line-2">
                            <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
                        </div>
                        <div class="tab-pane fade" id="=line-3">
                            <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
                        </div>
                        <div class="tab-pane fade" id="=line-4">
                            <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
                        </div>
                        <div class="tab-pane fade" id="=line-5">
                            <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
                        </div>
                        <div class="tab-pane fade" id="=line-6">
                            <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
                        </div>
                        <div class="tab-pane fade" id="=line-7">
                            <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
                        </div>
                        <div class="tab-pane fade" id="=line-8">
                            <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
                        </div>
                        <div class="tab-pane fade" id="=line-9">
                            <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
                        </div>
                        <div class="tab-pane fade" id="=line-silim">
                            <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
                        </div>
                        <div class="tab-pane fade" id="=line-wooi">
                            <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
                        </div>
                    </div>
                    -->
                    <!-- 네비게이션 종료 -->

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
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

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
                    <a class="btn btn-primary" href="#" onclick="goLogin()">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- 차트 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

    <!-- d3 차트 게이지 -->
    <script type="text/javascript" src="https://d3js.org/d3.v3.min.js"></script>

    <!-- 이미지 캡쳐 플러그인 -->
    <script type="text/javascript" src="/resources/js/html2canvas.js"></script>

    <script>

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

        function goDevice(){

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/device");
            document.body.appendChild(form);
            form.submit();

        }
    </script>

    <script language="Javascript">
        //미터기 표현을 위한 전역변수
        var dashboardDataAvgIaqAllLine = 0;

        //CSV 다운로드를 위한 전역변수
        var dashboardDataAvgIaqArray;   //평균 통합 공기질 지수
        var dashboardDataAvgGp10Array;  //미세먼지 농도
        var dashboardDataAvgGp1_0Array;  //초미세먼지 농도
        var dashboardDataAvgGp2_5Array;  //극초미세먼지 농도
        var dashboardDataAvgVocArray; //TVOC
        var dashboardDataAvgCo2Array; //이산화탄소
        var dashboardDataAvgTempArray; //온도
        var dashboardDataAvgHumiArray; //습도

        $(function(){
        //실시간 데이터 갱신
            initData();

            var timer = setInterval(
                function () {

                var avgRadioArray = document.getElementsByName("avgRadio");
                var avgCalcTime = avgRadioArray[0].checked == false ? "24" : "01";
                var sendData = {"refreshYn":"Y","avgCalcTime":avgCalcTime};

                $.ajax({
                    url: '/index/data/refresh',
                    method: 'POST',
                    async: true,
                    data: JSON.stringify(sendData),
                    contentType: 'application/json; charset=UTF-8',
                    dataType: 'text',
                    success: function (result) {
                        var obj = JSON.parse(result);
                        callback(obj);
                    },
                    error: function (error) {
                        alert("데이터 갱신 중 오류가 발생했습니다 : " + error);
                    }
                });
            }, 5000);

            $('#flexSwitchCheckChecked').click(function() {
                let toggle = document.getElementById("flexSwitchCheckChecked").checked;

                if(!toggle){
                    // 반복 중단
                    clearInterval(timer);
                    toggle = false;
                }else{
                    // 반복 재개(재시작)

                    timer = setInterval(
                        function () {
                            avgRadioArray = document.getElementsByName("avgRadio");
                            avgCalcTime = avgRadioArray[0].checked == false ? "24" : "01";
                            sendData = {"refreshYn":"Y","avgCalcTime":avgCalcTime};

                            $.ajax({
                                url: '/index/data/refresh',
                                method: 'POST',
                                async: true,
                                data: JSON.stringify(sendData),
                                contentType: 'application/json; charset=UTF-8',
                                dataType: 'text',
                                success: function (result) {
                                    var obj = JSON.parse(result);
                                    global_data_set = obj;
                                    callback(obj);
                                },
                                error: function (error) {
                                    alert("데이터 갱신 중 오류가 발생했습니다 : " + error);
                                }
                            });
                        }, 5000);
                }
            });


            $('#screenshot').click(function() {


                let scrollHeight = Math.max(
                    document.body.scrollHeight, document.documentElement.scrollHeight,
                    document.body.offsetHeight, document.documentElement.offsetHeight,
                    document.body.clientHeight, document.documentElement.clientHeight
                );

                //$('#content_area').attr('style', "height:"+(scrollHeight+500)+"px;");

                html2canvas($("#content_area")[0]).then((canvas) => {

                    var image = canvas.toDataURL();
                    var link = document.createElement("a");
                    link.download = curDateTime+"_screenshot.png";
                    link.href = image;
                    document.body.appendChild(link);
                    link.click();

                });

                //$('#content_area').attr('style', "height:100%;");

            });

            $('#csvdata').click(function() {

                let filename = curDateTime+"_data.csv";
                getCSV(filename);

            });
        });

        function initData(){

            sendData = {"refreshYn":"Y","avgCalcTime":"01"};

            $.ajax({
                url: '/index/data/refresh',
                method: 'POST',
                async: true,
                data: JSON.stringify(sendData),
                contentType: 'application/json; charset=UTF-8',
                dataType: 'text',
                success: function (result) {
                    var obj = JSON.parse(result);
                    callback(obj);
                },
                error: function (error) {
                    alert("데이터 갱신 중 오류가 발생했습니다 : " + error);
                }
            });
        }
        function getCSV(filename) {
            var csv = [];
            var row = [];

            //1열에는 컬럼명
            row.push(
                "노선명",
                "통합 공기질 지수",
                "미세먼지 농도",
                "초미세먼지 농도",
                "극초미세먼지 농도",
                "TVOC",
                "이산화탄소",
                "온도",
                "습도"
            );

            csv.push(row.join(","));
/*
            var dashboardDataAvgIaqArray;   //평균 통합 공기질 지수
            var dashboardDataAvgGp10Array;  //미세먼지 농도
            var dashboardDataAvgGp1_0Array;  //초미세먼지 농도
            var dashboardDataAvgGp2_5Array;  //극초미세먼지 농도
            var dashboardDataAvgVocArray; //TVOC
            var dashboardDataAvgCo2Array; //이산화탄소
            var dashboardDataAvgTempArray; //온도
            var dashboardDataAvgHumiArray; //습도
*/

            var iaqAllAvg = 0;
            var gp10AllAvg = 0;
            var gp1_0AllAvg = 0;
            var gp2_5AllAvg = 0;
            var vocAllAvg = 0;
            var co2AllAvg = 0;
            var tempAllAvg = 0;
            var humiAllAvg = 0;

            for(var i=0; i<8; i++){
                row = [];
                row.push((i+1)+"호선",
                    dashboardDataAvgIaqArray[i],
                    dashboardDataAvgGp10Array[i],
                    dashboardDataAvgGp1_0Array[i],
                    dashboardDataAvgGp2_5Array[i],
                    dashboardDataAvgVocArray[i],
                    dashboardDataAvgCo2Array[i],
                    dashboardDataAvgTempArray[i],
                    dashboardDataAvgHumiArray[i]);

                    iaqAllAvg += dashboardDataAvgIaqArray[i];
                    gp10AllAvg += dashboardDataAvgGp10Array[i];
                    gp1_0AllAvg += dashboardDataAvgGp1_0Array[i];
                    gp2_5AllAvg += dashboardDataAvgGp2_5Array[i];
                    vocAllAvg += dashboardDataAvgVocArray[i];
                    co2AllAvg += dashboardDataAvgCo2Array[i];
                    tempAllAvg += dashboardDataAvgTempArray[i];
                    humiAllAvg += dashboardDataAvgHumiArray[i];

                csv.push(row.join(","));
            }

            var iaqAllAvg = Math.ceil((iaqAllAvg / 8) * 100) / 100 ;
            var gp10AllAvg = Math.ceil((gp10AllAvg / 8) * 100) / 100 ;
            var gp1_0AllAvg = Math.ceil((gp1_0AllAvg / 8) * 100) / 100 ;
            var gp2_5AllAvg = Math.ceil((gp2_5AllAvg / 8) * 100) / 100 ;
            var vocAllAvg = Math.ceil((vocAllAvg / 8) * 100) / 100 ;
            var co2AllAvg = Math.ceil((co2AllAvg / 8) * 100) / 100 ;
            var tempAllAvg = Math.ceil((tempAllAvg / 8) * 100) / 100 ;
            var humiAllAvg = Math.ceil((humiAllAvg / 8) * 100) / 100 ;

            row = [];
            row.push("전 노선 평균",
                iaqAllAvg,
                gp10AllAvg,
                gp1_0AllAvg,
                gp2_5AllAvg,
                vocAllAvg,
                co2AllAvg,
                tempAllAvg,
                humiAllAvg
            );

            csv.push(row.join(","));
            downloadCSV(csv.join("\n"), filename);
        }

        function downloadCSV(csv, filename) {
            var csvFile;
            var downloadLink;

            //한글 처리를 해주기 위해 BOM 추가하기
            const BOM = "\uFEFF";
            csv = BOM + csv;

            csvFile = new Blob([csv], { type: "text/csv" });
            downloadLink = document.createElement("a");
            downloadLink.download = filename;
            downloadLink.href = window.URL.createObjectURL(csvFile);
            downloadLink.style.display = "none";
            document.body.appendChild(downloadLink);
            downloadLink.click();
        }

        function callback(obj){

            //전 노선 평균 통합 공기질 지수
            dashboardDataAvgIaqAllLine = obj.mainDataDto.lineAllAvgIaq;

            //노선별 평균 통합 공기질 지수
            var dashboardDataLineAvgIaqArray = new Array(7);

            dashboardDataLineAvgIaqArray[0] = obj.mainDataDto.line1AvgIaq;
            dashboardDataLineAvgIaqArray[1] = obj.mainDataDto.line2AvgIaq;
            dashboardDataLineAvgIaqArray[2] = obj.mainDataDto.line3AvgIaq;
            dashboardDataLineAvgIaqArray[3] = obj.mainDataDto.line4AvgIaq;
            dashboardDataLineAvgIaqArray[4] = obj.mainDataDto.line5AvgIaq;
            dashboardDataLineAvgIaqArray[5] = obj.mainDataDto.line6AvgIaq;
            dashboardDataLineAvgIaqArray[6] = obj.mainDataDto.line7AvgIaq;
            dashboardDataLineAvgIaqArray[7] = obj.mainDataDto.line8AvgIaq;

            const topChart2Dataset = topChart2.data.datasets;
            for (let idx = 0; idx < topChart2Dataset.length; idx++) {
                const data = topChart2Dataset[idx].data;
                for (let jdx = 0; jdx < data.length; jdx++) {
                    data[jdx] = dashboardDataLineAvgIaqArray[jdx];
                }
            }

            //시간대별 전 노선 평균 통합 공기질 지수
            var dashboardDataTimeAvgIaqArray = new Array(20);
            dashboardDataTimeAvgIaqArray[0] = obj.mainDataDto.time04AvgIaq;
            dashboardDataTimeAvgIaqArray[1] = obj.mainDataDto.time05AvgIaq;
            dashboardDataTimeAvgIaqArray[2] = obj.mainDataDto.time06AvgIaq;
            dashboardDataTimeAvgIaqArray[3] = obj.mainDataDto.time07AvgIaq;
            dashboardDataTimeAvgIaqArray[4] = obj.mainDataDto.time08AvgIaq;
            dashboardDataTimeAvgIaqArray[5] = obj.mainDataDto.time09AvgIaq;
            dashboardDataTimeAvgIaqArray[6] = obj.mainDataDto.time10AvgIaq;
            dashboardDataTimeAvgIaqArray[7] = obj.mainDataDto.time11AvgIaq;
            dashboardDataTimeAvgIaqArray[8] = obj.mainDataDto.time12AvgIaq;
            dashboardDataTimeAvgIaqArray[9] = obj.mainDataDto.time13AvgIaq;
            dashboardDataTimeAvgIaqArray[10] = obj.mainDataDto.time14AvgIaq;
            dashboardDataTimeAvgIaqArray[11] = obj.mainDataDto.time15AvgIaq;
            dashboardDataTimeAvgIaqArray[12] = obj.mainDataDto.time16AvgIaq;
            dashboardDataTimeAvgIaqArray[13] = obj.mainDataDto.time17AvgIaq;
            dashboardDataTimeAvgIaqArray[14] = obj.mainDataDto.time18AvgIaq;
            dashboardDataTimeAvgIaqArray[15] = obj.mainDataDto.time19AvgIaq;
            dashboardDataTimeAvgIaqArray[16] = obj.mainDataDto.time20AvgIaq;
            dashboardDataTimeAvgIaqArray[17] = obj.mainDataDto.time21AvgIaq;
            dashboardDataTimeAvgIaqArray[18] = obj.mainDataDto.time22AvgIaq;
            dashboardDataTimeAvgIaqArray[19] = obj.mainDataDto.time23AvgIaq;

            const topChart3Dataset = topChart3.data.datasets;
            for (let idx = 0; idx < topChart3Dataset.length; idx++) {
                const data = topChart3Dataset[idx].data;
                for (let jdx = 0; jdx < data.length; jdx++) {
                    data[jdx] = dashboardDataTimeAvgIaqArray[jdx];
                }
            }

            //통합 공기질 지수
            dashboardDataAvgIaqArray = new Array(7);
            dashboardDataAvgIaqArray[0] = obj.mainDataDto.line1AvgIaq;
            dashboardDataAvgIaqArray[1] = obj.mainDataDto.line2AvgIaq;
            dashboardDataAvgIaqArray[2] = obj.mainDataDto.line3AvgIaq;
            dashboardDataAvgIaqArray[3] = obj.mainDataDto.line4AvgIaq;
            dashboardDataAvgIaqArray[4] = obj.mainDataDto.line5AvgIaq;
            dashboardDataAvgIaqArray[5] = obj.mainDataDto.line6AvgIaq;
            dashboardDataAvgIaqArray[6] = obj.mainDataDto.line7AvgIaq;
            dashboardDataAvgIaqArray[7] = obj.mainDataDto.line8AvgIaq;

            const topChart4Dataset = topChart4.data.datasets;
            for (let idx = 0; idx < topChart4Dataset.length; idx++) {
                const data = topChart4Dataset[idx].data;
                for (let jdx = 0; jdx < data.length; jdx++) {
                    data[jdx] = dashboardDataAvgIaqArray[jdx];
                }
            }

            //미세먼지 농도
            dashboardDataAvgGp10Array = new Array(7);
            dashboardDataAvgGp10Array[0] = obj.mainDataDto.line1AvgGp10;
            dashboardDataAvgGp10Array[1] = obj.mainDataDto.line2AvgGp10;
            dashboardDataAvgGp10Array[2] = obj.mainDataDto.line3AvgGp10;
            dashboardDataAvgGp10Array[3] = obj.mainDataDto.line4AvgGp10;
            dashboardDataAvgGp10Array[4] = obj.mainDataDto.line5AvgGp10;
            dashboardDataAvgGp10Array[5] = obj.mainDataDto.line6AvgGp10;
            dashboardDataAvgGp10Array[6] = obj.mainDataDto.line7AvgGp10;
            dashboardDataAvgGp10Array[7] = obj.mainDataDto.line8AvgGp10;

            const topChart5Dataset = topChart5.data.datasets;
            for (let idx = 0; idx < topChart5Dataset.length; idx++) {
                const data = topChart5Dataset[idx].data;
                for (let jdx = 0; jdx < data.length; jdx++) {
                    data[jdx] = dashboardDataAvgGp10Array[jdx];
                }
            }

            //초미세먼지 농도
            dashboardDataAvgGp1_0Array = new Array(7);
            dashboardDataAvgGp1_0Array[0] = obj.mainDataDto.line1AvgGp1_0;
            dashboardDataAvgGp1_0Array[1] = obj.mainDataDto.line2AvgGp1_0;
            dashboardDataAvgGp1_0Array[2] = obj.mainDataDto.line3AvgGp1_0;
            dashboardDataAvgGp1_0Array[3] = obj.mainDataDto.line4AvgGp1_0;
            dashboardDataAvgGp1_0Array[4] = obj.mainDataDto.line5AvgGp1_0;
            dashboardDataAvgGp1_0Array[5] = obj.mainDataDto.line6AvgGp1_0;
            dashboardDataAvgGp1_0Array[6] = obj.mainDataDto.line7AvgGp1_0;
            dashboardDataAvgGp1_0Array[7] = obj.mainDataDto.line8AvgGp1_0;

            const topChart6Dataset = topChart6.data.datasets;
            for (let idx = 0; idx < topChart6Dataset.length; idx++) {
                const data = topChart6Dataset[idx].data;
                for (let jdx = 0; jdx < data.length; jdx++) {
                    data[jdx] = dashboardDataAvgGp1_0Array[jdx];
                }
            }


            //극초미세먼지 농도
            dashboardDataAvgGp2_5Array = new Array(7);
            dashboardDataAvgGp2_5Array[0] = obj.mainDataDto.line1AvgGp2_5;
            dashboardDataAvgGp2_5Array[1] = obj.mainDataDto.line2AvgGp2_5;
            dashboardDataAvgGp2_5Array[2] = obj.mainDataDto.line3AvgGp2_5;
            dashboardDataAvgGp2_5Array[3] = obj.mainDataDto.line4AvgGp2_5;
            dashboardDataAvgGp2_5Array[4] = obj.mainDataDto.line5AvgGp2_5;
            dashboardDataAvgGp2_5Array[5] = obj.mainDataDto.line6AvgGp2_5;
            dashboardDataAvgGp2_5Array[6] = obj.mainDataDto.line7AvgGp2_5;
            dashboardDataAvgGp2_5Array[7] = obj.mainDataDto.line8AvgGp2_5;

            const topChart7Dataset = topChart7.data.datasets;
            for (let idx = 0; idx < topChart7Dataset.length; idx++) {
                const data = topChart7Dataset[idx].data;
                for (let jdx = 0; jdx < data.length; jdx++) {
                    data[jdx] = dashboardDataAvgGp2_5Array[jdx];
                }
            }

            //TVOC
            dashboardDataAvgVocArray = new Array(7);
            dashboardDataAvgVocArray[0] = obj.mainDataDto.line1AvgTvoc;
            dashboardDataAvgVocArray[1] = obj.mainDataDto.line2AvgTvoc;
            dashboardDataAvgVocArray[2] = obj.mainDataDto.line3AvgTvoc;
            dashboardDataAvgVocArray[3] = obj.mainDataDto.line4AvgTvoc;
            dashboardDataAvgVocArray[4] = obj.mainDataDto.line5AvgTvoc;
            dashboardDataAvgVocArray[5] = obj.mainDataDto.line6AvgTvoc;
            dashboardDataAvgVocArray[6] = obj.mainDataDto.line7AvgTvoc;
            dashboardDataAvgVocArray[7] = obj.mainDataDto.line8AvgTvoc;

            const topChart8Dataset = topChart8.data.datasets;
            for (let idx = 0; idx < topChart8Dataset.length; idx++) {
                const data = topChart8Dataset[idx].data;
                for (let jdx = 0; jdx < data.length; jdx++) {
                    data[jdx] = dashboardDataAvgVocArray[jdx];
                }
            }

            //이산화탄소
            dashboardDataAvgCo2Array = new Array(7);
            dashboardDataAvgCo2Array[0] = obj.mainDataDto.line1AvgCo2;
            dashboardDataAvgCo2Array[1] = obj.mainDataDto.line2AvgCo2;
            dashboardDataAvgCo2Array[2] = obj.mainDataDto.line3AvgCo2;
            dashboardDataAvgCo2Array[3] = obj.mainDataDto.line4AvgCo2;
            dashboardDataAvgCo2Array[4] = obj.mainDataDto.line5AvgCo2;
            dashboardDataAvgCo2Array[5] = obj.mainDataDto.line6AvgCo2;
            dashboardDataAvgCo2Array[6] = obj.mainDataDto.line7AvgCo2;
            dashboardDataAvgCo2Array[7] = obj.mainDataDto.line8AvgCo2;

            const topChart9Dataset = topChart9.data.datasets;
            for (let idx = 0; idx < topChart9Dataset.length; idx++) {
                const data = topChart9Dataset[idx].data;
                for (let jdx = 0; jdx < data.length; jdx++) {
                    data[jdx] = dashboardDataAvgCo2Array[jdx];
                }
            }

            //온도
            dashboardDataAvgTempArray = new Array(7);
            dashboardDataAvgTempArray[0] = obj.mainDataDto.line1AvgTemp;
            dashboardDataAvgTempArray[1] = obj.mainDataDto.line2AvgTemp;
            dashboardDataAvgTempArray[2] = obj.mainDataDto.line3AvgTemp;
            dashboardDataAvgTempArray[3] = obj.mainDataDto.line4AvgTemp;
            dashboardDataAvgTempArray[4] = obj.mainDataDto.line5AvgTemp;
            dashboardDataAvgTempArray[5] = obj.mainDataDto.line6AvgTemp;
            dashboardDataAvgTempArray[6] = obj.mainDataDto.line7AvgTemp;
            dashboardDataAvgTempArray[7] = obj.mainDataDto.line8AvgTemp;

            const topChart10Dataset = topChart10.data.datasets;
            for (let idx = 0; idx < topChart10Dataset.length; idx++) {
                const data = topChart10Dataset[idx].data;
                for (let jdx = 0; jdx < data.length; jdx++) {
                    data[jdx] = dashboardDataAvgTempArray[jdx];
                }
            }


            //습도
            dashboardDataAvgHumiArray = new Array(7);
            dashboardDataAvgHumiArray[0] = obj.mainDataDto.line1AvgHumi;
            dashboardDataAvgHumiArray[1] = obj.mainDataDto.line2AvgHumi;
            dashboardDataAvgHumiArray[2] = obj.mainDataDto.line3AvgHumi;
            dashboardDataAvgHumiArray[3] = obj.mainDataDto.line4AvgHumi;
            dashboardDataAvgHumiArray[4] = obj.mainDataDto.line5AvgHumi;
            dashboardDataAvgHumiArray[5] = obj.mainDataDto.line6AvgHumi;
            dashboardDataAvgHumiArray[6] = obj.mainDataDto.line7AvgHumi;
            dashboardDataAvgHumiArray[7] = obj.mainDataDto.line8AvgHumi;

            const topChart11Dataset = topChart11.data.datasets;
            for (let idx = 0; idx < topChart11Dataset.length; idx++) {
                const data = topChart11Dataset[idx].data;
                for (let jdx = 0; jdx < data.length; jdx++) {
                    data[jdx] = dashboardDataAvgHumiArray[jdx];
                }
            }

            value = dashboardDataAvgIaqAllLine;
            $("#topChart1").html("");

            gaugeMaxValue = 300;

            // Data of calculation
            percentValue = value / gaugeMaxValue;

            niddleRefresh();
            topChart2.update();
            topChart3.update();
            topChart4.update();
            topChart5.update();
            topChart6.update();
            topChart7.update();
            topChart8.update();
            topChart9.update();
            topChart10.update();
            topChart11.update();
        }
    </script>

    <script>

        var name = dashboardDataAvgIaqAllLine;  //350 수치 보여졌던 부분
        var value = 200;    // My Desired Value To Show
        var gaugeMaxValue = 300;

        // Data of calculation
        var percentValue = value / gaugeMaxValue;
        var needleClient;
        /*---------------------
        // D3.js Gauge Chart //
        ---------------------*/
        // Data which need to be fetched


        function niddleRefresh() {

            var name = dashboardDataAvgIaqAllLine;  //350 수치 보여졌던 부분

            // Data of calculation
            var percentValue = value / gaugeMaxValue;
            var needleClient;

            (function () {
                var barWidth, chart, chartInset, degToRad, repaintGauge, height, margin, numSections, padRad, percToDeg,
                    percToRad, percent, radius, sectionIndx, svg, totalPercent, width, recalcPointerPos;

                percent = percentValue;

                numSections = 1;
                sectionPerc = 1 / numSections / 2;
                padRad = 0.025;
                chartInset = 10;

                // Orientation of Gauge:
                totalPercent = .75;

                el = d3.select('.top-chart-1');

                margin = {
                    top: 20,
                    right: 20,
                    bottom: 20,
                    left: 20
                };

                width = el[0][0].offsetWidth - margin.left - margin.right;
                height = width;
                radius = Math.min(width, height) / 2;
                barWidth = 20 * width / 300;

                // Utility methods
                percToDeg = function (perc) {
                    return perc * 360;
                };

                percToRad = function (perc) {
                    return degToRad(percToDeg(perc));
                };

                degToRad = function (deg) {
                    return deg * Math.PI / 180;
                };

                // Create SVG element
                svg = el.append('svg').attr('width', width + margin.left + margin.right).attr('height', height / 1.5 + margin.top + margin.bottom).attr("vertical-align","middle");		// height/1.5 To Remove Extra Bottom Space

                // Add layer for the panel
                chart = svg.append('g').attr('transform', "translate(" + ((width + margin.left) / 2) + ", " + ((height + margin.top) / 2) + ")");

                chart.append('path').attr('class', "arc chart-first");
                chart.append('path').attr('class', "arc chart-second");
                chart.append('path').attr('class', "arc chart-third");
                chart.append('path').attr('class', "arc chart-forth");

                arc4 = d3.svg.arc().outerRadius(radius - chartInset).innerRadius(radius - chartInset - barWidth)
                arc3 = d3.svg.arc().outerRadius(radius - chartInset).innerRadius(radius - chartInset - barWidth)
                arc2 = d3.svg.arc().outerRadius(radius - chartInset).innerRadius(radius - chartInset - barWidth)
                arc1 = d3.svg.arc().outerRadius(radius - chartInset).innerRadius(radius - chartInset - barWidth)

                repaintGauge = function () {
                    perc = 0.5;
                    var next_start = totalPercent;
                    arcStartRad = percToRad(next_start);
                    arcEndRad = arcStartRad + percToRad(perc / 4);
                    next_start += perc / 4;

                    arc1.startAngle(arcStartRad).endAngle(arcEndRad);

                    arcStartRad = percToRad(next_start);
                    arcEndRad = arcStartRad + percToRad(perc / 4);
                    next_start += perc / 4;

                    arc2.startAngle(arcStartRad + padRad).endAngle(arcEndRad);

                    arcStartRad = percToRad(next_start);
                    arcEndRad = arcStartRad + percToRad(perc / 4);
                    next_start += perc / 4;

                    arc3.startAngle(arcStartRad + padRad).endAngle(arcEndRad);

                    arcStartRad = percToRad(next_start);
                    arcEndRad = arcStartRad + percToRad(perc / 4);

                    arc4.startAngle(arcStartRad + padRad).endAngle(arcEndRad);

                    chart.select(".chart-first").attr('d', arc1);
                    chart.select(".chart-second").attr('d', arc2);
                    chart.select(".chart-third").attr('d', arc3);
                    chart.select(".chart-forth").attr('d', arc4);
                }

                var Needle = (function () {

                    //Helper function that returns the `d` value for moving the needle
                    var recalcPointerPos = function (perc) {
                        var centerX, centerY, leftX, leftY, rightX, rightY, thetaRad, topX, topY;
                        thetaRad = percToRad(perc / 2);
                        centerX = 0;
                        centerY = 0;
                        topX = centerX - this.len * Math.cos(thetaRad);
                        topY = centerY - this.len * Math.sin(thetaRad);
                        leftX = centerX - this.radius * Math.cos(thetaRad - Math.PI / 2);
                        leftY = centerY - this.radius * Math.sin(thetaRad - Math.PI / 2);
                        rightX = centerX - this.radius * Math.cos(thetaRad + Math.PI / 2);
                        rightY = centerY - this.radius * Math.sin(thetaRad + Math.PI / 2);
                        return "M " + leftX + " " + leftY + " L " + topX + " " + topY + " L " + rightX + " " + rightY;
                    };

                    function Needle(el) {
                        this.el = el;
                        this.len = width / 2.5;
                        this.radius = this.len / 20;
                    }

                    Needle.prototype.render = function () {
                        this.el.append('circle').attr('class', 'needle-center').attr('cx', 0).attr('cy', 0).attr('r', this.radius);
                        return this.el.append('path').attr('class', 'needle').attr('id', 'client-needle').attr('d', recalcPointerPos.call(this, 0));
                    };

                    Needle.prototype.moveTo = function (perc) {
                        var self,
                            oldValue = this.perc || 0;
                        this.perc = perc;
                        self = this;

                        // Reset pointer position
                        this.el.transition().delay(100).ease('quad').duration(180).select('.needle').tween('reset-progress', function () {
                            return function (percentOfPercent) {
                                var progress = (1 - percentOfPercent) * oldValue;
                                repaintGauge(progress);
                                return d3.select(this).attr('d', recalcPointerPos.call(self, progress));
                            };
                        });

                        this.el.transition().delay(100).ease('bounce').duration(1200).select('.needle').tween('progress', function () {
                            return function (percentOfPercent) {
                                var progress = percentOfPercent * perc;

                                repaintGauge(progress);
                                return d3.select(this).attr('d', recalcPointerPos.call(self, progress));
                            };
                        });

                    };

                    return Needle;

                })();

                var dataset = [{
                    metric: name,
                    value: value
                }]

                var texts = svg.selectAll("text")
                    .data(dataset)
                    .enter();

                texts.append("text")
                    .text(function () {
                        return dataset[0].metric;
                    })
                    .attr('id', "Name")
                    .attr('text-align', "center")
                    .attr('transform', "translate(135, " + ((height + margin.top- 18) / 1.6) + ")")
                    .attr("font-family", "'Apple SD Gothic Neo', 'Malgun Gothic', '맑은 고딕'")
                    //.attr("font-weight", "bold")
                    .attr("font-size", 25)
                    .style("fill", "#000000");


                var trX = 180 - 210 * Math.cos(percToRad(percent / 2));
                var trY = 195 - 210 * Math.sin(percToRad(percent / 2));
                // (180, 195) are the coordinates of the center of the gauge.

                displayValue = function () {
                    texts.append("text")
                        .text(function () {
                            return dataset[0].value;
                        })
                        .attr('id', "Value")
                        .attr('transform', "translate(" + trX + ", " + trY + ")")
                        .attr("font-size", 0)
                        .style("fill", '#000000');
                }

                texts.append("text")
                    .text(function () {
                        return 0;
                    })
                    .attr('id', 'scale0')
                    .attr('transform', "translate(" + ((width + margin.left) / 100) + ", " + ((height + margin.top) / 2) + ")")
                    .attr("font-size", 15)
                    .style("fill", "#000000");

                texts.append("text")
                    .text(function () {
                        return gaugeMaxValue / 2;
                    })
                    .attr('id', 'scale10')
                    .attr('transform', "translate(" + ((width + margin.left) / 2.15) + ", " + ((height + margin.top) / 30) + ")")
                    .attr("font-size", 15)
                    .style("fill", "#000000");


                texts.append("text")
                    .text(function () {
                        return gaugeMaxValue;
                    })
                    .attr('id', 'scale20')
                    .attr('transform', "translate(" + ((width + margin.left) / 1.03) + ", " + ((height + margin.top) / 2) + ")")
                    .attr("font-size", 15)
                    .style("fill", "#000000");


                needle = new Needle(chart);
                needle.render();
                needle.moveTo(percent);

                setTimeout(displayValue, 1350);

            })();
        }
        Chart.register(ChartDataLabels);

        var topChart2 = new Chart(document.getElementById("top-chart-2"), {
            type: 'bar',
            data: {
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선"],
                datasets: [
                    {
                        backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],

                        data: [0,0,0,0,0,0,0,0]
                    }
                ]
            },
            options: {
                legend: {
                    display: false
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                    datalabels: {
                        anchor:'end',
                        align:'start',
                        color: 'black',
                        backgroundColor: 'white',
                        borderColor:'black',
                        borderWidth:1,
                        borderRadius:1,
                        font: {
                            weight: 'bold',
                            lineHeight: 1.0
                        },
                        padding :{
                            bottom : '0'
                        }
                    },
                    legend: {
                        display: false
                    }
                }
            }
        });

        var topChart3 = new Chart(document.getElementById("top-chart-3"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'line',
                    label: '노선',
                    barThickness: 5,
                    backgroundColor: 'rgb(0,82,164,0.3)',
                    fill: true,
                    borderColor: '#0052A4',
                    data: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
                }],
                labels: ["04:00", "05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00","18:00","19:00","20:00","21:00","22:00","23:00"]
            },
            options: {
                legend: {
                    display: false,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                    datalabels: {
                        anchor:'end',
                        align:'start',
                        color: 'black',
                        backgroundColor: 'white',
                        borderColor:'#0052A4',
                        borderWidth:1,
                        borderRadius:1,
                        font: {
                            weight: 'bold',
                            lineHeight: 1.0
                        },
                        padding :{
                            bottom : '0'
                        }
                    },
                    legend: {
                        display: false
                    }
                },
                scales : {
                    xAxis: {
                        ticks:{
                            autoSkip:false,
                            fontSize : 14
                        }
                    }
                }
            }
        });


        var topChart4 = new Chart(document.getElementById("middle-chart-1"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: '노선',
                    backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                    data: [0,0,0,0,0,0,0,0]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선"]
            },
            options: {
                legend: {
                    display: false,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                    datalabels: {
                        color: 'white'
                    },
                    legend: {
                        display: false
                    }
                },
                scales : {
                    xAxis: {
                        ticks:{
                            autoSkip:false,
                            fontSize : 14
                        }
                    }
                }
            }
        });


        var topChart5 = new Chart(document.getElementById("middle-chart-2"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: '노선',
                    backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                    data: [0,0,0,0,0,0,0,0]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선"]
            },
            options: {
                legend: {
                    display: false,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                    datalabels: {
                        color: 'white'
                    },
                    legend: {
                        display: false
                    }
                },
                scales : {
                    xAxis: {
                        ticks:{
                            autoSkip:false,
                            fontSize : 14
                        }
                    }
                }
            }
        });


        var topChart6 = new Chart(document.getElementById("middle-chart-3"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: '노선',
                    backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                    data: [0,0,0,0,0,0,0,0]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선"]
            },
            options: {
                legend: {
                    display: false,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                    datalabels: {
                        color: 'white'
                    },
                    legend: {
                        display: false
                    }
                },
                scales : {
                    xAxis: {
                        ticks:{
                            autoSkip:false,
                            fontSize : 14
                        }
                    }
                }
            }
        });


        var topChart7 = new Chart(document.getElementById("middle-chart-4"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: '노선',
                    backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                    data: [0,0,0,0,0,0,0,0]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선"]
            },
            options: {
                legend: {
                    display: false,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                    datalabels: {
                        color: 'white'
                    },
                    legend: {
                        display: false
                    }
                },
                scales : {
                    xAxis: {
                        ticks:{
                            autoSkip:false,
                            fontSize : 14
                        }
                    }
                }
            }
        });


        var topChart8 = new Chart(document.getElementById("bottom-chart-1"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: '노선',
                    backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                    data: [0,0,0,0,0,0,0,0]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선"]
            },
            options: {
                legend: {
                    display: false,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                    datalabels: {
                        color: 'white'
                    },
                    legend: {
                        display: false
                    }
                },
                scales : {
                    xAxis: {
                        ticks:{
                            autoSkip:false,
                            fontSize : 14
                        }
                    }
                }
            }
        });


        var topChart9 = new Chart(document.getElementById("bottom-chart-2"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: '노선',
                    backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                    data: [0,0,0,0,0,0,0,0]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선"]
            },
            options: {
                legend: {
                    display: false,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                    datalabels: {
                        color: 'white'
                    },
                    legend: {
                        display: false
                    }
                },
                scales : {
                    xAxis: {
                        ticks:{
                            autoSkip:false,
                            fontSize : 14
                        }
                    }
                }
            }
        });


        var topChart10 = new Chart(document.getElementById("bottom-chart-3"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: '노선',
                    backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                    data: [0,0,0,0,0,0,0,0]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선"]
            },
            options: {
                legend: {
                    display: false,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                    datalabels: {
                        color: 'white'
                    },
                    legend: {
                        display: false
                    }
                },
                scales : {
                    xAxis: {
                        ticks:{
                            autoSkip:false,
                            fontSize : 14
                        }
                    }
                }
            }
        });



        var topChart11 = new Chart(document.getElementById("bottom-chart-4"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: '노선',
                    backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                    data: [0,0,0,0,0,0,0,0]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선"]
            },
            options: {
                legend: {
                    display: false,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                    datalabels: {
                        color: 'white'
                    },
                    legend: {
                        display: false
                    }
                },
                scales : {
                    xAxis: {
                        ticks:{
                            autoSkip:false,
                            fontSize : 14
                        }
                    }
                }
            }
        });
    </script>

</body>
</html>