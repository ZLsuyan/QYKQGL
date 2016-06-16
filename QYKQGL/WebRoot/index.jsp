<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  errorPage="error.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">  
    <title>用户登录</title>
  </head>
  
  <script language="javascript">
    function checkform(){
	    var f=document.loginform;
        if(f.userid.value==""){
	    	alert("请输入您的用户名！");
        	f.userid.focus();
	    	return false;
	    }
		if(f.password.value==""){
			alert("请输入密码！");
			f.password.focus();
			return false;
		}
	}
	function exit(){
		if(confirm("您真的要退出本系统吗？")){
			window.opener=null;
			window.close();
		}
	}
	</script>
	
  <body leftmargin="0" topmargin="5">
  	<% response.setHeader("Pragma","no-cache");%>
    <form name="loginform" method="post" action="logintest.jsp" onsubmit="javascript:return checkform();">
<table width="1310" border="0" cellpadding="0" cellspacing="0" align="center">
  	<!--DWLayoutTable-->
  	<tr>
    	<td width="1310" height="540" valign="top"><img src="img/login.jpg" width="1310" height="540" border="0" style="boder:1px solid #FF00" /></td>
  	</tr>
</table>
<table width="1310" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#8B4513">
  	<!--DWLayoutTable-->
  	<tr>
    <td width="1310" height="60" align="right" valign="middle" bgcolor="#A0522D">
    <span class="STYLE1">&nbsp; 
         <font face="楷体" size="5" color="#FFF5EE"><strong>用户名:</strong> <input name="userid" type="text" id="userid" size="8" />&nbsp; 
        <strong> 密码: <input type="password" name="password" id="password" size="8"></strong>
    <span style="cursor:hand;"></span></font>&nbsp;
    <input type="radio" name="type" value="admin" checked><strong><font face="楷体" size="5" color="#fff5ee">管理员</font></strong>
    <input type="radio" name="type" value="general"><strong><font face="楷体" size="5" color="#fff5ee">普通员工</font></strong>&nbsp;&nbsp;
    <input type="submit" name="submit" value="登录">
    <input type="reset" name="reset" value="重置" />&nbsp;&nbsp;&nbsp;
	</span>
	</td>
  	</tr>
</table>
</form>

 </body>
</html>

  