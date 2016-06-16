<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>考勤管理</title>
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
	function del(checkid){
		if(confirm("您真的要删除选择的记录吗？")){
				parent.mainFrame.document.location.href="checkDelete.jsp?op=del&checkid="+checkid;
		}	
	}
	function check(){
		if(document.checkform.empidindex.value==""){
			alert("请输入查询内容！");
			return false;
		}
	}
	function daycount(){
		if(confirm("您确定现在做日终处理吗？")){
			parent.mainFrame.document.location.href="checkdaycount.jsp";
		}
	}
	
</script>
<% 
DB db3 = new DB();
String sql3="select count(emp_id) from employee order by emp_name;";
	try{
		ResultSet rs3 = db3.executeQuery(sql3);
		if(rs3.next()){
			int empcount = rs3.getInt(1);
			rs3.close();
			if(empcount>0){
				session.setAttribute("s_empcount",empcount);
				String sql4="select emp_id,emp_name,emp_dep from employee order by emp_name;";
				try{
					ResultSet rs4 = db3.executeQuery(sql4);
					String[] s_empid=new String[3000];
					String[] s_empname=new String[3000];
					String[] s_empdep=new String[3000];
					for(int i=1;i<=empcount;i++){
						rs4.next();
						s_empid[i] = rs4.getString(1);
						s_empname[i] = rs4.getString(2);
						s_empdep[i] = rs4.getString(3);
					}
					session.setAttribute("s_empid",s_empid);
					session.setAttribute("s_empname",s_empname);
					session.setAttribute("s_empdep",s_empdep);
					rs4.close();
				}catch(Exception e){
				}
			}
		}
	}catch(Exception e){
	}
	db3.close();
	%>
</head>

<body>
<form name="checkform" action="checkmanage.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr style="background-color: #F0FFFF">
  	<td height="45" colspan="6" align="center" valign="middle">
  	<strong><font size="5" face="楷体" color="#4B0082">考勤记录管理</font></strong>&nbsp;&nbsp;&nbsp;
  	<span onclick="javasciprt:daycount();">
  	<input type="button" name="daycount" value="日终统计"  style="background:#B0C4DE;cursor:pointer; ">
  	</span>
  	</td>
  </tr>
  <tr bgcolor="#9EC3F2">
    <td height="25" colspan="3" align="center" valign="middle">
    <span class="STYLE1"><font size="4" face="楷体">[<a href="addcheck.jsp">考勤补录</a>]</font></span></td>
    <td height="25" colspan="3" align="center" valign="bottom"><font size="4" face="楷体" color="#9932CC">姓名：</font>
      <select name="empidindex" size="1">
      <option value=""></option>
      <%
        int empcount = Integer.parseInt(String.valueOf(session.getAttribute("s_empcount")));
        String[] s_empid = (String[])session.getAttribute("s_empid");
        String[] s_empname = (String[])session.getAttribute("s_empname");
        String[] s_empdep = (String[])session.getAttribute("s_empdep");
        for(int i=1;i<=empcount;i++){
		%>
			<option value="<%=s_empid[i] %>"> <%=s_empname[i] %>&nbsp;(<%=s_empid[i] %>&nbsp;<%=s_empdep[i] %>) </option>
		<%	
		}
        %>
    </select>
      &nbsp;
      <input type="submit" name="submit" value="查找" style="cursor:pointer;"/>
      <input name="op" type="hidden" value="search" /></td>
  </tr>
  <tr>
  	<th width="112" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">序号</font></th>
    <th width="112" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">员工编号</font></th>
    <th width="122" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">姓名</font></th>
    <th width="242" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">上班时间</font></th>
    <th width="242" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">下班时间</font></th>
    <th width="132" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">操作</font></th>
  </tr>
  
  <%
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String empidindex=DateFormate.toGb((String)request.getParameter("empidindex"));
    String sql="";
    if("search".equals(op)){
		sql="select * from checkkq where emp_id like '"+empidindex+"%' order by check_id desc;";
    }else{
		sql="select * from checkkq order by check_id desc;";
    }
	DB db=new DB();
	DB db2=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		ResultSet rs2=null;
		String[] c_checkid=new String[30000];
		String[] c_empid=new String[30000];
		String[] c_empname=new String[30000];
		String[] c_checkbegintime=new String[30000];
		String[] c_checkendtime=new String[30000];
		int i = 0;
		int j = 0;
		while(rs.next())
		{
			j+=1;
			c_checkid[i] = rs.getString(1);
			c_empid[i] = rs.getString(2);
			c_checkbegintime[i] = rs.getString(3);
			c_checkendtime[i] = rs.getString(4);
			String sql2="select emp_name from employee where emp_id='"+c_empid[i]+"'";
			try
			{
				rs2=db2.executeQuery(sql2);
				if(rs2.next()){
					c_empname[i] = rs2.getString(1);
				}
				
			}
			catch(Exception e){
			}
 %>
		<tr>
  			<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=j %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=c_empid[i] %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=c_empname[i] %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=c_checkbegintime[i] %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><font face="楷体"><%=c_checkendtime[i] %></font></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2" onclick="javasciprt:edit();"><a href="checkEdit.jsp?op=edit&checkid=<%=c_checkid[i]%>"><font face="楷体" color="black">修改</font></a>/</span>
    		<span class="STYLE2" onclick="javasciprt:del();"><a href="checkDelete.jsp?op=del&checkid=<%=c_checkid[i]%>"><font face="楷体" color="black">删除</font></a></span></td>
 	 	</tr>
  <%
		i++;
		}
		rs2.close();
		rs.close();
	}catch(Exception e){
		System.out.println("考勤记录查询错误，错误信息："+e.getMessage()); 
	}
	
	db.close();
	db2.close();
  %>
</table> 
</form>
</body>
</html>
