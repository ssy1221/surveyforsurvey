<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "root";
	String pass = "1234";
	int index = Integer.parseInt(request.getParameter("index"));
	//int pg = Integer.parseInt(request.getParameter("pg"));
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT s.SURVEY_TITLE, s.USERNAME, s.st1, s.st2, s.st3, s.st4, s.st5, a.an1, a.an2, a.an3, a.an4, a.an5 "+
					"FROM survey s, answer a WHERE s.username=a.username and s.SEQ=" + index;
		ResultSet rs = stmt.executeQuery(sql);
		 if(rs.next()){
				String title = rs.getString(1);
				String name = rs.getString(2);
				String question1 = rs.getString(3);
				String question2 = rs.getString(4);
				String question3 = rs.getString(5);
				String question4 = rs.getString(6);
				String question5 = rs.getString(7);
		
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
<title>SFS-SurveyView</title>
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
   <form name = "survey-view" class="survey-view" action="view" method="post">
      <div class="header">      </div>
      <div class="surveyInsert">
        <table>
		  <tr>
		   <td>
		    <table width="100%" cellpadding="0" cellspacing="0" border="0">
           <tr>
            <td width="5"></td>
            <td>결 과</td>
            <td width="5"></td>
           </tr>
          </table>
         <table width=413>
           <tr>
            <td width="0">&nbsp;</td>
            <td align="center" width=76>글번호</td>
            <td width=319 colspan=2><%=index%></td>
           </tr>
          <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
          <tr>
            <td width="0">&nbsp;</td>
            <td align="center" width=76>이름</td>
            <td width=319 colspan=2><%=name%></td>
           </tr>
            <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
          <tr>
            <td width="0">&nbsp;</td>
            <td align="center" width=76>제목</td>
            <td width=319 colspan=2><%=title%></td>
          </tr>
          <%--질문&답 --%>
			<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		   <tr>
			  <td width="0"></td>
			  <td width="399" colspan="2" height="50">질문 </td>
			  <td width="0"></td>
              <td width="399" colspan="2" height="50"><%=question1 %>
              <td width="0"></td>
              <td width="399" colspan="2" height="50"><%=question2 %>
              <td width="0"></td>
              <td width="399" colspan="2" height="50"><%=question3 %>
              <td width="0"></td>
              <td width="399" colspan="2" height="50"><%=question4 %>
              <td width="0"></td>
              <td width="399" colspan="2" height="50"><%=question5 %>
              <td width="399" colspan="2" height="50"></td>
              </tr>
          <% while(rs.next()){
                   String answer1 = rs.getString(8);
                    String answer2 = rs.getString(9);
                    String answer3 = rs.getString(10);
                    String answer4 = rs.getString(11);
                    String answer5 = rs.getString(12);  %>
         	<tr>
              <td width="0"></td>
              <td width="399" colspan="2" height="50">답변</td>
              <td width="0"></td>
              <td width="399" colspan="2" height="50"><%=answer1 %>
              <td width="0"></td>
              <td width="399" colspan="2" height="50"><%=answer2 %>
              <td width="0"></td>
              <td width="399" colspan="2" height="50"><%=answer3 %>
              <td width="0"></td>
              <td width="399" colspan="2" height="50"><%=answer4 %>
              <td width="0"></td>
              <td width="399" colspan="2" height="50"><%=answer5 %>
              <td width="399" colspan="2" height="50">
	       </tr>
			<%  }
			 	rs.close();
			 	stmt.close();
			 	conn.close();
				 	} 
				}catch(SQLException e) {
			}
			%>
			
		     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
		     <tr align="center">
		      <td width="0">&nbsp;</td>
		      <td colspan="2" width="399">
		      <input type=button value="답변작성"  OnClick="window.location='surveyview.jsp'">
			  <input type=button value="목록" OnClick="window.location='survey.jsp'">
			
<%-- 			<input type=button value="수정" OnClick="window.location='modify.jsp?idx=<%=index%>&pg=<%=pg%>'"> --%>
<%-- 			<input type=button value="삭제" OnClick="window.location='delete.jsp?idx=<%=index%>&pg=<%=pg%>'"> --%>
		      <td width="0">&nbsp;</td>
		     </tr>
		  </table>
		  </td>
		  </tr>
		  </table>
      </div>
   </form>
</div>

</body>
</html>