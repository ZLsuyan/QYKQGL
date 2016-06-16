<%@ page contentType="text/html; charset=gb2312" language="java" pageEncoding="gb2312" errorPage="../error.jsp"%>
<%@ page import="mypackage.*,java.util.*,java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>考勤信息修改</title>
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
		var f = document.checkEditform;
		if(f.newempid.value==""){
			alert("员工姓名不能为空！");
			f.newempid.focus();
			return false;
		}
		if(f.newcheckbegintime.value==""){
			alert("上班时间不能为空！");
			f.newcheckbegintime.focus();
			return false;
		}
		if(f.newcheckendtime.value==""){
			alert("下班时间不能为空！");
			f.newcheckendtime.focus();
			return false;
		}
	}
	</script>	
  </head>
  
  <body>
  <% 
 	request.setCharacterEncoding("gb2312");
    String op = DateFormate.toGb((String)request.getParameter("op"));
    String checkid = DateFormate.toGb((String)request.getParameter("checkid"));
    DB db=new DB();
    String sql="select emp_id from checkkq where check_id='"+checkid+"'";
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
		sql3="select * from checkkq where check_id='"+checkid+"';";
    }
    try{
		ResultSet rs3=db.executeQuery(sql3);
		rs3.next();
	%>
		<form name="checkEditform" action="checkUpdate.jsp" method="post" onsubmit="javascript:return check();"><br><br><br>
		<table width="70%" border="0" align="center" cellpadding="2" cellspacing="2" bgcolor="#9EC3F2" style="font-size:12px">
  		<tr background="img/bg_titlebarr.gif">
  			<td height="40" colspan="2" align="center" valign="middle">
  			<strong><font size="5" face="楷体" color="#4B0082">考勤记录修改</font></strong>
  			</td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="20%" height="30" align="right" valign="middle">
   		    <span class="STYLE1"><font size="5" face="楷体">员工姓名:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <select name="newempid" size="1">
   		    <option value="<%=empid %>"selected> <%=empname %>&nbsp;(<%=empid %>&nbsp;<%=empdep%>) </option>
      		<%
        	int empcount = Integer.parseInt(String.valueOf(session.getAttribute("s_empcount")));
        	String[] s_empid=(String[])session.getAttribute("s_empid");
			String[] s_empname=(String[])session.getAttribute("s_empname");
			String[] s_empdep=(String[])session.getAttribute("s_empdep");
        	for(int i=1;i<=empcount;i++){
        		if(empid.equalsIgnoreCase(s_empid[i]))
        		continue;
        		else{
        		%>
					<option value="<%=s_empid[i]%>"> <%=s_empname[i]%>&nbsp;(<%=s_empid[i]%>&nbsp;<%=s_empdep[i] %>) </option>
				<%	
				}
			}
       		%>
    		</select>
    		&nbsp;<font color="red">**</font>
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="20%" height="30" align="right" valign="middle">
   		    <span class="STYLE1"><font size="5" face="楷体">上班时间:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newcheckbegintime" size="40" value="<%=rs3.getString(3)%>">
   		    &nbsp;(例如：2015-04-24 07:58:56)<font color="red">**</font>
   		    </td>
  		</tr>
  		
  		<tr style="background-color: #F0FFFF">
  			<th width="20%" height="30" align="right" valign="middle" background="img/bg_titlebarr.gif">
   		    <span class="STYLE1"><font size="5" face="楷体">下班时间:</font></span>
   		    </th>
   		    <td align="left" valign="middle" background="img/bg_titlebarr.gif">
   		    <input type="text" name="newcheckendtime" size="40" value="<%=rs3.getString(4)%>">
   		    &nbsp;(例如：2015-04-25 18:30:06)<font color="red">**</font>
   		    </td>
  		</tr>
  		
  		<tr>
  			<th height="35" colspan="2" style="background-color: #F0FFFF">
  			<input type="hidden" name="checkid" value="<%=checkid%>">
  			<input type="submit" name="submit" value="修改">&nbsp;
  			<input type="reset" name="reset" value="重置">&nbsp;
  			<input type="button" value="返回" onclick="javascript:history.back();">
  			</th>
  		</tr>
  		</table>
  		</form>
	<%
	rs.close();
	}catch(Exception e){
		System.out.println("考勤记录修改错误，错误信息："+e.getMessage());
	}
	db.close();
  %> 
  </body>
</html>
