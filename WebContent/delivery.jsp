<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "db.*" %>
<%@ include file = "header.jsp" %>
    <%
    mname = (String)session.getAttribute("mname");

	if (mname == null) {
		out.println("<script>alert('로그인이 필요합니다.');</script>");
		out.println("<script>location.href='login.jsp'</script>");
	}
%>  
    
    <% 
    
    
    String pid = request.getParameter("pid");
	String mno = request.getParameter("mno");
	
	
	DTOmember member = DAOmember.memberDetail(mno);
	DTOproduct product = DAOproduct.productDetail(pid);
    
    
    %>
    
    <%
    
    String dpid = product.getPid(); 
    String dmid = member.getMno(); 
    String dmaddr = member.getMaddr(); 	
    String dmtel = member.getMtel(); 
    String dpname = product.getPname(); 
    String dpprice = product.getPprice(); 
    
    DAOdelivery.deliveryinsert(dpid, dmid, dmaddr, dmtel, dpname, dpprice);
    
    %>
    
    
  
    