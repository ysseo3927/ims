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

    <!-- datetimepicker -->
    <link rel="stylesheet" type="text/css" href="/resources/css/jquery.datetimepicker.min.css"/>

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

    <!-- datetimepicker -->
    <script src="/resources/js/jquery.datetimepicker.full.min.js"></script>

    <script>
        var RECENT_DATA = null;
        var TARGET_ID = [];

        var RECENT_IAQ = 0;
        var RECENT_GP10 = 0;
        var RECENT_GP_1_0 = 0;
        var RECENT_GP_2_5 = 0;
        var RECENT_TVOC = 0;
        var RECENT_CO2 = 0;
        var RECENT_TEMP = 0;
        var RECENT_HUMI = 0;

        var SELECTED_IAQ = 0;
        var SELECTED_GP10 = 0;
        var SELECTED_GP_1_0 = 0;
        var SELECTED_GP_2_5 = 0;
        var SELECTED_TVOC = 0;
        var SELECTED_CO2 = 0;
        var SELECTED_TEMP = 0;
        var SELECTED_HUMI = 0;

        $(function(){

            var nowDate = new Date();
            var prevDate = nowDate.getDate() - 1;

            var nowMonth = nowDate.getMonth()+1;
            var nowDt = nowDate.getDate();
            var nowHours = nowDate.getHours();
            var nowMinutes = nowDate.getMinutes();

            if(nowDate.getMonth()+1 < 10){
                nowMonth = "0" + (nowDate.getMonth()+1);
            }
            if(nowDate.getDate() < 10){
                nowDt = "0" + (nowDate.getDate());
            }
            if(nowDate.getHours() < 10){
                nowHours = "0" + (nowDate.getHours());
            }
            if(nowDate.getMinutes() < 10){
                nowMinutes = "0" + nowDate.getMinutes();
            }

            var initStartDatetime = nowDate.getFullYear() + "-" + nowMonth + "-" + nowDt + " " + "00:00";
            var initEndDatetime = nowDate.getFullYear() + "-" + nowMonth + "-" + nowDt + " " + nowHours + ":" + nowMinutes;

            $('#startDatetime').val(initStartDatetime);
            $('#endDatetime').val(initEndDatetime);

            searchData();
        });
    </script>
    <script>

        var exp = /평균 값/;

        const columnDefs = [
            { field: "선택", headerCheckboxSelection: true,checkboxSelection:true, sortable: false, colSpan: params => (params.data.선택.toString()).search(exp) > 0 ? 7 : 0, cellClass: "grid-cell-centered-and-bold", maxWidth: 150},
            { field: "일시" , sortable: true, minWidth:180},
            { field: "IMEI" , sortable: true, minWidth:200},
            { field: "LTE" , sortable: true, minWidth:180},
            { field: "노선" , sortable: true},
            { field: "차량번호" , sortable: true},
            { field: "객차번호" , sortable: true},
            { field: "ION상태" , sortable: true},
            { field: "공기질" , sortable: true},
            { field: "미세먼지" , sortable: true},
            { field: "초미세먼지" , sortable: true},
            { field: "극초미세먼지" , sortable: true},
            { field: "TVOC" , sortable: true},
            { field: "이산화탄소" , sortable: true},
            { field: "온도" , sortable: true},
            { field: "습도" , sortable: true},
            { field: "비고" , sortable: false, minWidth:350}
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
            paginationPageSize: 100,
            rowSelection: 'multiple',
            suppressRowClickSelection: true,
            onSelectionChanged : event => selectionChanged(event)
            //paginationAutoPageSize: true
        };

        const selectionChanged = (event) => {

            var selectedRowJsonData = gridOptions.api.getSelectedRows();

            if(selectedRowJsonData.length > 0){
                for(var i=0; i<selectedRowJsonData.length; i++){
                    TARGET_ID.push(selectedRowJsonData[i]);
                }

                //평균 다시 산출
                var onIaqTotal = 0;
                var onGp10Total = 0;
                var onGp1_0Total = 0;
                var onGp2_5Total = 0;
                var onTvocTotal = 0;
                var onCo2Total = 0;
                var onTempTotal = 0;
                var onHumiTotal = 0;

                var onCnt = 0;

                for(var i=0; i < selectedRowJsonData.length; i++){
                    onCnt++;
                    onIaqTotal += parseFloat(selectedRowJsonData[i].공기질);
                    onGp10Total += parseFloat(selectedRowJsonData[i].미세먼지);
                    onGp1_0Total += parseFloat(selectedRowJsonData[i].초미세먼지);
                    onGp2_5Total += parseFloat(selectedRowJsonData[i].극초미세먼지);
                    onTvocTotal += parseFloat(selectedRowJsonData[i].TVOC);
                    onCo2Total += parseFloat(selectedRowJsonData[i].이산화탄소);
                    onTempTotal += parseFloat(selectedRowJsonData[i].온도);
                    onHumiTotal += parseFloat(selectedRowJsonData[i].습도);
                }

                var onIaqAvg = (onIaqTotal / onCnt).toFixed(2); if(onCnt == 0){onIaqAvg = 0;}
                var onGp10Avg = (onGp10Total / onCnt).toFixed(2);  if(onCnt == 0){onGp10Avg = 0;}
                var onGp1_0Avg = (onGp1_0Total / onCnt).toFixed(2);  if(onCnt == 0){onGp1_0Avg = 0;}
                var onGp2_5Avg = (onGp2_5Total / onCnt).toFixed(2);  if(onCnt == 0){onGp2_5Avg = 0;}
                var onTvocAvg = (onTvocTotal / onCnt).toFixed(2);  if(onCnt == 0){onTvocAvg = 0;}
                var onCo2Avg = (onCo2Total / onCnt).toFixed(2);  if(onCnt == 0){onCo2Avg = 0;}
                var onTempAvg = (onTempTotal / onCnt).toFixed(2);  if(onCnt == 0){onTempAvg = 0;}
                var onHumiAvg = (onHumiTotal / onCnt).toFixed(2);  if(onCnt == 0){onHumiAvg = 0;}

                SELECTED_IAQ = onIaqAvg;
                SELECTED_GP10 = onGp10Avg;
                SELECTED_GP_1_0 = onGp1_0Avg;
                SELECTED_GP_2_5 = onGp2_5Avg;
                SELECTED_TVOC = onTvocAvg;
                SELECTED_CO2 = onCo2Avg;
                SELECTED_TEMP = onTempAvg;
                SELECTED_HUMI = onHumiAvg;

                gridOptions.api.setPinnedTopRowData([ { 선택: "선택된 로그 평균 값", 일시: "", ION상태: "", 공기질:onIaqAvg, 미세먼지: onGp10Avg, 초미세먼지: onGp1_0Avg, 극초미세먼지:onGp2_5Avg, TVOC:onTvocAvg, 이산화탄소:onCo2Avg, 온도:onTempAvg, 습도:onHumiAvg, 비고:""}]);
            }else{
                SELECTED_IAQ = 0;
                SELECTED_GP10 = 0;
                SELECTED_GP_1_0 = 0;
                SELECTED_GP_2_5 = 0;
                SELECTED_TVOC = 0;
                SELECTED_CO2 = 0;
                SELECTED_TEMP = 0;
                SELECTED_HUMI = 0;
                gridOptions.api.setPinnedTopRowData([ { 선택: "전체 로그 평균 값", 일시: "", ION상태: "", 공기질:RECENT_IAQ, 미세먼지: RECENT_GP10, 초미세먼지: RECENT_GP_1_0, 극초미세먼지:RECENT_GP_2_5, TVOC:RECENT_TVOC, 이산화탄소:RECENT_CO2, 온도:RECENT_TEMP, 습도:RECENT_HUMI, 비고:""}]);
            }

        }

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

            gridOptions.api.setPinnedTopRowData([ { 선택: "전체 로그 평균 값", 일시: "", ION상태: "", 공기질:"0", 미세먼지: "0", 초미세먼지: "0", 극초미세먼지:"0", TVOC:"0", 이산화탄소:"0", 온도:"0", 습도:"0", 비고:""}]);

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

        function setSearchTerm(){
            var nowDate = new Date();
            var prevDate = nowDate.getDate() - 1;

            var nowMonth = nowDate.getMonth()+1;
            var nowDt = nowDate.getDate();
            var nowHours = nowDate.getHours();
            var nowMinutes = nowDate.getMinutes();

            if(nowDate.getMonth()+1 < 10){
                nowMonth = "0" + (nowDate.getMonth()+1);
            }
            if(nowDate.getDate() < 10){
                nowDt = "0" + (nowDate.getDate());
            }
            if(nowDate.getHours() < 10){
                nowHours = "0" + (nowDate.getHours());
            }
            if(nowDate.getMinutes() < 10){
                nowMinutes = "0" + nowDate.getMinutes();
            }

            var initStartDatetime = nowDate.getFullYear() + "-" + nowMonth + "-" + nowDt + " " + "00:00";
            var initEndDatetime = nowDate.getFullYear() + "-" + nowMonth + "-" + nowDt + " " + nowHours + ":" + nowMinutes;

            $('#startDatetime').val(initStartDatetime);
            $('#endDatetime').val(initEndDatetime);
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

        function viewChart(){

            var availWidth = screen.availWidth  // 모니터 화면의 작업 표시줄을 제외한 너비
            var availHeight =  screen.availHeight // 모니터 화면의 작업 표시줄을 제외한 높이

            var popupWidth = 1700;
            var popupHeight = 800;
            var popupX = (window.screen.width / 2) - (popupWidth / 2);
            var popupY= (window.screen.height / 2) - (popupHeight / 2);

            var url = "/graph";
            var name = "그래프";
              var option = "width = "+popupWidth+", height = "+popupHeight+", top = "+popupY+", left = "+popupX+", location = no"
              //window.open(url, name, option);

            var pop_title = "popupOpener" ;

            var popupWindow = window.open(url, pop_title, option) ;

            popupWindow.document.getElementById("imei").value = $("#imei").val();
            popupWindow.document.getElementById("lte").value = $("#lte").val();
            popupWindow.document.getElementById("line").value = $("#line").val();
            popupWindow.document.getElementById("carNum").value = $("#carNum").val();
            popupWindow.document.getElementById("pscarNum").value = $("#pscarNum").val();
            popupWindow.document.getElementById("ionStatus").value = $("#ionStatus").val();
            popupWindow.document.getElementById("startDatetime").value = $("#startDatetime").val();
            popupWindow.document.getElementById("endDatetime").value = $("#endDatetime").val();

            //window.open("test.html","팝업 테스트","width=400, height=300, top=10, left=10");
            /*
            var frmData = document.frmData;
            frmData.target = pop_title;
            frmData.action = "graph";

            frmData.submit() ;
*/

        }

        function initCondition(){
            $('#imei').val("");
            $('#lte').val("");
            $('#carNum').val("");
            $('#pscarNum').val("");
            $('#line').val("");
            $('#ionStatus').val("");
            setSearchTerm();
        }


        function searchData(){
            $("#searchBtn").attr("onclick", "");
            //$("#searchBtn").attr("href", "");
            $("#searchBtn").html("<i class='fas fa-search fa-sm text-white-50'></i>조회중..");
            $("#searchBtn").attr("class", "d-none d-sm-inline-block btn btn-sm btn-secondary shadow-sm");
            var sendData = {"imei":$('#imei').val(),"lte":$('#lte').val(),"carNum":$('#carNum').val(),"pscarNum":$('#pscarNum').val(),"line":$('#line').val(),"ionStatus":$('#ionStatus').val(),"startDatetime":$('#startDatetime').val(),"endDatetime":$('#endDatetime').val()};

            $.ajax({
                url: '/log/data/search',
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
            RECENT_DATA = obj;

            var arrData = [];

            var onIaqTotal = 0;
            var onGp10Total = 0;
            var onGp1_0Total = 0;
            var onGp2_5Total = 0;
            var onTvocTotal = 0;
            var onCo2Total = 0;
            var onTempTotal = 0;
            var onHumiTotal = 0;

            var onCnt = 0;

            if(obj.data.length > 0){

                for(var i=0; i < obj.data.length; i++){
                    var rowData =
                        { 선택:obj.data[i].imd_id, 일시:obj.data[i].imd_regdate,IMEI:obj.data[i].ima_imei,LTE:obj.data[i].ima_lte_s,노선:obj.data[i].ima_line+"호선",차량번호:obj.data[i].ima_car,
                            객차번호:obj.data[i].ima_ps_car,ION상태:obj.data[i].ima_ion_status,공기질:obj.data[i].imd_iaq,미세먼지:obj.data[i].imd_gp10,초미세먼지:obj.data[i].imd_gp1_0,
                            극초미세먼지:obj.data[i].imd_gp2_5,TVOC:obj.data[i].imd_voc,이산화탄소:obj.data[i].imd_co2,온도:obj.data[i].imd_temp,습도:obj.data[i].imd_humi,비고:obj.data[i].imd_etc};

                    arrData.push(rowData);


                    //if(obj.data[i].imd_system_status == 'ON'){     //시스템 상태는 없으므로 on/off관계없이 전체의 평균
                    onCnt++;
                    onIaqTotal += parseFloat(obj.data[i].imd_iaq);
                    onGp10Total += parseFloat(obj.data[i].imd_gp10);
                    onGp1_0Total += parseFloat(obj.data[i].imd_gp1_0);
                    onGp2_5Total += parseFloat(obj.data[i].imd_gp2_5);
                    onTvocTotal += parseFloat(obj.data[i].imd_voc);
                    onCo2Total += parseFloat(obj.data[i].imd_co2);
                    onTempTotal += parseFloat(obj.data[i].imd_temp);
                    onHumiTotal += parseFloat(obj.data[i].imd_humi);
                    //}
                }

                var onIaqAvg = (onIaqTotal / onCnt).toFixed(2);
                var onGp10Avg = (onGp10Total / onCnt).toFixed(2);
                var onGp1_0Avg = (onGp1_0Total / onCnt).toFixed(2);
                var onGp2_5Avg = (onGp2_5Total / onCnt).toFixed(2);
                var onTvocAvg = (onTvocTotal / onCnt).toFixed(2);
                var onCo2Avg = (onCo2Total / onCnt).toFixed(2);
                var onTempAvg = (onTempTotal / onCnt).toFixed(2);
                var onHumiAvg = (onHumiTotal / onCnt).toFixed(2);

            }else{
                var onIaqAvg = 0;
                var onGp10Avg = 0;
                var onGp1_0Avg = 0;
                var onGp2_5Avg = 0;
                var onTvocAvg = 0;
                var onCo2Avg = 0;
                var onTempAvg = 0;
                var onHumiAvg = 0;
            }


            // ROW 선택 후 선택 해제 시 복원을 위해 전역변수로 값 복사
            RECENT_IAQ = onIaqAvg;
            RECENT_GP10 = onGp10Avg;
            RECENT_GP_1_0 = onGp1_0Avg;
            RECENT_GP_2_5 = onGp2_5Avg;
            RECENT_TVOC = onTvocAvg;
            RECENT_CO2 = onCo2Avg;
            RECENT_TEMP = onTempAvg;
            RECENT_HUMI = onHumiAvg;

            gridOptions.api.setRowData(arrData );

            gridOptions.api.setPinnedTopRowData([ { 선택: "전체 로그 평균 값", 일시: "", ION상태: "", 공기질:onIaqAvg, 미세먼지: onGp10Avg, 초미세먼지: onGp1_0Avg, 극초미세먼지:onGp2_5Avg, TVOC:onTvocAvg, 이산화탄소:onCo2Avg, 온도:onTempAvg, 습도:onHumiAvg, 비고:""}]);

            $("#searchBtn").attr("onclick", "searchData()");
            //$("#searchBtn").attr("href", "#");
            $("#searchBtn").html("<i class='fas fa-search fa-sm text-white-50'></i>조회");
            $("#searchBtn").attr("class", "d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm");
        }

        function dataRemove(){
            var selectedRowJsonData = gridOptions.api.getSelectedRows();
            //alert(selectedRowJsonData[0].선택);
            if(selectedRowJsonData.length < 1){
                alert("삭제할 로그를 선택해 주세요.");
            }else{
                if(confirm("선택된 " + selectedRowJsonData.length + "개의 로그를 삭제할까요?") == true){


                    var imdIds = [];
                    for(var i=0; i<selectedRowJsonData.length; i++){
                        imdIds.push(selectedRowJsonData[i].선택);
                    }
                    var sendData = {"imdIds":imdIds};

                    $.ajax({
                        url: '/log/data/remove',
                        method: 'POST',
                        async: true,
                        data: JSON.stringify(sendData),
                        contentType: 'application/json; charset=UTF-8',
                        dataType: 'text',
                        success: function (result) {
                            var obj = JSON.parse(result);
                            removeCallback(obj);
                        },
                        error: function (error) {
                            alert("데이터 삭제 중 오류가 발생했습니다 : " + error);
                        }
                    });

                }
            }


        }

        function removeCallback(obj){
            if(obj.data == "success"){
                alert("삭제를 완료하였습니다.\n로그 데이터를 갱신합니다.");
                gridOptions.api.setRowData();
                gridOptions.api.setPinnedTopRowData([ { 선택: "전체 로그 평균 값", 일시: "", ION상태: "", 공기질:0, 미세먼지: 0, 초미세먼지: 0, 극초미세먼지:0, TVOC:0, 이산화탄소:0, 온도:0, 습도:0, 비고:""}]);
                searchData();
            }else{
                alert("삭제에 실패하였습니다.");
            }
        }

        function dataDownload(){
            var selectedRowJsonData = gridOptions.api.getSelectedRows();

            if(selectedRowJsonData.length < 1){
                alert("다운로드할 로그를 선택해 주세요.");
            }else{

                var csv = [];
                var rowData = [];
                var avgData = [];

                //2) 컬럼명 row 추가
                rowData.push("로그 ID", "일시", "IMEI", "LTE", "노선", "차량번호", "객차번호", "ION상태", "공기질", "미세먼지", "초미세먼지", "극초미세먼지", "TVOC", "이산화탄소", "온도","습도");
                csv.push(rowData.join(","));

                //3) 데이터 row 추가
                for(var i=0; i<selectedRowJsonData.length; i++) {
                    rowData = [selectedRowJsonData[i].선택, selectedRowJsonData[i].일시, "'" + selectedRowJsonData[i].IMEI, selectedRowJsonData[i].LTE, selectedRowJsonData[i].노선, selectedRowJsonData[i].차량번호, selectedRowJsonData[i].객차번호,
                        selectedRowJsonData[i].ION상태, selectedRowJsonData[i].공기질, selectedRowJsonData[i].미세먼지, selectedRowJsonData[i].초미세먼지, selectedRowJsonData[i].극초미세먼지, selectedRowJsonData[i].TVOC, selectedRowJsonData[i].이산화탄소, selectedRowJsonData[i].온도, selectedRowJsonData[i].습도
                    ];
                    csv.push(rowData.join(","));
                }

                avgData.push("평균 산출 값", "-", "-", "-", "-", "-", "-", "-", SELECTED_IAQ, SELECTED_GP10, SELECTED_GP_1_0, SELECTED_GP_2_5, SELECTED_TVOC, SELECTED_CO2, SELECTED_TEMP,SELECTED_HUMI);
                csv.push(avgData.join(","));

                var filename = curDateTime+"_log_data.csv";
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
                <i class="fas fa-fw fa-laptop"></i>
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
        <div id="content" style="background-image:url('/resources/img/main-bg.gif');background-repeat:repeat;">
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
                                <form name="frmData" id="frmData" method="post">
                                        <div style="padding:15px;">
                                            IMEI　
                                            <input id="imei" type="number" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="padding-left:5px;padding-top:5px;font-weight:bold;width:200px;height:30px;border:1px solid #babfc7;" ></input>
                                            LTE#
                                            <input id="lte" type="text" onKeyup="this.value=this.value.replace(/[^-\-0-9]/g,'');" style="padding-left:5px;padding-top:5px;font-weight:bold;width:200px;height:30px;border:1px solid #babfc7;" ></input>
                                            노선
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
                                            차량번호
                                            <input id="carNum" type="number" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                            객차번호
                                            <input id="pscarNum" type="number" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:100px;height:30px;border:1px solid #babfc7;"></input>
                                            ION 상태
                                            <select id="ionStatus" type="text" style="width:100px;height:30px;border:1px solid #babfc7;">
                                                <option value="" selected>전체</option>
                                                <option value="ON">ON</option>
                                                <option value="OFF">OFF</option>
                                            </select>
                                        </div>
                                        <div style="padding-left:15px;padding-right:15px;padding-bottom:15px;">
                                            조회기간
                                            <input id="startDatetime" type="text" style="width:150px;">
                                            ~
                                            <input id="endDatetime" type="text" style="width:150px;">
                                            한 페이지 당 데이터 수
                                            <select onchange="onPageSizeChanged()" id="page-size" style="width:100px;height:30px;border:1px solid #babfc7;">
                                                <option value="10">10</option>
                                                <option value="100">100</option>
                                                <option value="500">500</option>
                                                <option value="1000">1000</option>
                                                <option value="10000" selected>10000</option>
                                            </select>
                                            <a href="#" onclick="searchData()" id="searchBtn" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="margin-left:20px;"><i
                                                    class="fas fa-search fa-sm text-white-50"></i>조회</a>
                                            <a href="#" onclick="initCondition()" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                                    class="fas fa-history fa-sm text-white-50"></i> 조건 초기화</a>
                                            <a id="controlView" onclick="addBottomGridArea()" href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                                    class="fas fa-sm text-white-50"></i>+화면 확장</a>
                                            <a href="#" onclick="viewChart();" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i
                                                    class="fas fa-sm fa-file text-white-50"></i> 그래프 조회</a>
                                            <a href="#" onclick="dataDownload();" class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm"><i
                                                    class="fas fa-download fa-sm text-white-50"></i> 다운로드</a>
                                            <a href="#" onclick="dataRemove();" class="d-none d-sm-inline-block btn btn-sm btn-danger shadow-sm"><i
                                                    class="fas fa-trash fa-sm text-white-50"></i> 삭제</a>
                                        </div>
                                </form>
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
                    <a class="btn btn-primary" href="#"  onclick="goLogin()">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    $('#startDatetime').datetimepicker();
    $('#endDatetime').datetimepicker();

    jQuery('#startDatetime').datetimepicker({
        datepicker:true,
        format:'Y-m-d H:i'
    });

    jQuery('#endDatetime').datetimepicker({
        datepicker:true,
        format:'Y-m-d H:i'
    });

</script>
</body>
</html>