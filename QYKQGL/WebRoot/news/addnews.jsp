<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>发布公告</title>
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
 		var f=document.addnewsform;
		if(f.newstitle.value=="")
		{	
			alert("请输入公告标题！");
        	f.newstitle.focus();
	    	return false;
	    }
	    if(f.newstitle.value.length<=12)
		{	
			alert("公告标题的长度必须大于12个字！");
        	f.newstitle.focus();
	    	return false;
	    } 	
	}
	</script>
  </head>
  
  <body>
  <form name="addnewsform" action="addnews.jsp" method="post" onsubmit="javascript:return check();">
  <br><br>
  <table align = "center" width="85%" border="0" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2">
    <tr>
    	<td colspan="2" align="center" valign="middle" background="img/bg_titlebarr.gif"><span class="STYLE1"><font face="楷体">发布公告</font></span></td>
  	</tr>
  
 	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体">公告标题：</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF">
    		<input type="text" name="newstitle" size="100">&nbsp;<font color="red">**</font>
    	</td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体">公告内容：</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF">
    		<input type="text" name="newscontent" size="100"/>&nbsp;</td>
  	</tr>
  	
  	<tr>
   	 	<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体">发布对象：</font></span></td>
    	<td height="40" align="left" valign="middle" bgcolor="#F9FCFF">
    	  <select name="newsobject" size="1">
        <%
        %>
			<option value="所有部门">所有部门 </option>
		<%
        int depcount = Integer.parseInt(String.valueOf(session.getAttribute("s_depcount")));
        String[] s_depno = (String[])session.getAttribute("s_depno");
        for(int i=1;i<=depcount;i++){
		%>
			<option value="<%=s_depno[i] %>"> <%=s_depno[i] %> </option>
		<%	
		}
        %>
           </select>
      </td>
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
		String newstitle=request.getParameter("newstitle");
		String newscontent=request.getParameter("newscontent");
		String newsobject=request.getParameter("newsobject");
		String newsaddtime=DateFormate.getDateTime();
		NewsManage nm = new NewsManage();
		if(nm.add(newstitle,newscontent,newsobject,newsaddtime))
		{
			out.println("<script language='javascript'>alert('恭喜您，公告发布成功！');</script>");
			response.setHeader("refresh","0;url=newsmanage.jsp");
		}else{
			out.println("<script language='javascript'>alert('Sorry,公告发布失败！');</script>");
		}
	}
%>	   
  </body>
</html>
