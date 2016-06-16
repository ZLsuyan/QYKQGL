<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*,java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>个人月报表</title>
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
<% 
java.util.Date nowdate=new java.util.Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
String str=sdf.format(nowdate);
String nowyear=str.substring(0, 4);
String nowmonth=str.substring(4, 6);
%>
</head>

<body>
<form name="personalmonthreportform" action="personalmonthreport.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr style="background-color: #F0FFFF">
  	<td height="40" colspan="12" align="center" valign="middle">
  	<strong><font size="6" face="楷体" color="#4B0082">个人月报表</font></strong>&nbsp;&nbsp;&nbsp;
  	<input type="button" value="返回" onclick="javascript:history.back();">
  	</td>
  </tr>
  <tr bgcolor="#9EC3F2">
  	<td height="25" colspan="6" align="center" valign="bottom"><font size="5" face="楷体" color="#9932CC">统计月份：</font>
  	<select name="year" size="1">
      <option value="2015" selected>2015</option>
      <%
        for(int i=2016;i<2999;i++){
		%>
			<option value="<%=i %>"> <%=i %></option>
		<%	
		}
        %>
    </select>年
    <select name="month" size="1">
      <option value="<%= nowmonth%>" selected><%= nowmonth%></option>
      <option value="01">01</option>
      <option value="02">02</option>
      <option value="03">03</option>
      <option value="04">04</option>
	  <option value="05">05</option>
	  <option value="06">06</option>
	  <option value="07">07</option>
      <option value="08">08</option>
      <option value="09">09</option>
      <option value="10">10</option>
	  <option value="11">11</option>
	  <option value="12">12</option>
    </select>月
	&nbsp;&nbsp;
	 <input type="submit" name="submit" value="查找" style="cursor:pointer;"/>
	  <input name="op" type="hidden" value="search" />
     </td>
  </tr>
  <tr>
  	<th width="122" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">序号</font></th>
    <th width="132" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">员工编号</font></th>
    <th width="152" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">姓名</font></th>
    <th width="152" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">考勤月份</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">正常</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">迟到</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">早退</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">旷工</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">出差</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">请假</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">加班</font></th>
    <th width="112" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">操作</font></th>
  </tr>
  
  <%
  	String empid = String.valueOf(session.getAttribute("s_userid"));
  	String op=DateFormate.toGb((String)request.getParameter("op"));
  	String year=DateFormate.toGb((String)request.getParameter("year"));
    String month=DateFormate.toGb((String)request.getParameter("month"));
    //out.println("<script language='javascript'>alert('"+empid+"');</script>");
    //out.println("<script language='javascript'>alert('"+nowyear+"');</script>");
    //out.println("<script language='javascript'>alert('"+nowmonth+"');</script>");
  	String sql="";
  	if("search".equals(op)){
  		sql="SELECT emp_id,emp_name,sum(dayc_normal),sum(dayc_late),sum(dayc_early),sum(dayc_absence),sum(dayc_chuc),sum(dayc_holi),sum(dayc_overtime) from daycount where dayc_date like '"+year+"-"+month+"%' and emp_id='"+empid+"' group by emp_id;";
  	}else{
	    sql="SELECT emp_id,emp_name,sum(dayc_normal),sum(dayc_late),sum(dayc_early),sum(dayc_absence),sum(dayc_chuc),sum(dayc_holi),sum(dayc_overtime) from daycount where dayc_date like '"+nowyear+"-"+nowmonth+"%' and emp_id='"+empid+"' group by emp_id;";
	 }
    
	DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		int j=0;
		while(rs.next())
		{
			j+=1;
  %>
		<tr>
  			<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=j %></font></span></td>
    		<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(1) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(2) %></font></span></td>
    		<%
    		if(!("search".equals(op))){
    		%>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=nowyear %>-<%=nowmonth %></font></span></td>
    		<%
    		}else{
    		%>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=year %>-<%=month %></font></span></td>
    		<%
    		}
    		%>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(3) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(4) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(5) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(6) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(7) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(8) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(9) %></font></span></td>
    		<%
    		if(!("search".equals(op))){
    		%>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><a href="personalmonthreportDetails.jsp?empid=<%=rs.getString(1)%>&daycdate=<%=nowyear %>-<%=nowmonth %>"><font face="楷体">详情</font></a></span></td>
    		<%
    		}else{
    		%>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><a href="personalmonthreportDetails.jsp?empid=<%=rs.getString(1)%>&daycdate=<%=year %>-<%=month %>"><font face="楷体">详情</font></a></span></td>
    		<%
    		}
    		%>
    	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("月报表查询错误，错误信息："+e.getMessage());
	}	
	db.close();
  %>
</table> 
</form>
</body>
</html>
