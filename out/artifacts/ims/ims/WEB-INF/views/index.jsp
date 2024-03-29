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
            padding-left: 57.5em;
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
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                <img class="sidebar-card-illustration mb-2" style="padding-left:265px;padding-top:15px;" src="/resources/img/logo.png" alt="...">
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
                <a class="nav-link" href="index.jsp">
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
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>환경센서 로그</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="#">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>통계관리</span>
                </a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                CONFIG
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>설정</span>
                </a>
                <!--
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.jsp">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
                -->
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

            <!-- Sidebar Message -->
            <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="/resources/img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>IMS</strong>는 서울지하철의 미세먼지,이산화탄소 등 대기질 상태 현황 정보를 실시간으로 제공합니다.</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

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
                                <span class="mr-2 d-none d-lg-inline text-white large">2022-06-15 월요일 11:20:35</span>
                                <div class="topbar-divider d-none d-sm-block"></div>
                                <span class="mr-2 d-none d-lg-inline text-white large">　홍길동 | 관리자</span>
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-1">
                        <h1 class="h4 mb-0" style="color:black;">대기질 실시간 모니터링 현황</h1>
                        <div class="form-check form-switch form-switch-md">
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>
                            <label class="form-check-label" for="flexSwitchCheckChecked">실시간 데이터 갱신 ON/OFF 토글</label>
                        </div>
                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-download fa-sm text-white-50"></i> 대기질 현황 데이터 저장</a>
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
                                            <h6 class="m-0 font-weight-bold text-primary ">전체 노선 평균 통합 공기질 지수</h6>
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
                                                <div style="text-align:center">
                                                    <img class="rounded-circle" src="/resources/img/clean-score-discription.jpg"  width="280px"; height="50px"; >
                                                </div>
                                                <div class="top-chart-1"></div>
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
                                            <h6 class="m-0 font-weight-bold text-primary">노선별 평균 통합 공기질 지수</h6>
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
                                                <canvas id="top-chart-2" style="width:450px;height:250px;"></canvas>
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
                                            <h6 class="m-0 font-weight-bold text-primary">시간대별 전체 노선 평균 통합 공기질 지수</h6>
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
                                                <canvas id="top-chart-3" style="width:600px;height:250px"></canvas>
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
                                            <h6 class="m-0 font-weight-bold text-primary">통합 공기질 지수</h6>
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
                                                <canvas id="middle-chart-1" style="width:330px;height:200px;"></canvas>
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
                                            <h6 class="m-0 font-weight-bold text-primary">미세먼지 농도 (GP10 / ㎍/㎥) </h6>
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
                                                <canvas id="middle-chart-2" style="width:330px;height:200px;"></canvas>
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
                                            <h6 class="m-0 font-weight-bold text-primary">초미세먼지 농도 (GP2.5 / ㎍/㎥)</h6>
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
                                                <canvas id="middle-chart-3" style="width:330px;height:200px;"></canvas>
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
                                            <h6 class="m-0 font-weight-bold text-primary">극초미세먼지 농도 (GP1.0 / ㎍/㎥)</h6>
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
                                                <canvas id="middle-chart-4" style="width:330px;height:200px;"></canvas>
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
                                            <h6 class="m-0 font-weight-bold text-primary">TVOC (ppm)</h6>
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
                                                <canvas id="bottom-chart-1" style="width:330px;height:200px;"></canvas>
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
                                            <h6 class="m-0 font-weight-bold text-primary">이산화탄소 (ppm)</h6>
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
                                                <canvas id="bottom-chart-2" style="width:330px;height:200px;"></canvas>
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
                                            <h6 class="m-0 font-weight-bold text-primary">온도 (℃)</h6>
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
                                                <canvas id="bottom-chart-3" style="width:330px;height:200px;"></canvas>
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
                                            <h6 class="m-0 font-weight-bold text-primary">습도 (%RH)</h6>
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
                                                <canvas id="bottom-chart-4" style="width:330px;height:200px;"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>


                            <!-- Content Row -->
                            <div class="row">

                                <!-- Earnings (Monthly) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-primary shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                        Earnings (Monthly)</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">$40,000</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Earnings (Monthly) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-success shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                        Earnings (Annual)</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Earnings (Monthly) Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-info shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                                    </div>
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col-auto">
                                                            <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="progress progress-sm mr-2">
                                                                <div class="progress-bar bg-info" role="progressbar"
                                                                     style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                                     aria-valuemax="100"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Pending Requests Card Example -->
                                <div class="col-xl-3 col-md-6 mb-4">
                                    <div class="card border-left-warning shadow h-100 py-2">
                                        <div class="card-body">
                                            <div class="row no-gutters align-items-center">
                                                <div class="col mr-2">
                                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                        Pending Requests</div>
                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                                </div>
                                                <div class="col-auto">
                                                    <i class="fas fa-comments fa-2x text-gray-300"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Content Row -->

                            <!-- Content Row -->
                            <div class="row">

                                <!-- Content Column -->
                                <div class="col-lg-6 mb-4">

                                    <!-- Project Card Example -->
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
                                        </div>
                                        <div class="card-body">
                                            <h4 class="small font-weight-bold">Server Migration <span
                                                    class="float-right">20%</span></h4>
                                            <div class="progress mb-4">
                                                <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                                                     aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <h4 class="small font-weight-bold">Sales Tracking <span
                                                    class="float-right">40%</span></h4>
                                            <div class="progress mb-4">
                                                <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                                     aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <h4 class="small font-weight-bold">Customer Database <span
                                                    class="float-right">60%</span></h4>
                                            <div class="progress mb-4">
                                                <div class="progress-bar" role="progressbar" style="width: 60%"
                                                     aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <h4 class="small font-weight-bold">Payout Details <span
                                                    class="float-right">80%</span></h4>
                                            <div class="progress mb-4">
                                                <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                                                     aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                            <h4 class="small font-weight-bold">Account Setup <span
                                                    class="float-right">Complete!</span></h4>
                                            <div class="progress">
                                                <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                                     aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Color System -->
                                    <div class="row">
                                        <div class="col-lg-6 mb-4">
                                            <div class="card bg-primary text-white shadow">
                                                <div class="card-body">
                                                    Primary
                                                    <div class="text-white-50 small">#4e73df</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 mb-4">
                                            <div class="card bg-success text-white shadow">
                                                <div class="card-body">
                                                    Success
                                                    <div class="text-white-50 small">#1cc88a</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 mb-4">
                                            <div class="card bg-info text-white shadow">
                                                <div class="card-body">
                                                    Info
                                                    <div class="text-white-50 small">#36b9cc</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 mb-4">
                                            <div class="card bg-warning text-white shadow">
                                                <div class="card-body">
                                                    Warning
                                                    <div class="text-white-50 small">#f6c23e</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 mb-4">
                                            <div class="card bg-danger text-white shadow">
                                                <div class="card-body">
                                                    Danger
                                                    <div class="text-white-50 small">#e74a3b</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 mb-4">
                                            <div class="card bg-secondary text-white shadow">
                                                <div class="card-body">
                                                    Secondary
                                                    <div class="text-white-50 small">#858796</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 mb-4">
                                            <div class="card bg-light text-black shadow">
                                                <div class="card-body">
                                                    Light
                                                    <div class="text-black-50 small">#f8f9fc</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 mb-4">
                                            <div class="card bg-dark text-white shadow">
                                                <div class="card-body">
                                                    Dark
                                                    <div class="text-white-50 small">#5a5c69</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-lg-6 mb-4">

                                    <!-- Illustrations -->
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="text-center">
                                                <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                                     src="/resources/img/undraw_posting_photo.svg" alt="...">
                                            </div>
                                            <p>Add some quality, svg illustrations to your project courtesy of <a
                                                    target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a
                                                constantly updated collection of beautiful svg images that you can use
                                                completely free and without attribution!</p>
                                            <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on
                                                unDraw &rarr;</a>
                                        </div>
                                    </div>

                                    <!-- Approach -->
                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3">
                                            <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                                        </div>
                                        <div class="card-body">
                                            <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
                                                CSS bloat and poor page performance. Custom CSS classes are used to create
                                                custom components and custom utility classes.</p>
                                            <p class="mb-0">Before working with this theme, you should become familiar with the
                                                Bootstrap framework, especially the utility classes.</p>
                                        </div>
                                    </div>

                                </div>
                            </div>

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
                    <a class="btn btn-primary" href="login.jsp">로그아웃</a>
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

    <script>
        function goMonitoring(){

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/monitoring");
            document.body.appendChild(form);
            form.submit();

        }

    </script>

    <script>


        /*---------------------
        // D3.js Gauge Chart //
        ---------------------*/
        // Data which need to be fetched
        var name = "350";
        var value = 200;    // My Desired Value To Show
        var gaugeMaxValue = 300;

        // Data of calculation
        var percentValue = value / gaugeMaxValue;
        var needleClient;
        (function () {
            var barWidth, chart, chartInset, degToRad, repaintGauge, height, margin, numSections, padRad, percToDeg, percToRad, percent, radius, sectionIndx, svg, totalPercent, width, recalcPointerPos;

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
            svg = el.append('svg').attr('width', width + margin.left + margin.right).attr('height', height / 1.5 + margin.top + margin.bottom);		// height/1.5 To Remove Extra Bottom Space

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
                .attr('transform', "translate(145, " + ((height + margin.top) / 1.6) + ")")
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
                    .attr("font-size", 18)
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

        Chart.register(ChartDataLabels);

        new Chart(document.getElementById("top-chart-2"), {
            type: 'bar',
            data: {
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "신림선", "우이신설선"],
                datasets: [
                    {
                        label: "노선",
                        /* backgroundColor: ["#92d14f","#00af50","#92d14f","#ffc000","#ffff01","#00af50","#ffff01","#c00000","#92d14f","#00af50","#00af50"], */
                        data: [235,270,210,118,140,250,150,50,190,250,220]
                    }
                ]
            },
            options: {
                legend: {
                    display: true,
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
                        borderColor:'black',
                        borderWidth:2,
                        borderRadius:6,
                        font: {
                            weight: 'bold',
                            lineHeight: 1.0
                        },
                        padding :{
                            bottom : '0'
                        }
                }
                }
            }
        });

        new Chart(document.getElementById("top-chart-3"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: 'Bar Dataset',
                    data: [235,270,210,118,140,250,150,50,190,250,200,140,230]
                }, {
                    type: 'line',
                    label: 'Line Dataset',
                    data: [235,270,210,118,140,250,150,50,190,250,200,140,230],
                }],
                labels: ["05:00", "06:00", "07:00", "08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00"]
            },
            options: {
                legend: {
                    display: true,
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
                        borderColor:'black',
                        borderWidth:2,
                        borderRadius:6,
                        font: {
                            weight: 'bold',
                            lineHeight: 1.0
                        },
                        padding :{
                            bottom : '0'
                        }
                    }
                }
            }
        });


        new Chart(document.getElementById("middle-chart-1"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: 'Bar Dataset',
                    data: [235,270,210,118,140,250,150,50,190,250,220]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "신림선", "우이신설선"]
            },
            options: {
                legend: {
                    display: true,
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
                    }
                }
            }
        });


        new Chart(document.getElementById("middle-chart-2"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: 'Bar Dataset',
                    data: [235,270,210,118,140,250,150,50,190,250,220]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "신림선", "우이신설선"]
            },
            options: {
                legend: {
                    display: true,
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
                    }
                }
            }
        });


        new Chart(document.getElementById("middle-chart-3"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: 'Bar Dataset',
                    data: [235,270,210,118,140,250,150,50,190,250,220]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "신림선", "우이신설선"]
            },
            options: {
                legend: {
                    display: true,
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
                    }
                }
            }
        });


        new Chart(document.getElementById("middle-chart-4"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: 'Bar Dataset',
                    data: [235,270,210,118,140,250,150,50,190,250,220]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "신림선", "우이신설선"]
            },
            options: {
                legend: {
                    display: true,
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
                    }
                }
            }
        });


        new Chart(document.getElementById("bottom-chart-1"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: 'Bar Dataset',
                    data: [235,270,210,118,140,250,150,50,190,250,220]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "신림선", "우이신설선"]
            },
            options: {
                legend: {
                    display: true,
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
                    }
                }
            }
        });


        new Chart(document.getElementById("bottom-chart-2"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: 'Bar Dataset',
                    data: [235,270,210,118,140,250,150,50,190,250,220]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "신림선", "우이신설선"]
            },
            options: {
                legend: {
                    display: true,
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
                    }
                }
            }
        });


        new Chart(document.getElementById("bottom-chart-3"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: 'Bar Dataset',
                    data: [235,270,210,118,140,250,150,50,190,250,220]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "신림선", "우이신설선"]
            },
            options: {
                legend: {
                    display: true,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {
                }
            }
        });



        new Chart(document.getElementById("bottom-chart-4"), {
            type: 'bar',
            data: {
                datasets: [{
                    type: 'bar',
                    label: 'Bar Dataset',
                    data: [235,270,210,118,140,250,150,50,190,250,220]
                }],
                labels: ["1호선", "2호선", "3호선", "4호선", "5호선", "6호선", "7호선", "8호선", "9호선", "신림선", "우이신설선"]
            },
            options: {
                legend: {
                    display: true,
                    position: "bottom",
                    align: "center"
                },
                title: {
                    display: false,
                    text: 'Predicted world population (millions) in 2050'
                },
                responsive: false,
                plugins: {

                }
            }
        });
    </script>

</body>
</html>