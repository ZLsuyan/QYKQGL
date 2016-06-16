<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>个人日报表</title>
<style type="text/css">
<!--
.STYLE1{
	font-size: 22px;
	font-family: 楷体;
	font-weight: bold;
}
.STYLE2 {
	font-size: 18px;
	font-family: 楷体;
}
-->
</style>
<script language="javascript">
</script>

</head>

<body>
<form name="personaldayreportform" action="personaldayreport.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1"  background="../img/intro_bg.jpg" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr>
  	<td height="40" colspan="5" align="center" valign="middle">
  	<strong><font size="6" face="楷体" color="#4B0082">个人日报表</font></strong>&nbsp;&nbsp;&nbsp;
  	<input type="button" value="返回" onclick="javascript:history.back();">
  	</td>
  </tr>
  <tr bgcolor="#9EC3F2">
  	<td height="25" colspan="3" align="center" valign="bottom"><font size="5" face="楷体" color="#9932CC">考勤日期：</font>
  	<input type="text" name="daycdateindex" size="20"/>（示例：2015-06-26）
  	</td>
   
	<td height="25" colspan="2" align="center" valign="bottom">
      <input type="submit" name="submit" value="查找" style="cursor:pointer;"/>
	  <input name="op" type="hidden" value="search" />
     </td>
  </tr>
  <tr>
  	<th width="162" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">序号</font></th>
  	<th width="162" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">员工编号</font></th>
    <th width="162" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">姓名</font></th>
    <th width="182" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">考勤日期</font></th>
    <th width="182" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">考勤情况</font></th>
    </tr>
  
  <%
  	String empid = String.valueOf(session.getAttribute("s_userid"));
  	String op=DateFormate.toGb((String)request.getParameter("op"));
  	String daycdateindex=DateFormate.toGb((String)request.getParameter("daycdateindex"));
    //out.println("<script language='javascript'>alert('"+empid+"');</script>");
    //out.println("<script language='javascript'>alert('"+daycdateindex+"');</script>");
  	String sql="";
  	if("search".equals(op)){
  		if(!(daycdateindex.isEmpty())){
  			sql="select * from daycount where dayc_date='"+daycdateindex+"' and emp_id='"+empid+"';";
  		}else if(daycdateindex.isEmpty()){
  			sql="select * from daycount where emp_id='"+empid+"' order by dayc_id desc;";
  		}
  	}else{
	    sql="select * from daycount where emp_id='"+empid+"' order by dayc_id desc;";
	 }
    
	DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		int i = 0;
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
		System.out.println("日报表查询错误，错误信息："+e.getMessage());
	}	
	db.close();
  %>
</table> 
</form>
</body>
</html>
