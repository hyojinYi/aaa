<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "qna.QnaDAO" %>
<%@ page import = "qna.Qna" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%
   		String userID = null;	// 로그인 된 사람은 회원가입페이지에 들어갈수 없다
    	if(session.getAttribute("userID") != null ) {
        userID = (String) session.getAttribute("userID");
    	}
    	if(userID == null)
    	{
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
        } else{
    		if(request.getParameter("qnaTitle") == null || request.getParameter("qnaContent") == null
    				|| request.getParameter("qnaTitle").equals("") || request.getParameter("qnaContent").equals("")) {
    				PrintWriter script = response.getWriter();
    				script.println("<script>");
    				script.println("alert('입력이 안 된 사항이 있습니다.')");
    				script.println("history.back()");
    				script.println("</script>");
    			} else{
    				QnaDAO qnaDAO = new QnaDAO();
    	        	int result = qnaDAO.update(qnaID, request.getParameter("qnaTitle"), request.getParameter("qnaContent"));
    	        	if(result == -1){
    	            PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
    	            script.println("<script>");
    	            script.println("alert('글 수정에 실패했습니다.')");
    	            script.println("history.back()");
    	            script.println("</script>");
    	        }
    	        else {
    	            PrintWriter script = response.getWriter();
    	            script.println("<script>");
    	            script.println("location.href = 'qna.jsp'");
    	            script.println("</script>");
    	        }
    		}
    	}
    	
    %>
</body>
</html> 