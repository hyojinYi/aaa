<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="qna.QnaDAO" %>
<%@ page import="qna.Qna" %>
<%@ page import="java.util.ArrayList" %>
<% session.setAttribute("isActive", "qnaActive"); %>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
<style type = "text/css">
    a, a:hover
    {
        color: #000000;
        text-decoration: none;
    }
</style>
</head>
<body>
	<%
    	int pageNumber = 1; 
        if (request.getParameter("pageNumber") != null)
        {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
	%>
	<div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th style="background-color:#eeeeee; text-align:center;">번호</th>
                        <th style="background-color:#eeeeee; text-align:center;">제목</th>
                        <th style="background-color:#eeeeee; text-align:center;">작성자</th>
                        <th style="background-color:#eeeeee; text-align:center;">작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<%
                		QnaDAO qnaDAO = new QnaDAO();
                    	ArrayList<Qna> list = qnaDAO.getList(pageNumber);
                    	for(int i = 0; i < list.size(); i++){
                    %>
                    <tr>
                        <td><%=list.get(i).getQnaID() %></td>
                        <td><a href="qnaView.jsp?qnaID=<%=list.get(i).getQnaID()%>"><%=list.get(i).getQnaTitle() %></a></td>
                        <td><%=list.get(i).getUserID() %></td>
                        <td><%=list.get(i).getQnaDate().substring(0,11) + list.get(i).getQnaDate().substring(11, 13) + "시" + list.get(i).getQnaDate().substring(14,16) + "분" %></td>
                    </tr>
                    <%
                    	}
                	%>
                </tbody>
            </table>
            <%
                if(pageNumber != 1) {
            %>
                <a href="qna.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
            <%
                } if (qnaDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="qna.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
            <%
                }
            %>
            <a href="qnaWrite.jsp" class="btn btn-primary pull-right">글쓰기</a>
        </div>
    </div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html> 