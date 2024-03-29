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

    <link href="/resources/vendor/datatables/css/jquery.dataTables.css" rel="stylesheet">
    <link href="/resources/vendor/datatables/css/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="/resources/vendor/datatables/css/dataTables.bulma.css" rel="stylesheet">
    <link href="/resources/vendor/datatables/css/dataTables.dataTables.css" rel="stylesheet">
    <link href="/resources/vendor/datatables/css/dataTables.foundation.css" rel="stylesheet">
    <link href="/resources/vendor/datatables/css/dataTables.jqueryui.css" rel="stylesheet">
    <link href="/resources/vendor/datatables/css/dataTables.semanticui.css" rel="stylesheet">

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.js"></script>
    <script src="/resources/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script src="/resources/vendor/datatables/js/dataTables.bulma.min.js"></script>
    <script src="/resources/vendor/datatables/js/dataTables.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables/js/dataTables.foundation.min.js"></script>
    <script src="/resources/vendor/datatables/js/dataTables.jqueryui.js"></script>
    <script src="/resources/vendor/datatables/js/dataTables.semanticui.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/demo/datatables-demo.js"></script>

    <script>

        function goIndex(){

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/");
            document.body.appendChild(form);
            form.submit();

        }

    </script>

    <!-- datatables -->
    <script>
        $(document).ready(function () {
            $('#myTable').DataTable({
                "language": {
                    "decimal":        "",
                    "emptyTable":     "조회된 데이터가 없습니다",
                    "info":           "_END_ 페이지 중 _START_ 페이지 (총 _TOTAL_ 개 데이터)",
                    "infoEmpty":      "0 페이지 중 0 페이지 (총 0 개 데이터)",
                    "infoFiltered":   "(filtered from _MAX_ total entries)",
                    "infoPostFix":    "",
                    "thousands":      ",",
                    "lengthMenu":     "_MENU_ 개씩 보기",
                    "loadingRecords": "조회중...",
                    "processing":     "",
                    "search":         "검색어:",
                    "zeroRecords":    "조회된 데이터가 없습니다",
                    "paginate": {
                        "first":      "첫 페이지",
                        "last":       "마지막 페이지",
                        "next":       "다음 페이지",
                        "previous":   "이전 페이지"
                    },
                    "aria": {
                        "sortAscending":  ": activate to sort column ascending",
                        "sortDescending": ": activate to sort column descending"
                    }
                },
                columnDefs: [
                    {
                        targets: -1,
                        className: 'dt-body-right'
                    }
                ]
            });
        });
    </script>


</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->

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
        <li class="nav-item">
            <a class="nav-link" href="#" onclick="goIndex()">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>대시보드</span></a>
        </li>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item active">
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
                <h1 class="h4 mb-0" style="color:#000">실시간 단말 모니터링</h1>
                <hr>
                <!--
                <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                    For more information about DataTables, please visit the <a target="_blank"
                                                                               href="https://datatables.net">official DataTables documentation</a>.</p> -->

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">단말 수신 데이터</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive" style="overflow-x:visible">
                            <table class="  hover row-border nowrap stripe" id="myTable" width="100%" >
                                <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>노선명</th>
                                    <th>차량</br>번호</th>
                                    <th>객차</br>번호</th>
                                    <th>IMEI</th>
                                    <th>LTE#</th>
                                    <th>ION_M</br>수</th>
                                    <th>ION_S</br>수</th>
                                    <th>시스템</br>상태</th>
                                    <th>ION</br>상태</th>
                                    <th>공기질</th>
                                    <th>미세먼지</th>
                                    <th>초미세먼지</th>
                                    <th>극초미세먼지</th>
                                    <th>TVOC</th>
                                    <th>이산화탄소</th>
                                    <th>온도</th>
                                    <th>습도</th>
                                    <th>비고</th>
                                </tr>
                                </thead>
                                <!--
                                <tfoot>
                                <tr>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                    <th>Name</th>
                                    <th>Position</th>
                                    <th>Office</th>
                                    <th>Age</th>
                                    <th>Start date</th>
                                    <th>Salary</th>
                                    <th>Salary</th>
                                </tr>
                                </tfoot>
                                -->
                                <tbody>
                                <tr>
                                    <!--
                                    <td colspan="10">전노선 실시간 평균 값</td>
                                    <td>150.00</td>
                                    <td>253.8</td>
                                    <td>9.72</td>
                                    <td>6.25</td>
                                    <td>3.55</td>
                                    <td>1801.32</td>
                                    <td>23.45</td>
                                    <td>33.28</td>
                                    <td></td>
                                    -->
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3500</td>
                                    <td>358645070008321</td>
                                    <td>012-2999-0971</td>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>ON</td>
                                    <td>ON</td>
                                    <td>168.47</td>
                                    <td>23</td>
                                    <td>8</td>
                                    <td>6</td>
                                    <td>3.46</td>
                                    <td>1530.16</td>
                                    <td>22.16</td>
                                    <td>31.97</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1호선</td>
                                    <td>311000</td>
                                    <td>3501</td>
                                    <td>358645070008339</td>
                                    <td>012-2999-0972</td>
                                    <td>OFF</td>
                                    <td>OFF</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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