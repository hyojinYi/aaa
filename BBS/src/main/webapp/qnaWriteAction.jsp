<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "qna.QnaDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="qna" class="qna.Qna" scope="page"/>
<jsp:setProperty name="qna" property="qnaTitle"/>
<jsp:setProperty name="qna" property="qnaContent"/>


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
    	} else{
    		if(qna.getQnaTitle() == null || qna.getQnaContent() == null) {
    				PrintWriter script = response.getWriter();
    				script.println("<script>");
    				script.println("alert('입력이 안된 사항이 있습니다.')");
    				script.println("history.back()");
    				script.println("</script>");
    			} else{
    				QnaDAO qnaDAO = new QnaDAO();
    	        	int result = qnaDAO.write(qna.getQnaTitle(),userID,qna.getQnaContent());
    	        	if(result == -1){
    	            PrintWriter script = response.getWriter(); //하나의 스크립트 문장을 넣을 수 있도록.
    	            script.println("<script>");
    	            script.println("alert('글쓰기에 실패했습니다.')");
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