<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %> 
<%@ page import = "smember.comment.bean.Comment_SmemberDAO" %>
<%@ page import = "smember.comment.bean.Comment_SmemberDTO" %>
<%@ page import="java.util.List" %>    
<jsp:useBean class = "bean.SmemberDTO" id= "dto" />
<jsp:setProperty property="num" name="dto" />  
<html>
<%
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	SmemberDAO dao = new SmemberDAO();
	dao.readCountUp(dto);
	dto = dao.getContent(dto);
	
	

%>

<link href="style.css" rel="stylesheet" type="text/css">
<style>
	section {
			 display: table; margin-left: auto; margin-right: auto;
	}
	.mDetail{  border-style : groove; width : 100%; height : 100%; text-align : center;
	}
</style>
<header>
	<div class="logo">
		<a href="/goworker/main/index.jsp"><img src="image/logo.png" width= "80" height="80"/></a>
		
	</div>
	<div class="sideicon" align="right" width="400" height="70">
		<br/>
		<a href="">쪽지함</a>&emsp;
		<input type="button" name="signin" value="가입하기" class="sign"/>&emsp;
		<input type="button" name="login" value="로그인" class="login"/>&emsp;
	</div>


</header>
<hr color="skyblue" size="2"  align="center" />
<title>멤버 상세정보</title>


<section>
	<table class="mDetail" border=1>
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>분야</th>
			<td><%=dto.getField() %></td>
		</tr>
		<%--if (field의 값 == dev){--%>
		<tr>
			<th>개발언어</th>
			<td><%=dto.getLang() %></td>
		</tr>
		
		<%-- }--%>
		<tr>
			<th>근무형태</th>		
			<td><%=dto.getWorktype() %> </td>
		</tr>
		<tr>
			<th>지역</th>		
			<td><%=dto.getLocation() %> </td>
		</tr>
		<tr>
			<th>고용타입</th>		
			<td><%=dto.getEmploytype()%></td>
		</tr>
		<tr>
			<th>시작가능 일자</th>		
			<td><%=dto.getPeriod() %></td>
		</tr>
		<tr>
			<th>희망급여</th>		
			<td><%=dto.getPay() %>만원 선</td>
		</tr>
		<tr>
			<th><img src="image/phone.png" width="25px" height="25px" ></th>		
			<td><%=dto.getPhone() %></td>
		</tr>
		<tr>
			<th><img src="image/kakao-talk.png" width="25px" height="25px" ></th>		
			<td><%=dto.getKakao() %></td>
		</tr>
		<tr>
			<th><img src="image/email.png" width="25px" height="25px" ></th>		
			<td><a href="mailto:﻿"<%=dto.getEmail() %>">메일보내기</a></td>
		</tr>
		<tr>
			<th>포트폴리오</th>		
			<td><a href="<%=dto.getPortfolio() %>">포트폴리오 주소</a></td>
		</tr>
		<tr>
			<th>자기소개</th>		
			<td width="400px"><%=dto.getIntroduce() %></td>
		</tr>
		
	</table><br/>
	<form align="center">
		<input type="button" value="쪽지 보내기" />
		<input type="button" value="목록으로" onclick="window.location='s-member.jsp?pageNum=<%=pageNum%>'"/>
	</form>

</section>
	<body>



 
	<div class="titletext"><b>서비스 평가</b><br/></div>
  <div class="smallfont">실제 Go-Worker 이용자들이 남긴 평가입니다.</div>
<br>

<form action="comment/commentPro.jsp" name="writeform" method="get" >
		<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
  작성자: <input type="text" size="20"  name="comment_writerid" > <br/><br/>
		<textarea class="form-control" cols="100" rows="5" name="comment_content" placeholder="댓글을 입력하세요."></textarea><br/>		
		<input type="submit" value="댓글 쓰기"/>
		<input type="reset" value="다시 쓰기"/>
 </form>
 
 
</body>

<% 	
	
	
	
	
	Comment_SmemberDAO cdao = new Comment_SmemberDAO();
	int count = 0; 
	List<Comment_SmemberDTO> list = null;	
			
		count = cdao.getCount(); // 전체 글의 갯수
		if(count > 0) {
			list = cdao.getComment( dto.getNum() );	
		}	

	
	
	
				
%>

<% 
if(count > 0) { 
for(Comment_SmemberDTO cdto : list)  {%>
<div >
	<table class="comments" border=1>
		<tr>
			<th><%=cdto.getComment_writerid() %></th>
			
			<th colspan=2><%=cdto.getComment_regdate() %></th>
			
		</tr>
		<tr>	
			<td width="500px" colspan=4><%=cdto.getComment_content() %>
			</td>
		</tr>
	</table>

</div>
<%} 
} %>

<footer>
<hr color="skyblue" size="2"  align="center" />





<table width="500" align="right">
      
      <thead align="center">
        <tr>
          <th></th>
          <th>메인</th>
          <th>회원</th>
          <th>고객센터</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>사이트소개</td>
          <td><a href="/goworker/s-member/s-member.jsp">팀원찾기</a></td>
          <td>회원가입</td>
          <td>공지사항</td>
          
        </tr>
        <tr>
          <td>이용방법</td>
          <td>프로젝트찾기</td>
          <td>회원정보수정</td>
          <td>Q&A</td>
        </tr>
        <tr>
          <td></td>
          <td>프로젝트만들기</td>
          <td>회원탈퇴</td>
          <td></td>
        </tr>
        <tr>
            <td></td>
            <td>취업정보</td>
            <td></td>
            <td></td>
          </tr>
        <tr>
          <td></td>
          <td>커뮤니티</td>
          <td></td>
          <td></td>
        </tr>
      </tbody>
      
    </table>
</footer>

</html>