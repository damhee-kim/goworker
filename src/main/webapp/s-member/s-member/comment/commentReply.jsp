<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@ page import = "smember.comment.bean.Comment_SmemberDAO" %>
<%@ page import = "smember.comment.bean.Comment_SmemberDTO" %>
    
<%request.setCharacterEncoding("UTF-8"); %>
    
<jsp:useBean class= "smember.comment.bean.Comment_SmemberDTO"  id="cdto" />
<jsp:setProperty property="*" name="cdto" />   
    
<%	
	String pageNum = request.getParameter("pageNum");

%>

    
<form action="commentReplyPro.jsp" name="commentreplyform" method="post">
	<input type="hidden" name="board_num" value="<%=cdto.getBoard_num() %>"/>
	<input type="hidden" name="comment_num" value="<%=cdto.getComment_num()%>"/>
	<input type="hidden" name="comment_ref" value="<%=cdto.getComment_ref()%>">
	<input type="hidden" name="comment_step" value="<%=cdto.getComment_step()%>">
	<input type="hidden" name="comment_level" value="<%=cdto.getComment_level()%>">
	<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
	
	<label for="comment_writerid">작성자: </label> 	
	<input type="text" size="20"  name="comment_writerid" id="comment_writerid"  > <br/><br/>
 	<label for="comment_content">내용: </label>
	<input type="text" size="100" name="comment_content" id="comment_content" style="width:500px;height:100px;"  placeholder="답글을 작성해주세요."><br/><br/>	
		<input type="submit" value="답글작성"/>
		<input type="reset" value="다시작성" />
</form>