<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考勤记录</title>
<style type="text/css">
<!--
.STYLE1{
	font-size: 22px;
	font-face: 楷体;
	font-weight: bold;
}
.STYLE2 {
	font-size: 18px;
	font-face: 楷体;
}
-->
</style>
<script language="javascript">
	function check(){
		if(document.checkinformform.checkdateindex.value==""){
			alert("请输入考勤日期！");
			return false;
		}
	}

</script>
</head>

<body>
<form name="checkinformform" action="checkinform.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr style="background-color: #F0FFFF">
  	<td height="45" colspan="7" align="center" valign="middle">
  	<strong><font size="5" face="楷体" color="#4B0082">考勤记录查询</font></strong></td>
  </tr>
  <tr bgcolor="#9EC3F2">
    <td height="25" colspan="7" align="left" valign="middle"><font size="5" face="楷体" color="#9932CC">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;考勤日期：</font>
      <input name="checkdateindex" type="text" size="24" />（示例：2015-06-26）
      <input type="submit" name="submit" value="查找" style="cursor:pointer;"/>
      <input name="op" type="hidden" value="search" />
    </td>
  </tr>
  <tr>
  	<th width="142" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">序号</font></th>
    <th width="142" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">员工编号</font></th>
    <th width="162" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">姓名</font></th>
    <th width="232" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">上班时间</font></th>
    <th width="232" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">下班时间</font></th>
  </tr>
  
  <%
    String op = DateFormate.toGb((String)request.getParameter("op"));
    String checkdateindex = DateFormate.toGb((String)request.getParameter("checkdateindex"));
    String empid = String.valueOf(session.getAttribute("s_userid"));
    String sql="";
    if("search".equals(op)){
		sql="select * from checkkq where check_begintime like '"+checkdateindex+"%' and emp_id='"+empid+"' order by check_id desc;";
    }else{
		sql="select * from checkkq where emp_id='"+empid+"' order by check_id desc;";
    }
    String empname = String.valueOf(session.getAttribute("s_username"));
	DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		int i=0;
		while(rs.next())
		{
			i+=1;
  %>
		<tr>
  			<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=i %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(2) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=empname %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(3) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(4) %></font></span></td>
    	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("考勤记录查询错误，错误信息："+e.getMessage());
	}
	db.close();
  %>
</table> 
</form>
</body>
</html>
