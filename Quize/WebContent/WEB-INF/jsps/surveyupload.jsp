<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/images/background.jpg");
}
.button {
	padding: 10px 15px;
	font-size: 14px;
	line-height: 100%;
	text-shadow: 0 1px rgba(0, 0, 0, 0.4);
	color: #fff;
	
	vertical-align: middle;
	text-align: center;
	cursor: pointer;
	font-weight: bold;
	transition: background 0.1s ease-in-out;
	-webkit-transition: background 0.1s ease-in-out;
	-moz-transition: background 0.1s ease-in-out;
	-ms-transition: background 0.1s ease-in-out;
	-o-transition: background 0.1s ease-in-out;
	text-shadow: 0 1px rgba(0, 0, 0, 0.3);
	color: #fff;
	-webkit-border-radius: 40px;
	-moz-border-radius: 40px;
	border-radius: 40px;
	font-family: 'Helvetica Neue', Helvetica, sans-serif;
}

.button, .button:hover, .button:active {
	outline: 0 none;
	text-decoration: none;
        color: #fff;
}

.username {
	background-color: #2ecc71;
	box-shadow: 0px 3px 0px 0px #239a55;
}

</style>
<title>SFS-Survey Upload</title>
</head>
<body>
<div id='cssmenu'>
<ul>
   <li class=''><a href='${pageContext.request.contextPath}'><span>Home</span></a></li>
   <li><a href='${pageContext.request.contextPath}/login'><span>Login</span></a></li>
   <li><a href='${pageContext.request.contextPath}/register'><span>Register</span></a></li>
   <li><a href='${pageContext.request.contextPath}/survey'><span>Survey</span></a></li>
   <li><a href='${pageContext.request.contextPath}/surveyupload'><span>Survey Upload</span></a></li>
   <li><a href='${pageContext.request.contextPath}/surveyresultList'><span>Survey Result</span></a></li>
   <li><a href='${pageContext.request.contextPath}/paper'><span>Paper</span></a></li>
   <li><a href='${pageContext.request.contextPath}/contact'><span>Contact us</span></a></li>
</ul>
</div>
<div id = "wrapper">
	<form name = "survey-form" class="survey-form" action="upload" method="post">
		<div class="header">
		<h1>this page is upload your page</h1>
		</div>

		<div class="surveyUp">
		   설문조사 제목<input type="text" class="st" name="survey_title"/><br>
		   1번<input type="text" class="st1" name="st1"/><br>
		   2번<input type="text" class="st2" name="st2"/><br>
		   3번<input type="text" class="st3" name="st3"/><br>
		   4번<input type="text" class="st4" name="st4"/><br>
		   5번<input type="text" class="st5" name="st5"/><br>
		 
		   <input type="submit" class="button" name="submit" value="Upload" class="upload" />
		</div>
	</form>
</div>
</body>
</html>