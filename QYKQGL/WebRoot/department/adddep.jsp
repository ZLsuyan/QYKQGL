<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��������</title>
	<style type="text/css">
	<!--
	.STYLE1 {
	font-size: 30px;
	font-weight: bold;
	}
	.STYLE2 {
	font-size: 26px;
	font-face: ����;
	}
	-->
	</style>
	
	<script language="javascript">
 	function check(){
 		var f=document.adddepform;
		if(f.depname.value=="")
		{	
			alert("�����벿�����ƣ�");
        	f.depname.focus();
	    	return false;
	    } 	
	}
	</script>
  </head>
  
  <body>
  <form name="adddepform" action="adddep.jsp" method="post" onsubmit="javascript:return check();">
  <br><br>
  <table align = "center" width="75%" border="0" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2">
    <tr>
    	<td colspan="2" align="center" valign="middle" background="img/bg_titlebarr.gif"><span class="STYLE1"><font face="����">����������Ϣ</font></span></td>
  	</tr>
  
  	<tr>
    	<td width="38%" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����">�������ƣ�</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="depname" size="50" />&nbsp;<font color="red">*(����)*</font></td>
    </tr>
  
 	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����">���ž�Ӫ��Χ��</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="depscale" size="50"/></td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����">���Ÿ����ˣ�</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="depkeeper" size="40"/></td>
  	</tr>
  	
  	<tr>
    	<td colspan="2" height="40" align="center" valign="middle" bgcolor="#F9FCFF">
    	<input type="submit" value="�ύ" name="submit">&nbsp;
    	<input type="reset" value="����" name="reset">&nbsp;&nbsp;
        <input type="button" value="����" onclick="javascript:history.back();">
        </td>
  	</tr>
  </table>
  </form>

 <% 
 	request.setCharacterEncoding("gb2312");
	String submit=request.getParameter("submit");
	if(submit!=null&&!submit.equals(""))
	{
		String depname=request.getParameter("depname");
		String depscale=request.getParameter("depscale");
		String depkeeper=request.getParameter("depkeeper");
		String depaddtime=DateFormate.getDateTime();
		DepManage dm = new DepManage();
		if(dm.add(depname,depscale,depkeeper,depaddtime))
		{
			session.setAttribute("s_depname",depname);
			session.setAttribute("s_depscale",depscale);
			session.setAttribute("s_depkeeper",depkeeper);
			session.setAttribute("s_depaddtime",depaddtime);
			out.println("<script language='javascript'>alert('��ϲ����������ӳɹ���');</script>");
			response.setHeader("refresh","0;url=depmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,�������ʧ�ܣ�');</script>");
		}
	}
%>	   
  </body>
</html>
