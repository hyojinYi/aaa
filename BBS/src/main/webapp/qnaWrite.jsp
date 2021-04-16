<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
	<div class="container">
        <div class="row">
       		<form method="post" action="qnaWriteAction.jsp">
        		<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
            	    <thead>
             	       <tr>
             	           <th colspan="2" style="background-color:#eeeeee; text-align:center;">Q&A 글쓰기 양식</th>
                	    </tr>
              	  	</thead>
               	 	<tbody>
               	     <tr>
                	    <td><input type="text" class="form-control" placeholder="글 제목"  name="qnaTitle" maxlength="50" ></td>
                	  </tr>
                	  <tr>
                	    <td><textarea class="form-control" placeholder="글 내용"  name="qnaContent" maxlength="2048" style="height:350px" ></textarea></td>
                	  </tr>
               	 	</tbody>
           	 	</table>
           	 	<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
       		</form>
        </div>
    </div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 