<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>���ڲ�¼</title>
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
 		var f=document.addcheckform;
		if(f.empid.value=="")
		{	
			alert("Ա����������Ϊ�գ�");
        	f.empid.focus();
	    	return false;
	    } 	
	    if(f.checkbegintime.value=="")
		{	
			alert("�������ϰ�ʱ�䣡");
        	f.checkbegintime.focus();
	    	return false;
	    }
	    if(f.checkendtime.value=="")
		{	
			alert("�������°�ʱ�䣡");
        	f.checkendtime.focus();
	    	return false;
	    }
	}
	</script>
  </head>
  
  <body>
  <form name="addcheckform" action="addcheck.jsp" method="post" onsubmit="javascript:return check();">
  <br><br>
  <table align = "center" width="75%" border="0" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2">
    <tr>
    	<td colspan="2" align="center" valign="middle" background="img/bg_titlebarr.gif"><span class="STYLE1"><font face="����">���ڲ�¼</font></span></td>
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
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����">�ϰ�ʱ�䣺</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="checkbegintime" size="30"/>&nbsp;(���磺2015-06-26 07:58:23)<font color="red">**</font></td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="����">�°�ʱ�䣺</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="checkendtime" size="40"/>&nbsp;<font color="red">**</font></td>
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
		String checkbegintime=request.getParameter("checkbegintime");
		String checkendtime=request.getParameter("checkendtime");
		CheckManage cm = new CheckManage();
		if(cm.add(empid,checkbegintime,checkendtime))
		{
			out.println("<script language='javascript'>alert('��ϲ�������ڲ�¼�ɹ���');</script>");
			response.setHeader("refresh","0;url=checkmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,���ڼ�¼��¼ʧ�ܣ�');</script>");
		}
	}
%>	   
  </body>
</html>
