<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>请假记录管理</title>
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
	function del(holiid){
		if(confirm("您真的要删除选择的记录吗？")){
				document.location.href="holiDelete.jsp?op=del&holiid="+holiid;
		}	
	}
	function check(){
		if(document.holiform.holidateindex.value==""&document.holiform.empidindex.value==""){
			alert("请至少输入一项查询内容！");
			return false;
		}
	}
	
</script>
<% 
DB db2 = new DB();
String sql2="select count(emp_id) from employee order by emp_name;";
	try{
		ResultSet rs2 = db2.executeQuery(sql2);
		if(rs2.next()){
			int empcount = rs2.getInt(1);
			rs2.close();
			if(empcount>0){
				session.setAttribute("s_empcount",empcount);
				String sql3="select emp_id,emp_name,emp_dep from employee order by emp_name;";
				try{
					ResultSet rs3 = db2.executeQuery(sql3);
					String[] s_empid=new String[3000];
					String[] s_empname=new String[3000];
					String[] s_empdep=new String[3000];
					for(int i=1;i<=empcount;i++){
						rs3.next();
						s_empid[i] = rs3.getString(1);
						s_empname[i] = rs3.getString(2);
						s_empdep[i] = rs3.getString(3);
					}
					session.setAttribute("s_empid",s_empid);
					session.setAttribute("s_empname",s_empname);
					session.setAttribute("s_empdep",s_empdep);
					rs3.close();
				}catch(Exception e){
				}
			}
		}
	}catch(Exception e){
	}
	db2.close();
	%>
	
</head>

<body>
<form name="holiform" action="holimanage.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr style="background-color: #F0FFFF">
  	<td height="45" colspan="7" align="center" valign="middle">
  	<strong><font size="5" face="楷体" color="#4B0082">请假信息管理</font></strong></td>
  </tr>
  <tr bgcolor="#9EC3F2">
    <td height="25" colspan="4" align="center" valign="middle">
    <span class="STYLE1"><font size="4" face="楷体">&nbsp;[<a href="addholi.jsp">新增请假记录</a>]</font></span>&nbsp;&nbsp;&nbsp;&nbsp;
	<font size="4" face="楷体" color="#9932CC">请假日期：</font>	<input type="text" name="holidateindex" size="20"/>（示例：2015-06-26）
    </td>
    <td height="25" colspan="3" align="center" valign="bottom"><font size="4" face="楷体" color="#9932CC">姓名：</font>
      <select name="empidindex" size="1">
      <option value=""></option>
      <%
        int h_empcount = Integer.parseInt(String.valueOf(session.getAttribute("s_empcount")));
        String[] h_empid = (String[])session.getAttribute("s_empid");
        String[] h_empname = (String[])session.getAttribute("s_empname");
        String[] h_empdep = (String[])session.getAttribute("s_empdep");
        for(int i=1;i<=h_empcount;i++){
		%>
			<option value="<%=h_empid[i] %>"> <%=h_empname[i] %>&nbsp;(<%=h_empid[i] %>&nbsp;<%=h_empdep[i] %>) </option>
		<%	
		}
        %>
    </select>
      &nbsp;
      <input type="submit" name="submit" value="查找" style="cursor:pointer;"/>
      <input name="op" type="hidden" value="search" /></td>
  </tr>
  <tr>
  	<th width="122" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">序号</font></th>
    <th width="132" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">员工编号</font></th>
    <th width="132" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">姓名</font></th>
    <th width="162" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">开始日期</font></th>
    <th width="162" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">结束日期</font></th>
    <th width="152" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">请假原因</font></th>
    <th width="132" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">操作</font></th>
  </tr>
  
  <%
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String holidateindex=DateFormate.toGb((String)request.getParameter("holidateindex"));
    String empidindex=DateFormate.toGb((String)request.getParameter("empidindex"));
    String sql="";
    if("search".equals(op)){
  		if((!(holidateindex.isEmpty()))&(!(empidindex.isEmpty()))){
  			sql="select * from holidays where ('"+holidateindex+"' between holi_begindate and holi_enddate)and emp_id='"+empidindex+"';";
  		}else if((!(holidateindex.isEmpty()))&(empidindex.isEmpty())){
  			sql="select * from holidays where '"+holidateindex+"' between holi_begindate and holi_enddate order by holi_id desc;";
  		}else if((holidateindex.isEmpty())&(!(empidindex.isEmpty()))){
  			sql="select * from holidays where emp_id='"+empidindex+"' order by holi_id desc;";
  		}
  	}else{
	    sql="select * from holidays where '1'='1' order by holi_id desc;";
	 }
	DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		int i = 0;
		while(rs.next())
		{
			i+=1;
  %>
		<tr>
  			<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=i %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(2) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(3) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(4) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(5) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(6) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2" onclick="javasciprt:edit();"><a href="holiEdit.jsp?op=edit&holiid=<%=rs.getString(1)%>"><font face="楷体" color="black">修改</font></a>/</span>
    		<span class="STYLE2" onclick="javasciprt:del();"><a href="holiDelete.jsp?op=del&holiid=<%=rs.getString(1)%>"><font face="楷体" color="black">删除</font></a></span></td>
 	 	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("请假记录检索错误，错误信息："+e.getMessage());
	}
	db.close();
  %>
</table> 
</form>
</body>
</html>
