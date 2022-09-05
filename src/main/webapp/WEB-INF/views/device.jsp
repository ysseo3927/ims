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

    <title>이오나이저 모니터링 시스템 | 장치 관리</title>

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
    <style>
        .table-border-st{
            width: 100%;
            border: 1px solid #BABFC7;
            border-collapse: collapse;
        }
        .cell-border-th{
            height:40px;
            border: 1px solid #BABFC7;
            background-color: #F8F8F8;
            padding: 10px;
            text-align: center;
        }
        .cell-border-td{
            height:40px;
            border: 1px solid #BABFC7;
            padding: 10px;
            text-align: center;
            font-weight: normal;
        }
        .cell-input{
            width:100%;
            height:30px;
            font-size:15px;
        }
    </style>
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

        function goDevice() {

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/device");
            document.body.appendChild(form);
            form.submit();
        }

        function registUserPopup(){
            $("#joinMemberModal").modal("show");
        }

        function remove(rowId){
            if(confirm("해당 장치를 삭제할까요?") == true){

                var sendData = {"rowId":rowId};

                $.ajax({
                    url: '/device/remove',
                    method: 'POST',
                    async: true,
                    data: JSON.stringify(sendData),
                    contentType: 'application/json; charset=UTF-8',
                    dataType: 'text',
                    success: function (result) {
                        var obj = JSON.parse(result);
                        callbackRemove(obj);
                    },
                    error: function (error) {
                        alert("장치 삭제 처리 중 오류가 발생했습니다 : " + error);
                    }
                });

            }
        }

        function callbackRemove(obj){
            if(obj.data =="success"){
                alert("장치 삭제가 완료되었습니다.");
                searchData();
            }
        }

        function registPopup(){
            $("#reg-imei").focus();
            $("#reg-imei").select();
            $("#registModal").modal("show");
        }

        function modifyPopup(imei){


            var sendData = {"imei":imei};

            $.ajax({
                url: '/device/search',
                method: 'POST',
                async: true,
                data: JSON.stringify(sendData),
                contentType: 'application/json; charset=UTF-8',
                dataType: 'text',
                success: function (result) {
                    var obj = JSON.parse(result);
                    callbackForModifySearch(obj);
                },
                error: function (error) {
                    alert("데이터 조회 중 오류가 발생했습니다 : " + error);
                }
            });
        }

        function imeiCheck(){

            var targetImei = $.trim($("#reg-imei").val());

            if(targetImei != ""){

                var sendData = {"imei":targetImei};

                $.ajax({
                    url: '/device/check/imei',
                    method: 'POST',
                    async: false,
                    data: JSON.stringify(sendData),
                    contentType: 'application/json; charset=UTF-8',
                    dataType: 'text',
                    success: function (result) {
                        var obj = JSON.parse(result);
                        callbackForCheckImei(obj);
                    },
                    error: function (error) {
                        alert("IMEI 중복 체크 중 오류가 발생했습니다 : " + error);
                    }
                });

            }
        }

        function regist(){

            if($.trim($("#reg-imei").val()) == ""){
                alert("IMEI를 입력해주세요.");
                $("#reg-imei").focus();
                $("#reg-imei").select();
                return;
            }else if($.trim($("#reg-imei").val()) < 1){
                alert("IMEI는 0보다 큰 값이 입력되어야 합니다.");
                $("#reg-imei").focus();
                $("#reg-imei").select();
                return;
            }

            if($.trim($("#reg-car").val()) == ""){
                alert("차량번호를 입력해주세요.");
                $("#reg-car").focus();
                $("#reg-car").select();
                return;
            }
            if($.trim($("#reg-pscar").val()) == ""){
                alert("객차번호를 입력해주세요.");
                $("#reg-pscar").focus();
                $("#reg-pscar").select();
                return;
            }
            if($.trim($("#reg-lte").val()) == ""){
                alert("LTE를 입력해주세요.");
                $("#reg-lte").focus();
                $("#reg-lte").select();
                return;
            }
            if($.trim($("#reg-ionm").val()) == ""){
                alert("ION_M수를 입력해주세요.");
                $("#reg-ionm").focus();
                $("#reg-ionm").select();
                return;
            }
            if($.trim($("#reg-ions").val()) == ""){
                alert("ION_S수를 입력해주세요.");
                $("#reg-ions").focus();
                $("#reg-ions").select();
                return;
            }

            var sendData = {"imei":$("#reg-imei").val(), "line":$("#reg-line").val(), "car":$("#reg-car").val(),
                "pscar":$("#reg-pscar").val(), "lte":$("#reg-lte").val(), "ionm":$("#reg-ionm").val(), "ions":$("#reg-ions").val(),
                "ion-status":$("#reg-ion-status").val(), "etc":$("#reg-etc").val()};

            $.ajax({
                url: '/device/regist/save',
                method: 'POST',
                async: true,
                data: JSON.stringify(sendData),
                contentType: 'application/json; charset=UTF-8',
                dataType: 'text',
                success: function (result) {
                    var obj = JSON.parse(result);
                    callbackForRegistSave(obj);
                },
                error: function (error) {
                    alert("장치 추가 중 오류가 발생했습니다 : " + error);
                }
            });
        }

        function callbackForRegistSave(obj){

            if(obj.data =="success"){
                alert("입력사항을 저장했습니다.");

                $('#reg-imei').val("");
                $('#reg-line').val("1");
                $('#reg-car').val("");
                $('#reg-pscar').val("");
                $('#reg-lte').val("");
                $('#reg-ionm').val("");
                $('#reg-ions').val("");
                $('#reg-ion-status').val("OFF");
                $('#reg-etc').val("");

                $("#registModal").modal("hide");
                searchData();
            }else{
                alert("장치 추가 중 오류가 발생했습니다");
            }

        }

        function callbackForCheckImei(obj){
            if(obj.data == "fail"){
                alert("동일한 IMEI가 이미 시스템에 등록되어 있습니다.\n다시 확인하시고 입력해주세요.");
                setTimeout(function(){
                    $("#reg-imei").focus();
                    $("#reg-imei").select();
                }, 10);
            }
        }

        function callbackForModifySearch(obj){

            var arrData = [];

            var rowData =
                { No:obj.data[0].id, IMEI:obj.data[0].imei, 노선명:obj.data[0].line, 차량번호:obj.data[0].car,
                    객차번호:obj.data[0].psCar, LTE:obj.data[0].lteS, ION_M수:obj.data[0].ionM, ION_S수:obj.data[0].ionS,
                    ION_상태:obj.data[0].ionStatus, 비고:obj.data[0].etc};

            arrData.push(rowData);

            $('#mod-no').val(obj.data[0].id);
            $('#mod-imei').val(obj.data[0].imei);
            $('#mod-line').val(obj.data[0].line);
            $('#mod-car').val(obj.data[0].car);
            $('#mod-pscar').val(obj.data[0].psCar);
            $('#mod-lte').val(obj.data[0].lteS);
            $('#mod-ionm').val(obj.data[0].ionM);
            $('#mod-ions').val(obj.data[0].ionS);
            $('#mod-ion-status').val(obj.data[0].ionStatus);
            $('#mod-etc').val(obj.data[0].etc);

            $('#mod-line').focus();

            $("#modifyModal").modal("show");
        }

        function modify(){
            if($.trim($("#mod-car").val()) == ""){
                alert("차량번호를 입력해주세요.");
                $("#mod-car").focus();
                $("#mod-car").select();
                return;
            }
            if($.trim($("#mod-pscar").val()) == ""){
                alert("객차번호를 입력해주세요.");
                $("#mod-pscar").focus();
                $("#mod-pscar").select();
                return;
            }
            if($.trim($("#mod-lte").val()) == ""){
                alert("LTE를 입력해주세요.");
                $("#mod-lte").focus();
                $("#mod-lte").select();
                return;
            }
            if($.trim($("#mod-ionm").val()) == ""){
                alert("ION_M수를 입력해주세요.");
                $("#mod-ionm").focus();
                $("#mod-ionm").select();
                return;
            }
            if($.trim($("#mod-ions").val()) == ""){
                alert("ION_S수를 입력해주세요.");
                $("#mod-ions").focus();
                $("#mod-ions").select();
                return;
            }

            var sendData = {"no":$("#mod-no").val(), "imei":$("#mod-imei").val(), "line":$("#mod-line").val(), "car":$("#mod-car").val(),
                "pscar":$("#mod-pscar").val(), "lte":$("#mod-lte").val(), "ionm":$("#mod-ionm").val(), "ions":$("#mod-ions").val(),
                "ion-status":$("#mod-ion-status").val(), "etc":$("#mod-etc").val()};

            $.ajax({
                url: '/device/modify/save',
                method: 'POST',
                async: true,
                data: JSON.stringify(sendData),
                contentType: 'application/json; charset=UTF-8',
                dataType: 'text',
                success: function (result) {
                    var obj = JSON.parse(result);
                    callbackForModifySave(obj);
                },
                error: function (error) {
                    alert("장치 수정 중 오류가 발생했습니다 : " + error);
                }
            });

        }

        function callbackForModifySave(obj){
            if(obj.data =="success"){
                alert("수정사항을 저장했습니다.");
                $("#modifyModal").modal("hide");
                searchData();
            }else{
                alert("장치 수정 중 오류가 발생했습니다");
            }
        }

        function closeModify(){
            $("#modifyModal").modal("hide");
        }

        function closeRegist(){

            $('#reg-imei').val("");
            $('#reg-line').val("1");
            $('#reg-car').val("");
            $('#reg-pscar').val("");
            $('#reg-lte').val("");
            $('#reg-ionm').val("");
            $('#reg-ions').val("");
            $('#reg-ion-status').val("OFF");
            $('#reg-etc').val("");

            $("#registModal").modal("hide");
        }

    </script>

    <!-- ag grid -->
    <script src="/resources/vendor/ag-grid/ag-grid-community.min.js"></script>
    <script>

        function onPageSizeChanged() {
            var value = document.getElementById('page-size').value;
            gridOptions.api.paginationSetPageSize(Number(value));
        }

        const columnDefs = [
            { field: "No", sortable: true},
            { field: "IMEI" , sortable: true, minWidth:200, editable: true },
            { field: "노선명" , sortable: true, minWidth:70},
            { field: "차량번호" , sortable: true, minWidth:100},
            { field: "객차번호" , sortable: true, minWidth:100},
            { field: "LTE" , sortable: true, minWidth:200},
            { field: "ION_M수" , sortable: true, minWidth:150},
            { field: "ION_S수" , sortable: true, minWidth:100},
            { field: "ION_상태", sortable: true, minWidth:100},
            { field: "등록일시", sortable: true, minWidth:200},
            { field: "장치수정" ,
                cellRenderer : function(params){
                    return "<div style='text-align:center;vertical-align:middle;padding-top:5px;'><button onclick='modifyPopup("+params.data.IMEI.toString()+")' style='height:25px;line-height:normal;border-radius:revert'>수정</button></div>"
                }
            },
            { field: "장치삭제" ,
                cellRenderer : function(params){
                    return "<div style='text-align:center;vertical-align:middle;padding-top:5px;'><button onclick='remove("+params.data.No.toString()+")' style='height:25px;line-height:normal;border-radius:revert'>삭제</button></div>"
                }
            },
            { field: "비고", sortable: true, minWidth:300}
        ];


        // specify the data
        const rowData = [];

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
            paginationPageSize: 100
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

        });

    </script>
    <script>
        $(function(){
            var CURRENT_DATA = null;

            searchData();
        });


        function searchData(){

            var sendData = {"imei":$('#imei').val(),"lteS":$('#lteS').val(),"line":$('#line').val(),"car":$('#car').val(),"psCar":$('#psCar').val()};

            $.ajax({
                url: '/device/search',
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
                    alert("데이터 조회 중 오류가 발생했습니다 : " + error);
                }
            });
        }

        function callback(obj){
            CURRENT_DATA = obj;

            var onCnt = 0;
            var arrData = [];

            for(var i=0; i < obj.data.length; i++){
                onCnt++;

                var rowData =
                    { No:obj.data[i].id, IMEI:obj.data[i].imei, 노선명:obj.data[i].line+"호선", 차량번호:obj.data[i].car,
                        객차번호:obj.data[i].psCar, LTE:obj.data[i].lteS, ION_M수:obj.data[i].ionM, ION_S수:obj.data[i].ionS,
                        ION_상태:obj.data[i].ionStatus,등록일시:obj.data[i].regdate, 비고:obj.data[i].etc};

                arrData.push(rowData);

            }

            gridOptions.api.setRowData(arrData );

        }

        function initCondition(){
            $('#imei').val("");
            $('#lteS').val("");
            $('#line').val("");
            $('#car').val("");
            $('#psCar').val("");
        }


        function dataDownload(){

            if(CURRENT_DATA.data.length < 1){
                alert("다운로드할 장치 데이터가 없습니다.");
            }else{

                var csv = [];
                var rowData = [];

                //2) 컬럼명 row 추가
                rowData.push("No", "IMEI", "노선명", "차량번호", "객차번호", "LTE", "ION_M수", "ION_S수", "ION_상태", "등록일시", "비고");
                csv.push(rowData.join(","));

                //3) 데이터 row 추가

                for(var i=0; i < CURRENT_DATA.data.length; i++){

                    rowData = [CURRENT_DATA.data[i].id, "'"+CURRENT_DATA.data[i].imei, CURRENT_DATA.data[i].line+"호선", CURRENT_DATA.data[i].car,
                        CURRENT_DATA.data[i].psCar,CURRENT_DATA.data[i].lteS,CURRENT_DATA.data[i].ionM,CURRENT_DATA.data[i].ionS,CURRENT_DATA.data[i].ionStatus,
                        CURRENT_DATA.data[i].regdate,CURRENT_DATA.data[i].etc];
                    csv.push(rowData.join(","));
                }

                var filename = curDateTime+"_device_data.csv";
                var csvFile;
                var link

                //4) 한글 깨짐 방지를 위한 코딩식별자 추가
                const BOM = "\uFEFF";
                csv = BOM + csv.join("\n");

                //5) 다운로드 링크 생성
                csvFile = new Blob([csv], { type: "text/csv" });
                link = document.createElement("a");
                link.download = filename;
                link.href = window.URL.createObjectURL(csvFile);
                link.style.display = "none";
                document.body.appendChild(link);
                link.click();
            }

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

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">


        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center"  href="#" onclick="goIndex()">
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
        <li class="nav-item">
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
            <li class="nav-item active">
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
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h4 mb-0" style="color:#000">장치 관리</h1>
                <hr>


                <!-- 관리자 설정 페이지 컨텐츠 삽입 부분 -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">장치 등록 현황</h6>
                    </div>
                    <div class="card-body">

                        <div class="table-responsive" style="overflow-x:visible">
                            <!-- 테이블 위치 -->
                            <div id="searchConditionDiv" style="border:1px solid #babfc7; width:100%; height:105px;margin-top:5px;margin-bottom:5px;color:#2f3037">
                                <div style="padding:15px;">
                                    IMEI
                                    <input id="imei" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="number" style="padding-left:5px;padding-top:5px;font-weight:bold;width:200px;height:30px;border:1px solid #babfc7;"></input>
                                    LTE#
                                    <input type="text" id="lteS" onKeyup="this.value=this.value.replace(/[^-\-0-9]/g,'');" style="padding-left:5px;padding-top:5px;font-weight:bold;width:200px;height:30px;border:1px solid #babfc7;"></input>
                                    노선명
                                    <select id="line" name="line" type="text" style="width:100px;height:30px;border:1px solid #babfc7;">
                                        <option value="" selected>전체</option>
                                        <option value="1">1호선</option>
                                        <option value="2">2호선</option>
                                        <option value="3">3호선</option>
                                        <option value="4">4호선</option>
                                        <option value="5">5호선</option>
                                        <option value="6">6호선</option>
                                        <option value="7">7호선</option>
                                        <option value="8">8호선</option>
                                    </select>
                                </div>
                                <div style="padding-left:15px;padding-right:15px;padding-bottom:15px;">
                                    차량번호
                                    <input id="car" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="number" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                    객차번호
                                    <input id="psCar" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="number" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                    한 페이지 당 데이터 수
                                    <select onchange="onPageSizeChanged()" id="page-size" style="width:100px;height:30px;border:1px solid #babfc7;">
                                        <option value="10">10</option>
                                        <option value="100" selected>100</option>
                                        <option value="500">500</option>
                                        <option value="1000">1000</option>
                                    </select>
                                    <a href="#" onclick="searchData();" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:20px;"><i
                                            class="fas fa-search fa-sm text-white-50"></i>조회</a>
                                    <a href="#" onclick="initCondition();" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                            class="fas fa-history fa-sm text-white-50"></i> 조건 초기화</a>
                                    <a href="#" onclick="registPopup();" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                            class="fas fa-file fa-sm text-white-50"></i> 장치 추가</a>
                                    <a href="#" onclick="dataDownload();" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i
                                            class="fas fa-download fa-sm text-white-50"></i> 다운로드</a>
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

    <!-- LOGOUT Modal-->
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
                    <a class="btn btn-primary" href="#"  onclick="goLogin()">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modifyModal" style="margin-top:150px;" tabindex="-2" role="dialog" aria-labelledby="modifyModalLabel"
         aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog" style="max-width:80%" role="document">
            <div class="modal-content">
                <div class="modal-header" style="color:#0c0c0c">
                    <h5 class="modal-title" id="modifyModalLabel">장치 수정</h5>
                    <button class="close" onclick="closeModify()" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="overflow: scroll;overflow-y: hidden;">
                    <div id="modifyTable" style="height: 200px;" class="ag-theme-alpine">
                        <table class="table-border-st" style="width:1489px;">
                            <thead>
                                <tr>
                                    <th class="cell-border-th">No</th>
                                    <th class="cell-border-th">IMEI</th>
                                    <th class="cell-border-th">노선명</th>
                                    <th class="cell-border-th">차량번호</th>
                                    <th class="cell-border-th">객차번호</th>
                                    <th class="cell-border-th">LTE</th>
                                    <th class="cell-border-th">ION_M수</th>
                                    <th class="cell-border-th">ION_S수</th>
                                    <th class="cell-border-th">ION_상태</th>
                                    <th class="cell-border-th">비고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="cell-border-td" style="width:5%;"><input id="mod-no" type="number" min="1" class="cell-input" style="text-align:center;font-weight: bold;" disabled></td>
                                    <td class="cell-border-td" style="width:15%;"><input id="mod-imei" type="number" min="1" class="cell-input" style="text-align:center;font-weight: bold;" disabled></td>
                                    <td class="cell-border-td" style="width:10%;">
                                        <select id="mod-line" name="mod-line" class="cell-input" type="text">
                                            <option value="1" selected>1호선</option>
                                            <option value="2">2호선</option>
                                            <option value="3">3호선</option>
                                            <option value="4">4호선</option>
                                            <option value="5">5호선</option>
                                            <option value="6">6호선</option>
                                            <option value="7">7호선</option>
                                            <option value="8">8호선</option>
                                        </select>
                                    </td>
                                    <td class="cell-border-td" style="width:10%;"><input id="mod-car" class="cell-input" type="number" min="1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
                                    <td class="cell-border-td" style="width:10%;"><input id="mod-pscar" class="cell-input" type="number" min="1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
                                    <td class="cell-border-td" style="width:10%;"><input id="mod-lte" class="cell-input" type="text" onKeyup="this.value=this.value.replace(/[^-\-0-9]/g,'');"></td>
                                    <td class="cell-border-td" style="width:10%;"><input id="mod-ionm" class="cell-input" type="number" min="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
                                    <td class="cell-border-td" style="width:10%;"><input id="mod-ions" class="cell-input" type="number" min="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
                                    <td class="cell-border-td" style="width:10%;">
                                        <select id="mod-ion-status" name="mod-ion-status" class="cell-input" type="text">
                                            <option value="ON">ON</option>
                                            <option value="OFF" selected>OFF</option>
                                        </select>
                                    </td>
                                    <td class="cell-border-td" style="width:10%;"><input id="mod-etc" type="text" class="cell-input"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="innerModifyWrap" class="modal-footer">
                    <button class='btn btn-secondary' onclick='closeModify()' type='button' data-dismiss='modal'>취소</button>
                    <a class='btn btn-primary' href='#' onclick='modify()'>저장</a>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="registModal" style="margin-top:150px;" tabindex="-2" role="dialog" aria-labelledby="registModalLabel"
         aria-hidden="true" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog" style="max-width:80%" role="document">
            <div class="modal-content">
                <div class="modal-header" style="color:#0c0c0c">
                    <h5 class="modal-title" id="registModalLabel">장치 추가</h5>
                    <button class="close" onclick="closeRegist()" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="overflow: scroll;overflow-y: hidden;">
                    <div id="registTable" style="height: 200px;" class="ag-theme-alpine">
                        <table class="table-border-st" style="width:1489px;">
                            <thead>
                            <tr>
                                <th class="cell-border-th">IMEI</th>
                                <th class="cell-border-th">노선명</th>
                                <th class="cell-border-th">차량번호</th>
                                <th class="cell-border-th">객차번호</th>
                                <th class="cell-border-th">LTE</th>
                                <th class="cell-border-th">ION_M수</th>
                                <th class="cell-border-th">ION_S수</th>
                                <th class="cell-border-th">ION_상태</th>
                                <th class="cell-border-th">비고</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="cell-border-td" style="width:15%;"><input id="reg-imei" type="number" onblur="imeiCheck();" min="1" class="cell-input" style="text-align:center;font-weight: bold;"></td>
                                <td class="cell-border-td" style="width:10%;">
                                    <select id="reg-line" name="mod-line" class="cell-input" type="text">
                                        <option value="1" selected>1호선</option>
                                        <option value="2">2호선</option>
                                        <option value="3">3호선</option>
                                        <option value="4">4호선</option>
                                        <option value="5">5호선</option>
                                        <option value="6">6호선</option>
                                        <option value="7">7호선</option>
                                        <option value="8">8호선</option>
                                    </select>
                                </td>
                                <td class="cell-border-td" style="width:10%;"><input id="reg-car" class="cell-input" type="number" min="1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
                                <td class="cell-border-td" style="width:10%;"><input id="reg-pscar" class="cell-input" type="number" min="1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
                                <td class="cell-border-td" style="width:10%;"><input id="reg-lte" class="cell-input" type="text" onKeyup="this.value=this.value.replace(/[^-\-0-9]/g,'');"></td>
                                <td class="cell-border-td" style="width:10%;"><input id="reg-ionm" class="cell-input" type="number" min="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
                                <td class="cell-border-td" style="width:10%;"><input id="reg-ions" class="cell-input" type="number" min="0" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
                                <td class="cell-border-td" style="width:10%;">
                                    <select id="reg-ion-status" name="mod-ion-status" class="cell-input" type="text">
                                        <option value="ON">ON</option>
                                        <option value="OFF" selected>OFF</option>
                                    </select>
                                </td>
                                <td class="cell-border-td" style="width:15%;"><input id="reg-etc" type="text" class="cell-input"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="innerRegistyWrap" class="modal-footer">
                    <button class='btn btn-secondary' onclick='closeRegist()' type='button' data-dismiss='modal'>취소</button>
                    <a class='btn btn-primary' href='#' onclick='regist()'>저장</a>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>