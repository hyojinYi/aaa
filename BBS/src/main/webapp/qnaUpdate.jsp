<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="qna.Qna" %>
<%@ page import="qna.QnaDAO" %>
<% session.setAttribute("isActive", "qnaActive"); %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
    	if (userID == null){
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
    	}
    	int qnaID = 0;
        if (request.getParameter("qnaID") != null){
            qnaID = Integer.parseInt(request.getParameter("qnaID"));
        }
        if (qnaID == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다')");
            script.println("location.href = 'qna.jsp'");
            script.println("</script>");
        }
        Qna qna = new QnaDAO().getQna(qnaID);
        if (!userID.equals(qna.getUserID())) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다')");
            script.println("location.href = 'qna.jsp'");
            script.println("</script>");
        }
	%>
	<div class="container">
        <div class="row">
       		<form method="post" action="qnaUpdateAction.jsp?qnaID=<%= qnaID %>">
        		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
            	    <thead>
             	       <tr>
             	           <th colspan="2" style="background-color:#eeeeee; text-align:center;">Q&A 글 수정 양식</th>
                	    </tr>
              	  	</thead>
               	 	<tbody>
               	     <tr>
                	    <td><input type="text" class="form-control" placeholder="글 제목"  name="qnaTitle" maxlength="50" value="<%= qna.getQnaTitle() %>"></td>
                	  </tr>
                	  <tr>
                	    <td><textarea class="form-control" placeholder="글 내용"  name="qnaContent" maxlength="2048" style="height:350px;"><%= qna.getQnaContent() %></textarea></td>
                	  </tr>
               	 	</tbody>
           	 	</table>
           	 	<input type="submit" class="btn btn-primary pull-right" value="글수정">
       		</form>
        </div>
    </div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 