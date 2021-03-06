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

    <title>이오나이저 모니터링 시스템 | 모니터링</title>

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
            { field: "No", sortable: false, colSpan: params => params.data.No === "전 노선 실시간 평균 값" ? 10 : 0, cellClass: "grid-cell-centered-and-bold"},
            { field: "노선명" , sortable: true},
            { field: "차량번호" , sortable: true},
            { field: "객차번호" , sortable: true},
            { field: "IMEI" , sortable: true},
            { field: "LTE" , sortable: true},
            { field: "ION_M수" , sortable: true},
            { field: "ION_S수" , sortable: true},
            { field: "시스템상태" , sortable: true},
            { field: "ION상태" , sortable: true},
            { field: "공기질" , sortable: true},
            { field: "미세먼지" , sortable: true},
            { field: "초미세먼지" , sortable: true},
            { field: "극초미세먼지" , sortable: true},
            { field: "TVOC" , sortable: true},
            { field: "이산화탄소" , sortable: true},
            { field: "온도" , sortable: true},
            { field: "습도" , sortable: true},
            { field: "비고" , sortable: false}
        ];

        // specify the data
        const rowData = [
            { No: "1", 노선명: "1호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "2", 노선명: "2호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "3", 노선명: "3호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "4", 노선명: "4호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "5", 노선명: "5호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "6", 노선명: "6호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "7", 노선명: "7호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "8", 노선명: "8호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "9", 노선명: "9호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "10", 노선명: "신림선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "11", 노선명: "우이신설선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "12", 노선명: "1호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "13", 노선명: "1호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "14", 노선명: "1호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "15", 노선명: "1호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "16", 노선명: "1호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "17", 노선명: "1호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "18", 노선명: "1호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "19", 노선명: "1호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""},
            { No: "20", 노선명: "1호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""}
        ];

        // let the grid know which columns and what data to use



        screen.width        // 화면(모니터 해상도)의 너비
        screen.availWidth  // 모니터 화면의 작업 표시줄을 제외한 너비

        screen.height      // 화면(모니터 해상도)의 높이
        screen.availHeight // 모니터 화면의 작업 표시줄을 제외한 높이

        //alert(screen.width);

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
            //rowHeight: 20
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

            gridOptions.columnApi.autoSizeColumns(allColumnIds, false);

            gridOptions.api.setPinnedTopRowData([{ No: "전 노선 실시간 평균 값", 노선명: "9호선", 차량번호: "311000", 객차번호:"3500", IMEI: "358645070008321", LTE: "012-2999-0971", ION_M수:"1", ION_S수:"7", 시스템상태:"ON", ION상태:"OFF", 공기질:"150.0", 미세먼지:"253.8", 초미세먼지:"9.72", 극초미세먼지:"6.25", TVOC:"3.55", 이산화탄소:"1801.32", 온도:"23.45", 습도:"33.28",비고:""}]);

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
                $("#controlView").text("- 화면 축소");

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
        <li class="nav-item active">
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
            <a class="nav-link collapsed" href="#" onclick="goConfig()" data-toggle="collapse" data-target="#collapsePages"
               aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-cog"></i>
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
                <h1 class="h4 mb-0" style="color:#000">실시간 단말 모니터링</h1>
                <hr>

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <div style="float:left"><h6 class="m-0 font-weight-bold text-primary">단말 수신 데이터 현황</h6></div>
                         <div style="padding-left:0px;float:right;display:inline-block" class="form-check form-switch form-switch-md">
                            <label style="margin-right:40px;color:#5D5D5D;font-weight:bold" class="form-check-label" for="flexSwitchCheckChecked">실시간 데이터 갱신(30초)　</label>
                            <input style="margin-right:40px;" class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive" style="overflow-x:visible">
                            <!-- 테이블 위치 -->
                            <div id="searchConditionDiv" style="border:1px solid #babfc7; width:100%; height:105px;margin-top:5px;margin-bottom:5px;color:#2f3037">
                                <div style="padding:15px;">
                                    IMEI　
                                    <input type="text" style="padding-left:5px;padding-top:5px;font-weight:bold;width:200px;height:30px;border:1px solid #babfc7;"></input>
                                    LTE#
                                    <input type="text" style="padding-left:5px;padding-top:5px;font-weight:bold;width:200px;height:30px;border:1px solid #babfc7;"></input>
                                </div>
                                <div style="padding-left:15px;padding-right:15px;padding-bottom:15px;">
                                    차량번호
                                    <input type="text" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                    객차번호
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
                                            class="fas fa-sm text-white-50"></i>+ 화면 확장</a>
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