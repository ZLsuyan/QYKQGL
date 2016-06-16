<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>部门信息修改</title>
    <style type="text/css">
	<!--
	.STYLE1{
		font-size: 22px;
		font-face: 楷体;
		font-weight: bold;
	}
	-->
	</style>
	
	<script language="javascript">
	function check(){
		var f = document.depEditform;
		if(f.newdepname.value==""){
			alert("部门名称不能为空！");
			f.newdepname.focus();
			return false;
		}
	}
	</script>	
  </head>
  
  <body>
  <% 
 	request.setCharacterEncoding("gb2312");
    String op = DateFormate.toGb((String)request.getParameter("op"));
    String depname = DateFormate.toGb((String)request.getParameter("depname"));
    String sql="";
    if("edit".equals(op)){
		sql="select * from department where dep_name='"+depname+"';";
    }
    DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		rs.next();
	%>
		<form name="depEditform" action="depUpdate.jsp" method="post" onsubmit="javascript:return check();"><br>
		<table width="70%" border="0" align="center" cellpadding="2" cellspacing="2" bgcolor="#9EC3F2" style="font-size:12px">
  		<tr style="background-color: #F0FFFF">
  			<td height="45" colspan="2" align="center" valign="middle">
  			<strong><font size="5" face="楷体" color="#4B0082">部门信息修改</font></strong>
  			</td>
  		</tr>
  		
  		<tr>
  			<th width="32%" height="30" align="right" valign="middle" background="img/bg_titlebarr.gif">
   		    <span class="STYLE1"><font size="5" face="楷体">部门名称:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newdepname" size="50" value="<%=rs.getString(1)%>">&nbsp;<font color="red">*(必填)*</font>
   		    </td>
  		</tr>
  		
  		<tr>
  			<th width="32%" height="30" align="right" valign="middle" background="img/bg_titlebarr.gif">
   		    <span class="STYLE1"><font size="5" face="楷体">部门经营范围:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newdepscale" size="50" value="<%=rs.getString(2)%>">
   		    </td>
  		</tr>
  		
  		<tr>
  			<th width="32%" height="30" align="right" valign="middle" background="img/bg_titlebarr.gif">
   		    <span class="STYLE1"><font size="5" face="楷体">部门负责人:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newdepkeeper" size="50" value="<%=rs.getString(3)%>">
   		    </td>
  		</tr>
  		
  		<tr>
  			<th height="35" colspan="2" style="background-color: #F0FFFF">
  			<input type="hidden" name="depname" value="<%=depname%>">
  			<input type="submit" name="submit" value="修改">&nbsp;
  			<input type="reset" name="reset" value="重置">&nbsp;
  			<input type="button" value="返回" onclick="javascript:history.back();">
  			</th>
  		</tr>
  		</table>
  		</form>
	<%
	rs.close();
	}catch(Exception e){
		System.out.println("部门信息修改错误，错误信息："+e.getMessage());
	}
	db.close();
  %> 
  </body>
</html>
