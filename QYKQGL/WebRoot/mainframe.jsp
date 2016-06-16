<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="error.jsp"%>
<%
	String daohang="";
    if("admin".equals(session.getAttribute("s_usertype"))){
		daohang="daohang_admin.html";
	}else if("general".equals(session.getAttribute("s_usertype"))){
 		daohang="daohang_general.html";
	}else{
 		out.println("非法登陆！");
 		return;
 	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>企业员工考勤管理系统</title>
<script type="text/javascript"> </script>
</head>

<frameset rows="17.8%,38,*" cols="*" frameborder="yes" border="1" framespacing="0">
<noframes> 
<body> 
很抱歉，您使用的浏览器不支持框架功能，请转用新的浏览器。 
</body> 
</noframes>
  <frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frame src="<%=daohang%>" name="titleFrame" scrolling="no" noresize="noresize" id="topFrame" title="titleFrame" />
  <frameset cols="22%,*" frameborder="yes" border="4" framespacing="0">
  	<frameset rows="17%,*" frameborder="no" border="0" framespacing="0">
		<frame src="welcome.html" scrolling="no" noresize="noresize"/>
		<frame src="clock.html" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />  
  	</frameset>
  	<frame src="main.html" name="mainFrame" scrolling="auto" noresize="noresize" id="mainFrame" title="mainFrame" />	 
  </frameset>
</frameset>
</html>
