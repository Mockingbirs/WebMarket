<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%@ page import="java.sql.*" %>
       <%@ page import="member.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <% 
	
 
 	
 
    
	Connection conn =null;
  conn = member.getConnection();
  
  //4. Statement Object
  PreparedStatement pstmt = null;  //구문객체 초기화
    
    
    String sql = "SELECT * FROM member";
    
    pstmt = conn.prepareStatement(sql);
    
    ResultSet rset = null; //결과
    
    rset = pstmt.executeQuery();
    
    %>
    

    <div class="container text-center">
    <div class="alert alert-primary"  role="alert" >
 회원 정보 조회
</div>
   
    <div class="container">
    <table class="table table-hover">
<thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">멤버이름</th>
      <th scope="col">전화번호</th>
      <th scope="col">멤버등급</th>
      <th scope="col">가입날짜</th>
    </tr>
  </thead>
  
  <%
 
  
  while(rset.next()){
	  String mno = rset.getString("mno");
	  String mname = rset.getString("mname");
	  String mtel = rset.getString("mtel");
	  String mlevel = rset.getString("mlevel");
	  String mdate = rset.getString("mdate");
 
  
  %>
  <tbody>
    <tr>
      <th scope="row"><%=mno%></th> 
      <td><%=mname%></td>
      <td><%=mtel%></td>
      <td><%=mlevel%></td>
      <td><%=mdate%></td>
    </tr>
<%  
mno+=1;	}
  %>
  </tbody>
</table>

</div>

    <%
    rset.close();
    pstmt.close();
    conn.close();
    
    %>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>