<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考勤统计报表</title>
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
<script language="javascript" type="text/javascript">
	function changeFrame(filename){
		parent.mainFrame.document.location.href=filename;
	}		
</script>
<% 
DB db = new DB();
String sql="select count(emp_id) from employee order by emp_name;";
	try{
		ResultSet rs = db.executeQuery(sql);
		if(rs.next()){
			int empcount = rs.getInt(1);
			rs.close();
			if(empcount>0){
				session.setAttribute("s_empcount",empcount);
				String sql2="select emp_id,emp_name,emp_dep from employee order by emp_name;";
				try{
					ResultSet rs2 = db.executeQuery(sql2);
					String[] s_empid=new String[3000];
					String[] s_empname=new String[3000];
					String[] s_empdep=new String[3000];
					for(int i=1;i<=empcount;i++){
						rs2.next();
						s_empid[i] = rs2.getString(1);
						s_empname[i] = rs2.getString(2);
						s_empdep[i] = rs2.getString(3);
					}
					session.setAttribute("s_empid",s_empid);
					session.setAttribute("s_empname",s_empname);
					session.setAttribute("s_empdep",s_empdep);
					rs2.close();
				}catch(Exception e){
				}
			}
		}
	}catch(Exception e){
	}
	db.close();
	%>
</head>

<body>
<table width="1000" height="330" border="0" align="center" cellpadding="0" cellspacing="1" style="font-size:12px" background="../img/intro_bg.jpg">
  <!--DWLayoutTable-->
  <tr>
    <td height="25" align="center" valign="bottom">
  	</td>
  </tr>
  <tr>
  	<td height="80" align="center" valign="middle">
  	<strong><font size="6" face="楷体" color="#4B0082">考勤信息统计报表</font></strong></td>
  </tr>
  <tr>
    <td height="70" align="center" valign="bottom">
      <span onclick="javascript:changeFrame('dayreport.jsp');" style="cursor:hand;">
     <input type="button" name="dayreport" value="   日    报    表     "  style="background:#B0C4DE;cursor:pointer; ">
  	</span>
  	</td>
  </tr>
  <tr>
    <td height="70" align="center" valign="bottom">
      <span onclick="javascript:changeFrame('monthreport.jsp');" style="cursor:hand;">
     <input type="button" name="monthreport" value="   月    报    表     "  style="background:#B0C4DE;cursor:pointer; ">
  	</span>
  	</td>
  </tr>
  <tr>
    <td height="70" align="center" valign="bottom">
      <span onclick="javascript:changeFrame('yearreport.jsp');" style="cursor:hand;">
     <input type="button" name="yearreport" value="年    终    报    表 "  style="background:#B0C4DE;cursor:pointer; ">
  	</span>
  	</td>
  </tr>
  <tr>
    <td height="137" align="center" valign="bottom">
  	</td>
  </tr>
  
</table> 
</body>
</html>
