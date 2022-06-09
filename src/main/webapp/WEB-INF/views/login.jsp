<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
    <style>

    body{
         -webkit-font-smoothing: antialiased;
    }

    body, input, button, textarea, select{
        font-family:"Apple SD Gothic Neo", "Malgun Gothic", "맑은 고딕", sans-serif;
    }
    #login{
        position:absolute;
        margin:-150px 0px 0px -200px;
        top:50%;
        left:50%;
        padding:5px;
        width:450px;
    }

    #id, #password{
        margin-top:5px;
        margin-bottom:5px;
        width:260px;
        height : 25px;
        border:1px solid #d6dee4;
        background: #fff;
    }

    .btn_submit{
         height:30px;
         width: 60px;
         float:right;
         margin-right:115px;
         margin-top:10px;
         cursor: pointer;
         font-size:13px;
         border:1px solid #d6dee4;
         background: #fff;
    }

    .btn_submit:hover{
         height:30px;
         width: 60px;
         float:right;
         margin-right:115px;
         margin-top:10px;
         cursor: pointer;
         font-size:13px;
         border:1px solid #d6dee4;
         background: #d6dee4;
    }

    #login_set{
        border: 0px;
        height:150px;
        padding-left:10px;
        padding-top:10px;
        padding-right:10px;
        padding-bottom:40px;
        font-size:13px;
    }

    #logo_set{
        background-color:#3a444a;
        width:330px;
        height:40px;
        text-align:center;
        padding-top:15px;
    }
    #lbl_pw, #lbl_id{
        font-size:13px;
    }

    </style>
    </head>
    <body>
    <%
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader("Expires",0);
        if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
    %>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
                alert("아이디 입력해주세요");
            return;
            }

            if(password.trim() == ""){
                alert("비밀번호를 입력해주세요");
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
                    }
                },
                error:function(error){
                      alert("오류가 발생했습니다 : "+error);
                      $('input[name="id"]').focus();
                  }

            })
        }

        function callback(result){

            var form = document.createElement("form");
            var formData = $('form').serialize();
            form.setAttribute("method", "POST");
            form.setAttribute("action", "/");
            document.body.appendChild(form);
            form.submit();

        }
    </script>
        <div id="login">
            <div id="logo_set">
                <img src="/resources/img/login_logo2.png"></img>
            </div>
            <div id="login_set">
                <label for="id" id="lbl_id" class="id">아이디　</label>
                <input type="text" name="id" id="id" size="20" maxLength="20"><br>
                <label for="password" id="lbl_pw" class="pw">비밀번호</label>
                <input type="password" name="password" id="password" size="20" maxLength="20">
                <button name="btn_submit" id="btn_submit" onclick="login()" class="btn_submit">로그인</button>
            </div>
        </div>
    </body>
</html>