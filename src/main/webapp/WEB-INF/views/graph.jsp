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

    <title>이오나이저 모니터링 시스템 | 환경센서로그</title>

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

</head>

<body id="page-top">
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
    if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <div id="content">
            <div id="content_area" class="container-fluid">


                <div class="card shadow mb-4" style="margin-top:10px;">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary" style="font-size:18px">센서 로그 그래프</h6>
                    </div>
                    <div class="card-body" id="cardBody">
                        <div class="table-responsive" style="overflow-x:visible">

                            <div id="searchConditionDiv" style="border:1px solid #babfc7; width:100%; height:105px;margin-top:5px;margin-bottom:5px;color:#2f3037">
                                <form name="frmData" id="frmData" method="post">
                                    <div style="padding:15px;">
                                        IMEI　
                                        <input type="text" style="padding-left:5px;padding-top:5px;font-weight:bold;width:200px;height:30px;border:1px solid #babfc7;" value="358645070008321" disabled></input>
                                        LTE#
                                        <input type="text" style="padding-left:5px;padding-top:5px;font-weight:bold;width:200px;height:30px;border:1px solid #babfc7;" value="012-2999-0971" disabled></input>
                                        <!-- 일시
                                        <input type="text" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                        ~
                                        <input type="text" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                        -->
                                    </div>
                                    <div style="padding-left:3px;padding-right:15px;padding-bottom:15px;margin-left:10px;">
                                        노선명
                                        <select type="text" style="width:100px;height:30px;border:1px solid #babfc7;">
                                            <option value="ALL" selected>전체</option>
                                            <option value="1">1호선</option>
                                            <option value="2">2호선</option>
                                            <option value="3">3호선</option>
                                            <option value="4">4호선</option>
                                            <option value="5">5호선</option>
                                            <option value="6">6호선</option>
                                            <option value="7">7호선</option>
                                            <option value="8">8호선</option>
                                        </select>
                                        차량번호
                                        <input type="text" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                        객차번호
                                        <input type="text" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                        ION 상태
                                        <input type="radio" style="width:20px;height:20px;border:1px solid #babfc7;vertical-align:middle;margin-right:5px;" name="ionStatus" id="ionStatusOn" checked></input>
                                        <label for="ionStatusOn">ON</label>
                                        <input type="radio" style="width:20px;height:20px;border:1px solid #babfc7;vertical-align:middle;margin-right:5px;" name="ionStatus" id="ionStatusOff"></input>
                                        <label for="ionStatusOff" style="margin-right:15px;">OFF</label>
                                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                                class="fas fa-search fa-sm text-white-50"></i>조회</a>
                                        <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                                class="fas fa-history fa-sm text-white-50"></i> 조건 초기화</a>
                                        <a id="screenshot" href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
                                            <i class="fas fa-download fa-sm text-white-50"></i> 스크린샷 저장</a>
                                    </div>
                                </form>
                            </div>

                            <div id="rowWrapper">
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
                                                <h6 class="m-0 font-weight-bold" style="color:#51545c">미세먼지 농도 (㎍/㎥) </h6>
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
                                                <h6 class="m-0 font-weight-bold" style="color:#51545c">초미세먼지 농도 (㎍/㎥)</h6>
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
                                                <h6 class="m-0 font-weight-bold" style="color:#51545c">극초미세먼지 농도 (㎍/㎥)</h6>
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
                         </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

</div>


<!-- 차트 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

<!-- 이미지 캡쳐 플러그인 -->
<script type="text/javascript" src="/resources/js/html2canvas.js"></script>

<script>

    Chart.register(ChartDataLabels);

    new Chart(document.getElementById("middle-chart-1"), {
        type: 'bar',
        data: {
            datasets: [{
                type: 'bar',
                label: '노선',
                backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                data: [235,270,210,118,140,250,150,50]
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


    new Chart(document.getElementById("middle-chart-2"), {
        type: 'bar',
        data: {
            datasets: [{
                type: 'bar',
                label: '노선',
                backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                data: [235,270,210,118,140,250,150,50]
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


    new Chart(document.getElementById("middle-chart-3"), {
        type: 'bar',
        data: {
            datasets: [{
                type: 'bar',
                label: '노선',
                backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                data: [235,270,210,118,140,250,150,50]
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


    new Chart(document.getElementById("middle-chart-4"), {
        type: 'bar',
        data: {
            datasets: [{
                type: 'bar',
                label: '노선',
                backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                data: [235,270,210,118,140,250,150,50]
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


    new Chart(document.getElementById("bottom-chart-1"), {
        type: 'bar',
        data: {
            datasets: [{
                type: 'bar',
                label: '노선',
                backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                data: [235,270,210,118,140,250,150,50]
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


    new Chart(document.getElementById("bottom-chart-2"), {
        type: 'bar',
        data: {
            datasets: [{
                type: 'bar',
                label: '노선',
                backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                data: [235,270,210,118,140,250,150,50]
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


    new Chart(document.getElementById("bottom-chart-3"), {
        type: 'bar',
        data: {
            datasets: [{
                type: 'bar',
                label: '노선',
                backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                data: [235,270,210,118,140,250,150,50]
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



    new Chart(document.getElementById("bottom-chart-4"), {
        type: 'bar',
        data: {
            datasets: [{
                type: 'bar',
                label: '노선',
                backgroundColor: ["rgb(0,82,164,0.9)","rgb(0,157,62,0.9)","rgb(239,124,28,0.9)","rgb(0,165,222,0.9)","rgb(153,108,172,0.9)","rgb(205,124,47,0.9)","rgb(116,127,0,0.9)","rgb(234,84,93 ,0.9)"],
                data: [235,270,210,118,140,250,150,50]
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

<script language="Javascript">
    $(function(){

        $('#screenshot').click(function() {

            var curDateTime;
            var currentDate=new Date();
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

            curDateTime = currentDate.getFullYear() + "" + month + "" + date + "" +  hours + "" + minutes + "" + seconds;

            let scrollHeight = Math.max(
                document.body.scrollHeight, document.documentElement.scrollHeight,
                document.body.offsetHeight, document.documentElement.offsetHeight,
                document.body.clientHeight, document.documentElement.clientHeight
            );

            html2canvas($("#cardBody")[0]).then((canvas) => {

                var image = canvas.toDataURL();
                var link = document.createElement("a");
                link.download = curDateTime+"screenshot.png";
                link.href = image;
                document.body.appendChild(link);
                link.click();

            });
        });
    });
</script>

</body>
</html>