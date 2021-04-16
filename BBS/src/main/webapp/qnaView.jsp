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
<meta name="viewport" content="width=device-width", initial-scale="1" >  
<link rel="stylesheet" href="css/bootstrap.css"> 
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
    int qnaID = 0;
    if (request.getParameter("qnaID") != null)
    {
        qnaID = Integer.parseInt(request.getParameter("qnaID"));
    }
    if (qnaID == 0)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다')");
        script.println("location.href = 'qna.jsp'");
        script.println("</script>");
    }
    Qna qna = new QnaDAO().getQna(qnaID);
%>
    <div class="container">
        <div class="row">
        <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
            	    <thead>
             	       <tr>
             	           <th colspan="3" style="background-color:#eeeeee; text-align:center;">Q&A 글 보기</th>
                	    </tr>
              	  	</thead>
               	 	<tbody>
               	    	<tr>
                        <td style="width:20%;">글 제목</td>
                        <td colspan="2"><%= qna.getQnaTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan="2"><%= qna.getUserID().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>
                    </tr>
                    <tr>
                        <td>작성일자</td>
                        <td colspan="2"><%= qna.getQnaDate().substring(0,11) + qna.getQnaDate().substring(11, 13) + "시" 
                                + qna.getQnaDate().substring(14,16) + "분"  %></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td colspan="2" style="min-height:200px; text-align:left;"><%= qna.getQnaContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>    
                    </tr>
                </tbody>
            </table>
            <a href="qna.jsp" class="btn btn-primary">목록</a>
            <%
                if(userID != null && userID.equals(qna.getUserID()))
                {
             %>
             	<a href="qnaUpdate.jsp?qnaID=<%=qnaID %>" class="btn btn-primary">수정</a>
                <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="qnaDeleteAction.jsp?qnaID=<%=qnaID %>" class="btn btn-primary">삭제</a>
                <%
                	}
           		 %>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>