<%@page import="java.time.LocalDate"%>
<%@page import="db.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file = "header.jsp" %>
    <%
     mname = (String)session.getAttribute("mname");

	if (mname == null) {
		out.println("<script>alert('로그인이 필요합니다.');</script>");
		out.println("<script>location.href='login.jsp'</script>");
	}
%>  
</head>
<body>
  
<div class="alert alert-secondary" role="alert">
<div class="container">
	<h1 class = "display-3">제품 구매</h1>
</div>	
</div>

<%
	String pid = request.getParameter("pid");
	String pname = request.getParameter("pname");
	String pprice = request.getParameter("pprice");
	
	DTOmember member = DAOmember.memberDetail2(mname);
%>

<div class="container text-center">
<div class="row justify-content-between">
<div class="col-4" align="left">
<strong>배송주소</strong><br>
성명(아이디) : <%=member.getMname() %><br>
주소 : <%=member.getMaddr() %><br>
전화번호 : <%=member.getMtel() %><br>
</div>
<div class="col-4" align="right">
<p><em>주문일 :<%=LocalDate.now() %> <br></em>
</div>
</div>

<br><br>

<div>
<table>
	<tr>
	<th class="text-center">제품명</th> 
	<th class="text-center">제품가격</th> 
	</tr>
	<tr>
	<td class="text-center"><%=pname %></td>
	<td class="text-center"><%=pprice %>원</td>
</table>

<div class="col-4" align="left">
 <%=mname %> 님 정말 구매하시겠습니까?
</div>


	<div class="form-group row">
		<label class="col-sm-2 d-flex justify-content-end"></label>
		<div class="col-sm-7 ">
			<a href="productlist.jsp" class="btn btn-secondary" role="button">취소 &raquo;</a>		
			<a href="delivery.jsp?pid=<%=pid %>&mno=<%=member.getMno() %>" class="btn btn-danger" role="button">주문완료 &raquo;</a>		
		</div>	
	</div>
</div>	

	</div>
<%@ include file = "footer.jsp" %>

</body>
</html>