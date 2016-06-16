<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>月报表个人详情</title>
<style type="text/css">
<!--
.STYLE1{
	font-size: 22px;
	font-family: 楷体;
	font-weight: bold;
}
.STYLE2 {
	font-size: 20px;
	font-family: 楷体;
}
-->
</style>
<script language="javascript">
</script>

</head>

<body>
<form action="monthreportDetails.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1"  background="../img/intro_bg.jpg" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr>
  	<td height="40" colspan="5" align="center" valign="middle">
  	<strong><font size="6" face="楷体" color="#4B0082">月报表个人详情</font></strong>&nbsp;&nbsp;&nbsp;
  	<input type="button" value="返回" onclick="javascript:history.back();">
  	</td>
  </tr>
  <tr>
  	<th width="162" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">序号</font></th>
    <th width="162" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">员工编号</font></th>
    <th width="162" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">姓名</font></th>
    <th width="220" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">考勤日期</font></th>
    <th width="202" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">考勤情况</font></th>
    </tr>
  
  <%
  	String empid=DateFormate.toGb((String)request.getParameter("empid"));
    String daycdate=DateFormate.toGb((String)request.getParameter("daycdate"));
  	String sql="select * from daycount where emp_id='"+empid+"' and dayc_date like '"+daycdate+"%' order by dayc_id;";
    
	DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		int i=0;
		while(rs.next())
		{	
			i+=1;
			String normal = rs.getString(5); 
			String late = rs.getString(6);	
			String early = rs.getString(7);
			String absence = rs.getString(8);
			String chuchai = rs.getString(9);
			String holidays = rs.getString(10);
			String overtime = rs.getString(11);
			String checkstates = "";
			if("1".equals(normal)){
				checkstates = "正常";
			}else if("1".equals(late)&"1".equals(early)){
				checkstates = "迟到、早退";
			}else if("1".equals(late)&"1".equals(overtime)){
				checkstates = "迟到、加班";
			}else if("1".equals(late)){
				checkstates = "迟到";
			}else if("1".equals(early)){
				checkstates = "早退";
			}else if("1".equals(overtime)){
				checkstates = "加班";
			}else if("1".equals(absence)){
				checkstates = "旷工";
			}else if("1".equals(chuchai)){
				checkstates = "出差";
			}else if("1".equals(holidays)){
				checkstates = "请假";
			}
			
  %>
		<tr>
  			<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=i %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(2) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(3) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(4) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=checkstates %></font></span></td>
    	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("月报表个人详情查询错误，错误信息："+e.getMessage());
	}	
	db.close();
  %>
</table> 
</form>
</body>
</html>
