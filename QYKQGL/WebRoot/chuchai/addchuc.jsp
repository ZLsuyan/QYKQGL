<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>发布出差通知</title>
	<style type="text/css">
	<!--
	.STYLE1 {
	font-size: 30px;
	font-weight: bold;
	}
	.STYLE2 {
	font-size: 26px;
	font-face: 楷体;
	}
	-->
	</style>
	
	<script language="javascript">
 	function check(){
 		var f=document.addchucform;
		if(f.chucbegindate.value=="")
		{	
			alert("请输入出差开始日期！");
        	f.chucbegindate.focus();
	    	return false;
	    } 	
	    if(f.chucenddate.value=="")
		{	
			alert("请输入出差结束日期！");
        	f.chucenddate.focus();
	    	return false;
	    }
	}
	</script>
  </head>
  
  <body>
  <form name="addchucform" action="addchuc.jsp" method="post" onsubmit="javascript:return check();">
  <br><br>
  <table align = "center" width="75%" border="0" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2">
    <tr>
    	<td colspan="2" align="center" valign="middle" background="img/bg_titlebarr.gif"><span class="STYLE1"><font face="楷体">发布出差通知</font></span></td>
  	</tr>
  
 	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体">员工姓名：</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF">
    	<select name="empid" size="1">
      <%
        int generalcount = Integer.parseInt(String.valueOf(session.getAttribute("s_generalcount")));
        String[] s_generalid = (String[])session.getAttribute("s_generalid");
        String[] s_generalname = (String[])session.getAttribute("s_generalname");
        String[] s_generaldep = (String[])session.getAttribute("s_generaldep");
        for(int i=1;i<=generalcount;i++){
		%>
			<option value="<%=s_generalid[i] %>"> <%=s_generalname[i] %>&nbsp;(<%=s_generalid[i] %>&nbsp;<%=s_generaldep[i] %>) </option>
		<%	
		}
        %>
    </select>
    	&nbsp;<font color="red">**</font></td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体">出差开始日期：</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="chucbegindate" size="30"/>&nbsp;(例如：2015-06-26)<font color="red">**</font></td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体">出差结束日期：</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="chucenddate" size="40"/>&nbsp;<font color="red">**</font></td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体">出差地点：</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="chucplace" size="40"/></td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体">出差内容：</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF"><input type="text" name="chuccontent" size="50"/></td>
  	</tr>
  	
  	<tr>
    	<td colspan="2" height="40" align="center" valign="middle" bgcolor="#F9FCFF">
    	<input type="submit" value="提交" name="submit">
    	<input type="reset" value="重置" name="reset">&nbsp;
    	<input type="button" value="返回" onclick="javascript:history.back();">
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
		String chucbegindate=request.getParameter("chucbegindate");
		String chucenddate=request.getParameter("chucenddate");
		String chucplace=request.getParameter("chucplace");
		String chuccontent=request.getParameter("chuccontent");
		ChucManage cm = new ChucManage();
		if(cm.add(empid,chucbegindate,chucenddate,chucplace,chuccontent))
		{
			out.println("<script language='javascript'>alert('恭喜您，出差信息发布成功！');</script>");
			response.setHeader("refresh","0;url=chucmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,出差信息发布失败！');</script>");
		}
	}
%>	   
  </body>
</html>
