<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>请假记录修改</title>
    <style type="text/css">
	<!--
	.STYLE1{
		font-size: 22px;
		font-face: 楷体;
		font-weight: bold;
	}
	-->
	</style>
	
	<script language="javascript">
	function check(){
		var f = document.holiEditform;
		if(f.newempid.value==""){
			alert("员工姓名不能为空！");
			f.newempid.focus();
			return false;
		}
		if(f.newholibegindate.value==""){
			alert("请假开始日期不能为空！");
			f.newholibegindate.focus();
			return false;
		}
		if(f.newholienddate.value==""){
			alert("请假结束日期不能为空！");
			f.newholienddate.focus();
			return false;
		}
		if(f.newholienddate.value<f.newholibegindate.value){
			alert("结束日期不能在开始日期之前！");
			f.newholienddate.focus();
			return false;
		}
	}
	</script>	
  </head>
  
  <body>
  <% 
 	request.setCharacterEncoding("gb2312");
    String op = DateFormate.toGb((String)request.getParameter("op"));
    String holiid = DateFormate.toGb((String)request.getParameter("holiid"));
    DB db=new DB();
    String sql="select emp_id from holidays where holi_id='"+holiid+"'";
    ResultSet rs=db.executeQuery(sql);
    String empid="";
    if(rs.next())
    {
    	empid = rs.getString(1);
    }
    rs.close();
    String sql2="select emp_name,emp_dep from employee where emp_id='"+empid+"'";
    ResultSet rs2=db.executeQuery(sql2);
    String empname = "";
    String empdep = "";
    if(rs2.next())
    {
    	empname = rs2.getString(1);
    	empdep = rs2.getString(2);
    }
    rs2.close();
    String sql3="";
    if("edit".equals(op)){
		sql3="select * from holidays where holi_id='"+holiid+"';";
    }
    try{
		ResultSet rs3=db.executeQuery(sql3);
		rs3.next();
	%>
		<form name="holiEditform" action="holiUpdate.jsp" method="post" onsubmit="javascript:return check();"><br>
		<table width="70%" border="0" align="center" cellpadding="2" cellspacing="2" bgcolor="#9EC3F2" style="font-size:12px">
  		<tr background="img/bg_titlebarr.gif">
  			<td height="40" colspan="2" align="center" valign="middle">
  			<strong><font size="5" face="楷体" color="#4B0082">请假记录修改</font></strong>
  			</td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="40%" height="30" align="right" valign="middle">
   		    <span class="STYLE1"><font size="5" face="楷体">员工姓名:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <select name="newempid" size="1">
   		    <option value="<%=empid %>"> <%=empname %>&nbsp;(<%=empid %>&nbsp;<%=empdep%>) </option>
      		<%
        	int empcount = Integer.parseInt(String.valueOf(session.getAttribute("s_empcount")));
        	String[] s_empid = (String[])session.getAttribute("s_empid");
        	String[] s_empname = (String[])session.getAttribute("s_empname");
        	String[] s_empdep = (String[])session.getAttribute("s_empdep");
        	for(int i=1;i<=empcount;i++){
        		if(empid.equalsIgnoreCase(s_empid[i]))
        		continue;
        		else{
					%>
					<option value="<%=s_empid[i] %>"> <%=s_empname[i] %>&nbsp;(<%=s_empid[i] %>&nbsp;<%=s_empdep[i] %>) </option>
					<%	
				}
			}
       		%>
    		</select>
    		&nbsp;<font color="red">**</font>
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="40%" height="30" align="right" valign="middle">
   		    <span class="STYLE1"><font size="5" face="楷体">开始日期:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newholibegindate" size="40" value="<%=rs3.getString(4)%>">
   		    &nbsp;(例如：2015-04-24)<font color="red">**</font>
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="40%" height="30" align="right" valign="middle" background="img/bg_titlebarr.gif">
   		    <span class="STYLE1"><font size="5" face="楷体">结束日期:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newholienddate" size="40" value="<%=rs3.getString(5)%>">
   		    &nbsp;<font color="red">**</font>
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="40%" height="30" align="right" valign="middle">
   		    <span class="STYLE1"><font size="5" face="楷体">请假原因:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newholireason" size="40" value="<%=rs3.getString(6)%>">
   		    </td>
  		</tr>
  		
  		<tr>
  			<th height="35" colspan="2" style="background-color: #F0FFFF">
  			<input type="hidden" name="holiid" value="<%=holiid%>">
  			<input type="submit" name="submit" value="修改">&nbsp;
  			<input type="reset" name="reset" value="重置">&nbsp;
  			<input type="button" value="返回" onclick="javascript:history.back();">
  			</th>
  		</tr>
  		</table>
  		</form>
	<%
	rs3.close();
	}catch(Exception e){
		System.out.println("请假记录修改错误，错误信息："+e.getMessage());
	}
	db.close();
  %> 
  </body>
</html>
