<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>出差管理</title>
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
	function del(chucid){
		if(confirm("您真的要删除选择的记录吗？")){
				document.location.href="chucDelete.jsp?op=del&chucid="+chucid;
		}	
	}
	function check(){
		if(document.chucform.chucdateindex.value==""&document.chucform.empidindex.value==""){
			alert("请至少输入一项查询内容！");
			return false;
		}
	}
	
</script>
<%
DB db2 = new DB();
int generalcount;
String[] s_generalid=new String[3000];
String[] s_generalname=new String[3000];
String[] s_generaldep=new String[3000];
String sql2="select count(emp_id) from employee where emp_type='general' order by emp_name;";
	try{
		ResultSet rs2 = db2.executeQuery(sql2);
		if(rs2.next()){
			generalcount = rs2.getInt(1);
			rs2.close();
			if(generalcount>0){
				session.setAttribute("s_generalcount",generalcount);
				String sql3="select emp_id,emp_name,emp_dep from employee where emp_type='general' order by emp_name;";
				try{
					ResultSet rs3 = db2.executeQuery(sql3);
					for(int i=1;i<=generalcount;i++){
						rs3.next();
						s_generalid[i] = rs3.getString(1);
						s_generalname[i] = rs3.getString(2);
						s_generaldep[i] = rs3.getString(3);
					}
		 			session.setAttribute("s_generalid",s_generalid);
		 			session.setAttribute("s_generalname",s_generalname);
		 			session.setAttribute("s_generaldep",s_generaldep);
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
<form name="chucform" action="chucmanage.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr style="background-color: #F0FFFF">
  	<td height="45" colspan="8" align="center" valign="middle">
  	<strong><font size="5" face="楷体" color="#4B0082">出差信息管理</font></strong></td>
  </tr>
  <tr bgcolor="#9EC3F2">
    <td height="25" colspan="5" align="center" valign="middle">
    <span class="STYLE1"><font size="5" face="楷体">[<a href="addchuc.jsp">发布出差通知</a>]</font></span>&nbsp;&nbsp;
    <font size="5" face="楷体" color="#9932CC">出差日期：</font>	<input type="text" name="chucdateindex" size="20"/>（示例：2015-06-26）</td>
    <td height="25" colspan="3" align="center" valign="bottom"><font size="5" face="楷体" color="#9932CC">姓名：</font>
      <select name="empidindex" size="1">
      <option value=""></option>
      <%
        generalcount = Integer.parseInt(String.valueOf(session.getAttribute("s_generalcount")));
        s_generalid = (String[])session.getAttribute("s_generalid");
        s_generalname = (String[])session.getAttribute("s_generalname");
        s_generaldep = (String[])session.getAttribute("s_generaldep");
        for(int i=1;i<=generalcount;i++){
		%>
			<option value="<%=s_generalid[i] %>"> <%=s_generalname[i] %>&nbsp;(<%=s_generalid[i] %>&nbsp;<%=s_generaldep[i] %>) </option>
		<%	
		}
        %>
    </select>
      &nbsp;
      <input type="submit" name="submit" value="查找" style="cursor:pointer;"/>
      <input name="op" type="hidden" value="search" /></td>
  </tr>
  <tr>
  	<th width="102" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">序号</font></th>
    <th width="112" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">员工编号</font></th>
    <th width="112" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">姓名</font></th>
    <th width="152" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">开始日期</font></th>
    <th width="152" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">结束日期</font></th>
    <th width="112" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">出差地点</font></th>
    <th width="172" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">出差内容</font></th>
    <th width="112" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">操作</font></th>
  </tr>
  
  <%
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String chucdateindex=DateFormate.toGb((String)request.getParameter("chucdateindex"));
    String empidindex=DateFormate.toGb((String)request.getParameter("empidindex"));
    String sql="";
    if("search".equals(op)){
  		if((!(chucdateindex.isEmpty()))&(!(empidindex.isEmpty()))){
  			sql="select * from chuchai where ('"+chucdateindex+"' between chuc_begindate and chuc_enddate)and emp_id='"+empidindex+"';";
  		}else if((!(chucdateindex.isEmpty()))&(empidindex.isEmpty())){
  			sql="select * from chuchai where '"+chucdateindex+"' between chuc_begindate and chuc_enddate order by chuc_id desc;";
  		}else if((chucdateindex.isEmpty())&(!(empidindex.isEmpty()))){
  			sql="select * from chuchai where emp_id='"+empidindex+"' order by chuc_id desc;";
  		}
  	}else{
	    sql="select * from chuchai where '1'='1' order by chuc_id desc;";
	 }

    DB db = new DB();
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
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(7) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2" onclick="javasciprt:edit();"><a href="chucEdit.jsp?op=edit&chucid=<%=rs.getString(1)%>"><font face="楷体" color="black">修改</font></a>/</span>
    		<span class="STYLE2" onclick="javasciprt:del();"><a href="chucDelete.jsp?op=del&chucid=<%=rs.getString(1)%>"><font face="楷体" color="black">删除</font></a></span></td>
 	 	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("出差信息查询错误，错误信息："+e.getMessage()); 
	}
	db.close();
  %>
</table> 
</form>
</body>
</html>
