<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>���������ʾ</title>
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
 		var f=document.addholiform;
		if(f.holidate.value=="")
		{	
			alert("������������ڣ�");
        	f.holidate.focus();
	    	return false;
	    } 	
	    if(f.holidays.value=="")
		{	
			alert("���������������");
        	f.holidays.focus();
	    	return false;
	    }
	}
	</script>
  </head>
  
  <body>
  <form name="addholiform" action="addholi.jsp" method="post" onsubmit="javascript:return check();">
  <br><br>
  <table align = "center" width="75%" border="0" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2">
    <tr>
    	<td colspan="2" align="center" valign="middle" background="img/bg_titlebarr.gif"><span class="STYLE1"><font face="����">������ټ�¼</font></span></td>
  	</tr>
  
 	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����">Ա��������</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF">
    	<select name="empid" size="1">
      <%
        int empcount = Integer.parseInt(String.valueOf(session.getAttribute("s_empcount")));
        String[] s_empid=(String[])session.getAttribute("s_empid");
		String[] s_empname=(String[])session.getAttribute("s_empname");
		String[] s_empdep=(String[])session.getAttribute("s_empdep");
        for(int i=1;i<=empcount;i++){
		%>
			<option value="<%=s_empid[i]%>"><%= s_empname[i] %>&nbsp;(<%=s_empid[i]%>&nbsp;<%= s_empdep[i] %>) </option>
		<%	
		}
        %>
    </select>
    	&nbsp;<font color="red">**</font></td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����">��ʼ���ڣ�</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="holibegindate" size="30"/>&nbsp;(���磺2015-06-26)<font color="red">**</font></td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����">�������ڣ�</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="holienddate" size="40"/>&nbsp;<font color="red">**</font></td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����">���ԭ��</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="holireason" size="40"/></td>
  	</tr>
  	
  	<tr>
    	<td colspan="2" height="40" align="center" valign="middle" bgcolor="#F9FCFF">
    	<input type="submit" value="�ύ" name="submit">
    	<input type="reset" value="����" name="reset">&nbsp;
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
		String empid=request.getParameter("empid");
		String holibegindate=request.getParameter("holibegindate");
		String holienddate=request.getParameter("holienddate");
		String holireason=request.getParameter("holireason");
		HoliManage hm = new HoliManage();
		if(hm.add(empid,holibegindate,holienddate,holireason))
		{
			out.println("<script language='javascript'>alert('��ϲ���������Ϣ�����ɹ���');</script>");
			response.setHeader("refresh","0;url=holimanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,�����Ϣ����ʧ�ܣ�');</script>");
		}
	}
%>	   
  </body>
</html>
