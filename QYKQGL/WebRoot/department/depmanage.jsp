<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>部门信息管理</title>
<style type="text/css">
a:active{color:gray}
a:hover{color:red;}
a:link{color:#9932CC}
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
	function del(depname){
		if(confirm("您真的要删除选择的记录吗？")){
			document.location.href="depDelete.jsp?op=del&depname="+depname;
		}
		else{
			document.location.href="depmanage.jsp";
		}	
	}

	function check(){
		if(document.depform.depnameindex.value==""){
			alert("请输入查询内容！");
			return false;
		}
	}
</script>
<% 
	DB db2=new DB();
	String sql2="select count(dep_name) from department;";
	try{
		ResultSet rs2 = db2.executeQuery(sql2);
		if(rs2.next()){
			int depcount = rs2.getInt(1);
			session.setAttribute("s_depcount",depcount);
			rs2.close();
			if(depcount>0){
			String sql3="select dep_name from department order by dep_name;";
			try{
				ResultSet rs3 = db2.executeQuery(sql3);
				String[] s_depno=new String[300];
			  	for(int i=1;i<=depcount;i++){
					rs3.next();
					s_depno[i] = rs3.getString(1);
				}
			 	session.setAttribute("s_depno",s_depno);
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
<form name="depform" action="depmanage.jsp" method="post" onsubmit="javascript:return check();">
<table border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#9EC3F2" style="font-size:12px">
  <!--DWLayoutTable-->
  <tr style="background-color: #F0FFFF">
  	<td height="45" colspan="6" align="center" valign="middle">
  	<strong><font size="5" face="楷体" color="#4B0082">部门信息管理</font></strong></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center" valign="middle">
    <span class="STYLE1"><font size="5" face="楷体">[<a href="adddep.jsp">新增部门</a>]</font></span></td>
    <td height="35" colspan="1" align="center" valign="middle">
      <font size="5" face="楷体">部门总数：</font>
      <input name="depcount" type="text" size="8" disabled value="<%=session.getAttribute("s_depcount") %>"/>
    </td>
    <td height="25" colspan="3" align="center" valign="bottom"><font size="5" face="楷体" color="#9932CC">部门名称：</font>
      	<select name="depnameindex" size="1">
        <%
        %>
			<option value="" selected> </option>
		<%
        int depcount = Integer.parseInt(String.valueOf(session.getAttribute("s_depcount")));
        String[] s_depno = (String[])session.getAttribute("s_depno");
        for(int i=1;i<=depcount;i++){
		%>
			<option value="<%=s_depno[i] %>"> <%=s_depno[i] %> </option>
		<%	
		}
        %>
           </select>
		&nbsp;
      <input type="submit" name="submit" value="查找" style="cursor:pointer;"/>
      <input name="op" type="hidden" value="search" /> </td>
  </tr>
  <tr>
  	<th width="90" height="30" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">序号</font></th>
    <th width="170" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">部门名称</font></th>
    <th width="330" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">部门经营范围</font></th>
    <th width="140" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">部门负责人</font></th>
    <th width="230" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">部门添加时间</font></th>
    <th width="130" align="center" valign="middle" bgcolor="#F9FCFF" class="STYLE1"><font face="楷体">操作</font></th>
  </tr>
  
  <%
    String op=DateFormate.toGb((String)request.getParameter("op"));
    String depnameindex=DateFormate.toGb((String)request.getParameter("depnameindex"));
    String sql="";
    int rownum=0;
    if("search".equals(op)){
		sql="select * from department where dep_name like '"+depnameindex+"%' order by dep_addtime desc;";
    }else{
		sql="select * from department order by dep_addtime desc;";
    }
  	//String sql="set @rownum=0; select @rownum:=@rownum+1 as rownum, dep_name,dep_scale,dep_keeper,dep_addtime from department order by dep_addtime desc;";

    
	DB db=new DB();
	try{
		ResultSet rs=db.executeQuery(sql);
		int i=0;
		while(rs.next())
		{
		i+=1;
  %>
		<tr>
  			<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><%=i %></span></td>
    		<td height="30" align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><%=rs.getString(1) %></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><%=rs.getString(2) %></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><%=rs.getString(3) %></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2"><%=rs.getString(4) %></span></td>
    		<td align="center" valign="middle" bgcolor="#F9FCFF"><span class="STYLE2" onclick="javasciprt:edit();"><a href="depEdit.jsp?op=edit&depname=<%=rs.getString(1)%>"><font face="楷体" color="black">修改</font></a>/</span>
    		<span class="STYLE2" onclick="javasciprt:del();"><a href="depDelete.jsp?op=del&depname=<%=rs.getString(1)%>"><font color="black">删除</font></a></span></td>
 	 	</tr>
  <%
		}
		rs.close();
	}catch(Exception e){
		System.out.println("部门信息查询错误，错误信息："+e.getMessage());
	}
	
	db.close();
  %>
</table>
</form>
</body>
</html>
