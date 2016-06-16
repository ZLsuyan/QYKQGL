<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>员工信息管理</title>
<style type="text/css">
a:active{color:gray}
a:hover{color:red}
a:link{color:#9932CC}
<!--
.STYLE1{
	font-size: 22px;
	font-face: 楷体;
	font-weight: bold;
}
.STYLE2 {
	font-size: 20px;
	font-face: 楷体;
}
-->
</style>
<script language="javascript">
	function del(empid){
		if(confirm("您真的要删除选择的记录吗？")){
			document.location.href="empDelete.jsp?op=del&empid="+empid;
		}
		else{
			document.location.href="empmanage.jsp";
		}	
	}

	function check(){
		if(document.empform.empidindex.value==""){
			alert("请输入查询内容！");
			return false;
		}
	}
</script>
<%
DB db2 = new DB();
	String sql3="select count(emp_id) from employee;";
	try{
		ResultSet rs3 = db2.executeQuery(sql3);
		if(rs3.next()){
			int empcount = rs3.getInt(1);
			session.setAttribute("s_empcount",empcount);
			rs3.close();
		}
	}catch(Exception e){
	}

	String sql4="select count(emp_id) from employee where emp_type='admin';";
	try{
		ResultSet rs4 = db2.executeQuery(sql4);
		if(rs4.next()){
			int admincount = rs4.getInt(1);
			session.setAttribute("s_admincount",admincount);
			rs4.close();
		}
	}catch(Exception e){
	}
	
	String sql5="select count(emp_id) from employee where emp_type='general';";
	try{
		ResultSet rs5 = db2.executeQuery(sql5);
		if(rs5.next()){
			int generalcount = rs5.getInt(1);
			session.setAttribute("s_generalcount",generalcount);
			rs5.close();
		}
	}catch(Exception e){
	}

	String sql6="select count(emp_id) from employee order by emp_name;";
	try{
		ResultSet rs6 = db2.executeQuery(sql6);
		if(rs6.next()){
			int empcount = rs6.getInt(1);
			rs6.close();
			if(empcount>0){
				session.setAttribute("s_empcount",empcount);
				String sql7="select emp_id,emp_name,emp_dep from employee order by emp_name;";
				try{
					ResultSet rs7 = db2.executeQuery(sql7);
					String[] s_empid=new String[3000];
					String[] s_empname=new String[3000];
					String[] s_empdep=new String[3000];
					for(int i=1;i<=empcount;i++){
						rs7.next();
						s_empid[i] = rs7.getString(1);
						s_empname[i] = rs7.getString(2);
						s_empdep[i] = rs7.getString(3);
					}
					session.setAttribute("s_empid",s_empid);
					session.setAttribute("s_empname",s_empname);
					session.setAttribute("s_empdep",s_empdep);
					rs7.close();
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
<form name="empform" action="empmanage.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <caption><strong><font size="5" face="楷体" color="#4B0082">员工信息管理</font></strong></caption>
  <tr style="background-color: #F0FFFF">
    <td height="35" colspan="3" align="center" valign="middle">
    <span class="STYLE2"><font size="5" face="楷体">员工人数：</font></span>
      <input name="empcount" type="text" disabled size="8" value="<%=session.getAttribute("s_empcount") %>"/>
    </td>
  	<td height="35" colspan="3" align="center" valign="middle">
    <span class="STYLE2"><font size="5" face="楷体">管理员人数：</font></span>
      <input name="admincount" type="text" disabled size="8" value="<%=session.getAttribute("s_admincount") %>"/>
    </td>
    <td height="35" colspan="3" align="center" valign="middle">
    <span class="STYLE2"><font size="5" face="楷体">普通员工人数：</font></span>
      <input name="generalcount" type="text" disabled size="8" value="<%=session.getAttribute("s_generalcount") %>"/>
    </td>
  </tr>

  <tr>
    <td height="25" colspan="4" align="center" valign="middle">
    <span class="STYLE1"><font size="5" face="楷体">[<a href="addemp.jsp">新增员工</a>]</font></span></td>
    
    <td height="25" colspan="4" align="center" valign="bottom"><font size="5" face="楷体" color="#9932CC">姓名：</font>
      <select name="empidindex" size="1">
      <option value=""></option>
      <%
        int e_empcount = Integer.parseInt(String.valueOf(session.getAttribute("s_empcount")));
        String[] e_empid = (String[])session.getAttribute("s_empid");
        String[] e_empname = (String[])session.getAttribute("s_empname");
        String[] e_empdep = (String[])session.getAttribute("s_empdep");
        for(int i=1;i<=e_empcount;i++){
		%>
			<option value="<%=e_empid[i] %>"> <%=e_empname[i] %>&nbsp;(<%=e_empid[i] %>&nbsp;<%=e_empdep[i] %>) </option>
		<%	
		}
        %>
    </select>
      &nbsp;
      <input type="submit" name="submit" value="查找" style="cursor:pointer;"/>
      <input name="op" type="hidden" value="search" /></td>
  </tr>
  
  <tr>
  	<th width="112" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">员工编号</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">姓名</font></th>
    <th width="92" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">性别</font></th>
    <th width="152" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">所属部门</font></th>
    <th width="102" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">角色</font></th>
    <th width="112" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">密码</font></th>
    <th width="92" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">状态</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">政治面貌</font></th>
    <th width="132" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">操作</font></th>
  </tr>
  
  <%
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String empidindex=DateFormate.toGb((String)request.getParameter("empidindex"));
    String sql="";
    if("search".equals(op)){
		sql="select * from employee where emp_id like '"+empidindex+"%' order by emp_id;";
    }else{
		sql="select * from employee order by emp_id;";
    }
	DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		while(rs.next())
		{
  %>
		<tr>
  			<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(1) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(2) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(3) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(4) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(5) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(6) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(7) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=rs.getString(8) %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2" onclick="javasciprt:edit();"><a href="empEdit.jsp?op=edit&empid=<%=rs.getString(1)%>"><font face="楷体" color="black">修改</font></a>/</span>
    		<span class="STYLE2" onclick="javasciprt:del();"><a href="empDelete.jsp?op=del&empid=<%=rs.getString(1)%>"><font face="楷体" color="black">删除</font></a></span></td>
 	 	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("员工信息查询错误，错误信息："+e.getMessage());
	}
	
	int depcount = Integer.parseInt(String.valueOf(session.getAttribute("s_depcount")));
	if(depcount>0){
		String sql2="select dep_name from department order by dep_name;";
		try{
			ResultSet rs2 = db.executeQuery(sql2);
			String[] s_depno=new String[300];
		  	for(int i=1;i<=depcount;i++){
				rs2.next();
				s_depno[i] = rs2.getString(1);
			}
		 	session.setAttribute("s_depno",s_depno);
		 	rs2.close();
		}catch(Exception e){
		}
	}
	
	db.close();
  %>
</table> 
</form>
</body>
</html>
