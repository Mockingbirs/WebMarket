
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "db.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp" %>
<%
mname = (String)session.getAttribute("mname"); 

if(mname == null){
	out.println("<script>alert('로그인이 필요합니다.');</script>");
	out.println("<script>location.href='login.jsp'</script>");
}

%>
</head>
<body>

<% 


	String no = request.getParameter("no");

	DTOboard file = DAOboard.fileDetail(no);
	

	

%>

<%=file.getContent() %>
	<br>
<a href="boardlist.jsp"><input type="button"  value="목록으로"></a>

<a href="boardedit.jsp?bid=<%=file.getBid() %>"><input  name= "bid" type="button"  value="수정">


 

</a>

	<%@ include file="../footer.jsp" %>
</body>
</html>
