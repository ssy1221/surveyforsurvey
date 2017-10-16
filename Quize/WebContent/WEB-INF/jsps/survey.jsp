<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "root";
	String pass = "1234";
	int total = 0;
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM survey";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		System.out.println("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT SEQ, USERNAME, SURVEY_TITLE from survey order by SEQ DESC";
		rs = stmt.executeQuery(sqlList);
%>


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
<title>SFS-Survey</title>
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
		<div class="header">
		<h3>Survey List</h3>
		</div>

		<div class="surveyli">
		  <table width="100%" cellpadding="0" cellspacing="0" border="0">
		  <tr height="5"><td width="5"></td></tr>
		  <tr> 
		  	<td width="63">번호</td>
		   	<td width="379">제목</td>
		   	<td width="73">작성자</td>
		 </tr>
		 	<% if(total==0){ %>
		 		<tr align="center" bgcolor="#2ecc71" height="30">
		 		<td colspan="6">등록된 글이 없습니다.</td>
		 		</tr>
		 	<%} else{
		 		while(rs.next()){
		 			int index = rs.getInt(1);
		 			String name = rs.getString(2); 
		 			String title = rs.getString(3);%>
			<tr height="25" align="center">
				<td><%=index %></td>
				<td align="left"><a href='${pageContext.request.contextPath}/surveyview?index=<%=index%>'><%=title %></a></td>
				<td align="center"><%=name %></td>
				<td>&nbsp;</td>
			</tr>
			  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
			  <% 
						}
					} 
					rs.close();
					stmt.close();
					conn.close();
				} catch(SQLException e) {
					out.println( e.toString() );
				}
			 %>
			 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
			 </table>
			 
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
			  <tr><td colspan="4" height="5"></td></tr>
			  <tr align="center">
			   <td><input type=button value="home"></td>
			  </tr>
			</table>

		</div>
</div>

</body>
</html>