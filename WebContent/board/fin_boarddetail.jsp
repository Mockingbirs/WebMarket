
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<%
	String no = request.getParameter("no");

	DTOboard file = DAOboard.fileDetail(no);
	
	String img = file.getIname();
	String imgstr = "";
	if(img !=null) {
		imgstr = "../images/" + img;
	}

%>
<img src = "<%=imgstr %>">
	<br>
<a href="fin_boardlist.jsp"><input type="button"  value="목록으로"></a>
	
	<%@ include file="../footer.jsp" %>
</body>
</html>
