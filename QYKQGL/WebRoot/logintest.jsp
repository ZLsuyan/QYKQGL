<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="error.jsp"%>
<%@ page import="mypackage.*,java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��¼����</title>
</head>

<body>
<%
String userid = request.getParameter("userid");
String password = request.getParameter("password");
String type = request.getParameter("type");
LoginTest lt = new LoginTest();
String username = lt.testUser(userid,password,type);
if(!lt.testUserId(userid)){
	out.println("<script language='javascript'>alert('�û��������ڣ�');</script>");
	response.setHeader("refresh","0;url=index.jsp");
}else if(username!=null&&!username.equals("")){
		session.setAttribute("s_userid",userid);
		session.setAttribute("s_userpassword",password);
		session.setAttribute("s_usertype",type);
		session.setAttribute("s_username",username);
		response.sendRedirect("mainframe.jsp");
}else{
%>
<script language="javascript">
	alert("��¼ʧ�ܣ������µ�¼��");
	document.location.href="index.jsp";
</script>
<%	
}
%>
</body>
</html>
