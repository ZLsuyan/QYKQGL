<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="error.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
-->
</style>
<script language="javascript">
	function exit(){
		if(confirm("�����Ҫ�˳���ϵͳ��")){
			parent.document.location.href="index.jsp";
		}
		else{
			parent.mainFrame.document.location.herf="main.html";
		}
	}
	function modifypwd(){
		parent.mainFrame.document.location.href="modifypwd.html";
	}
</script>
</head>

<body leftmargin="0" topmargin="0" bgcolor="#F7F7F7">

<table width="1366" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td height="80" colspan="3" align="center" valign="bottom" background="img/top.jpg"><strong>&nbsp;&nbsp;<font face="����" size="5">��ҵԱ�����ڹ���ϵͳ</font></strong></td>
  </tr>
  <tr>
    <td width="243" height="30" align="left" valign="bottom" background="img/bg_titlebarr.gif" class="STYLE1" style="border-bottom:1px solid #9EC3F2">&nbsp;<img height="7" width="7" src="img/topicon.gif" /><font size="4" face="����" color="#000040"> <font color="#8000ff">�𾴵�</font> <%=session.getAttribute("s_username") %><font color="#8000ff">������!</font></font></td>
    <td width="680" align="left" valign="bottom" background="img/bg_titlebarr.gif" style="border-bottom:1px solid #9EC3F2"><font color="#000040"><span class="STYLE1">  
      </span></font><br /></td>
    <td width="443" align="right" valign="middle" background="img/bg_titlebarr.gif" class="STYLE1" style="border-bottom:1px solid #9EC3F2"><span onclick="javasciprt:modifypwd();"><input type="button" name="modifypwd" value="�޸ĸ�������" style="background:#B0C4DE;cursor:pointer; "/></span>&nbsp;&nbsp;<span onclick="javasciprt:exit();"><input type="button" name="exit" value="�˳�ϵͳ" style="background:#B0C4DE;cursor:pointer;"/></span></td>
  </tr>
</table>
</body>
</html>
