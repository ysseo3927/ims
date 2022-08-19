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

    <title>이오나이저 모니터링 시스템 | 로그인</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" sizes="192x192"  href="/resources/img/ms-icon-70x70.png">
</head>

<body class="bg-gradient-primary">
<%
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires",0);
    if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
    <div class="container">

        <!-- Outer Row -->
        <br><br><br><br><br>
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">로그인</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="id" placeholder="아이디">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="password" placeholder="비밀번호">
                                        </div>

                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <!--
                                                <label class="custom-control-label" for="customCheck">아이디 기억하기</label>
                                                                                         -->
                                            </div>
                                        </div>

                                        <hr>
                                        <a onclick="login()" class="btn btn-primary btn-user btn-block">
                                            로그인
                                        </a>

                                        <!--
                                        <a href="index.jsp" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                        <a href="index.jsp" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a>
                                        -->
                                    </form>
                                    <!--
                                    <div class="text-center">
                                       <a class="small" href="register.html">비밀번호를 잊으셨나요?</a>
                                    </div>
                                    <div class="text-center">
                                         <a class="small" href="forgot-password.html">회원가입</a>
                                    </div>
                                     -->
                                </div>
                            </div>
                        </div>
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
    <script>


        $(document).ready(function(){
            $('input[name="id"]').focus();
        });

        $(document).keyup(function(e) {
            // focus 되고 enter눌렀을 경우
            if ($("#password").is(":focus") && e.key == "Enter") {
                login();
            }
        });

        function login() {

            var id = $("#id").val();
            var password = $("#password").val();
            if(id.trim() == ""){
                alert("아이디를 입력해주세요");
                return;
            }

            if(password.trim() == ""){
                alert("비밀번호를 입력해주세요");
                return;
            }
            var sendData = {"id":id,"password":password}

            $.ajax({
                url:'/login/check',
                method : 'POST',
                data: JSON.stringify(sendData),
                contentType : 'application/json; charset=UTF-8',
                dataType : 'text',
                success :function(result){
                    var obj = JSON.parse(result);
                    var resultValue = obj.result;

                    if(resultValue =="success"){
                        callback(result);

                    }else{
                        alert("아이디 또는 비밀번호를 확인해주세요");
                        $('input[name="id"]').focus();
                        return;
                    }
                },
                error:function(error){
                    alert("오류가 발생했습니다 : "+error);
                    $('input[name="id"]').focus();
                    return;
                }

            })
        }

        function callback(result) {

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/index");
            document.body.appendChild(form);
            form.submit();
        }

    </script>
</body>

</html>