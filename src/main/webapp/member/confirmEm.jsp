<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.bean.DAO" %>
<title>check</title>

<jsp:useBean id="dto" class="member.bean.DTO" />
<jsp:setProperty name="dto" property="*" />

<%	
	DAO dao = new DAO();
	boolean result= dao.emailCheck(dto);
	String str="��밡��";
	if(result==true)
	{		
		str="���Ұ���";
	%>
	<script>
		alert("������� �̸����Դϴ�.");
		
	</script>
  <%}else{%>
	<script>
	 	alert("��� �����մϴ�."); 
	 	
	</script>
<%}%>

<script>
		function returnClose(){
			opener.document.getElementById("emCheck").innerHTML='<font color=red><%=str%></font>';
			self.close();
		}
	
	</script>
	<input type="button" value="�ݱ�" onclick="returnClose();"/>